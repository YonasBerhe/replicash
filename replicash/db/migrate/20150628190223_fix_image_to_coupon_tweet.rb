class FixImageToCouponTweet < ActiveRecord::Migration
  def change
    c = Coupon.where(coupon: 'sirenagelato').first
    c.tweet_image = 'app/assets/images/sirena.png'
    c.save
  end
end
