class AddIndexCouponUsers < ActiveRecord::Migration
  def change
    add_index :coupons_users, [:coupon_id,:user_id], :unique => true
  end
end
