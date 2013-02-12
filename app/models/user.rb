require 'token'

class User < ActiveRecord::Base
  has_secure_password

  has_many :orders

  def self.authenticate credentials
    find_by_email(credentials[:email]).try :authenticate, credentials[:password]
  end

  def self.find_or_create_from_auth_hash auth_hash
    find_by_uid(auth_hash.uid.to_s) || create_from_auth_hash(auth_hash)
  end

  def add_giving_passport auth_hash
    update_attributes uid: auth_hash.uid
  end

  def generate_remember_token
    update_attributes remember_token: Token.generate
  end
  alias :reset_remember_token :generate_remember_token
end
