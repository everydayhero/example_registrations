class Registration < ActiveRecord::Base
  belongs_to :charity

  has_one :individual_page
  has_one :line_item, as: :polymorphic

  def description
    distance
  end

  def price
    case distance
    when '3km'  then 10
    when '5km'  then 50
    when '10km' then 80
    when '21km' then 100
    end
  end
end
