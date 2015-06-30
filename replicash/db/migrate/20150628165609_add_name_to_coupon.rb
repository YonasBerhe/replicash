class AddNameToCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :owner, :string
    add_column :coupons, :image, :string
    add_column :coupons, :tweet, :string
  end
end
