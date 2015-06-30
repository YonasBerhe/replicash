class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :coupon
      t.string :description
      t.integer :limit
      t.timestamps null: false
    end
  end
end
