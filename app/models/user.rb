require 'token'

class User < ActiveRecord::Base
  has_many :orders

  def self.find_or_create_from_auth_hash auth_hash
    find_by_uid(auth_hash.uid.to_s) || create_from_auth_hash(auth_hash)
  end

  def self.create_from_auth_hash auth_hash
    create full_name: auth_hash.info.name,
           email: auth_hash.info.email,
           token: auth_hash.credentials.token,
           uid: auth_hash.uid,
           birthday: auth_hash.info.birthday
  end

  def generate_remember_token
    self.update_attributes remember_token: Token.generate
  end
  alias :reset_remember_token :generate_remember_token
end
