class Registration < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :charity

  has_one :individual_page
  has_one :line_item, as: :polymorphic

  scope :with_fundraising, ->(type) { where(fundraiser: type) }
  scope :already_fundraising, ->(type) { with_fundraising(type).where("invitation_id IS NOT NULL") }

  monetize :target_cents

  def self.primary
    first
  end

  def self.secondaries
    where "registrations.id != ?", first.id
  end

  def fundraiser?
    %w(individual team).include? fundraiser
  end

  def fundraise_as type
    fundraiser == type
  end

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
