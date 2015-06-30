class CouponUser < ActiveRecord::Migration
  def change
    create_table :coupons_users, :id => false do |t|
      t.references :coupon, :null => false
      t.references :user, :null => false
    end
  end
end
