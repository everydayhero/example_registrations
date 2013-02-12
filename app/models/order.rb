require 'token'

class Order < ActiveRecord::Base
  belongs_to :user

  has_many :line_items
  has_many :registrations, through: :line_items, source: :sourceable, source_type: 'Registration'
  has_many :transactions

  def add_biller biller
    self.user = biller
  end

  def add_registration registration
    self.line_items.build sourceable: registration,
                          quantity: 1
  end

  def add_transaction transaction
    self.transactions << transaction
  end

  def checkout
    generate_token
    self.update_attributes state: 'checked_out'
  end

  def confirm
    self.update_attributes state: 'confirmed'
  end

  def paid
    self.update_attributes state: 'paid'
  end

  def generate_token
    self.update_attributes token: Token.generate
  end

  def primary_registrant
    registrations.first
  end

  def secondary_registrants
    registrations.secondaries
  end

  def total
    line_items.inject(0) { |total, item| total + item.total }
  end
end
