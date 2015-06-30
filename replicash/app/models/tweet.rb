class Tweet

  attr_reader :user
  attr_reader :client

  def initialize(user:user)
    if user.twitter.present?
      @user = user
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_KEY']
        config.consumer_secret     = ENV['TWITTER_SECRET']
        config.access_token        = @user.twitter.accesstoken
        config.access_token_secret = @user.twitter.secret
      end
    end
  end

  # https://github.com/sferik/twitter/blob/master/examples/Update.md
  def update(coupon,count)
    require 'open-uri'
    msg = sprintf("%s %s more left.  Get yours now: http://www.sharehorn.com/%s @sharehorn",coupon.tweet, count, coupon.coupon)
    img = (coupon.tweet_image.nil?) ? nil : ( File.new(Rails.root + coupon.tweet_image) rescue nil )
    unless img.nil?
      client.update_with_media(msg,img) #rescue nil
    else
      client.update(msg) rescue nil
    end
  end

  # Follow the sharehorn users
  def follow()
    us = 'sharehorn'
    client.create_friendship!(us) rescue nil
  end
  
end
