class MoveImage < ActiveRecord::Migration
  def change
    c = Coupon.where(coupon: 'sirenagelato').first
    c.image = 'SirenaGelato.jpg'
    c.save
  end
end
