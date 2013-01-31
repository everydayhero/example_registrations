class Transaction < ActiveRecord::Base
  belongs_to :order, counter_cache: true
end
