class DefaultCoupons < ActiveRecord::Migration
  def change
    c1 = Coupon.new
    c1.coupon = 'sirenagelato'
    c1.description = 'Free Gelato!'
    c1.limit=10
    c1.save
    
  end
end
