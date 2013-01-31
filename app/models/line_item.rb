class LineItem < ActiveRecord::Base
  belongs_to :sourceable, polymorphic: true
  belongs_to :order, counter_cache: true

  delegate :description, :price, to: :sourceable

  def total
    quantity * price
  end
end
