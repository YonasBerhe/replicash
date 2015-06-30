class Coupon < ActiveRecord::Base
  has_and_belongs_to_many :users

  def self.redeem( code: code, user: user )
    coupon = self.where(coupon: code).first
    if coupon && coupon.users.length < coupon.limit
      user.coupons << coupon rescue nil
    end
    return [coupon, self.remaining( code: code ) ]
  end
  def self.remaining( code: code )
    c = self.where(coupon: code).first
    return (c.limit - c.reload.users.length)
  end

end
