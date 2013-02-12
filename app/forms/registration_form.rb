class RegistrationForm
  include ActiveModel::Model

  attr_accessor :registrant, :distance, :fundraiser, :charity_id
  attr_writer :first_name, :surname, :nickname, :gender

  validates :birthday, presence: true

  def initialize attributes
    year  = attributes.delete(:'birthday(1i)')
    month = attributes.delete(:'birthday(2i)')
    day   = attributes.delete(:'birthday(3i)')

    super attributes.merge(birthday: [year, month, day])
  end

  def first_name
    @first_name || registrant.full_name.to_s.split(' ').first
  end

  def surname
    @surname || registrant.full_name.to_s.split(' ').last
  end

  def nickname
    @nickname || registrant.nickname
  end

  def gender
    @gender || registrant.gender
  end

  def birthday= values
    @birthday ||= begin
      return if values.compact.empty?
      Date.parse values.join('-')
    end
  end

  def birthday
    @birthday || registrant.birthday
  end

  def registration
    Registration.new first_name: first_name,
                     surname: surname,
                     nickname: nickname,
                     gender: gender,
                     birthday: birthday,
                     distance: distance,
                     fundraiser: fundraiser,
                     charity_id: charity_id
  end

  def charity_options
    Charity.all
  end

end
