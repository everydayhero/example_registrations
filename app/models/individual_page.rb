class IndividualPage < ActiveRecord::Base
  belongs_to :registration

  serialize :data, Hash
end
