class AddImageToCouponTweet < ActiveRecord::Migration
  def change
    add_column :coupons, :tweet_image, :string
    Coupon.reset_column_information
    c = Coupon.where(coupon: 'sirenagelato').first
    c.tweet_image = 'https://pbs.twimg.com/media/CIj4qPfUwAA9jJq.png'
    c.save
  end
end
