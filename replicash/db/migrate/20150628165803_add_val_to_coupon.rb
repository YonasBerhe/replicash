class AddValToCoupon < ActiveRecord::Migration
  def change
    c = Coupon.where(coupon: 'sirenagelato').first
    c.owner = 'Sirena Gelato'
    c.image = 'assets/SirenaGelato.jpg'
    c.description = 'You got a free gelato from Sirena Gelato!'
    c.tweet = 'I got a free gelato from Sirena Gelato for this tweet!'
    c.save
  end
end
