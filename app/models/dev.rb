class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    self.freebies.exists?(:item_name => item_name)
  end

  def give_away(dev, freebie)
    if self.received_one?(freebie.item_name)
      freebie.update(dev: dev)
    else
      "you can't give this away because it's not yours"
    end
  end
end
