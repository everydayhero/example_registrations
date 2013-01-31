class RegistrationForm
  include ActiveModel::Model

  attr_accessor :registrant, :distance, :fundraiser, :charity_id
  attr_writer :first_name, :surname, :nickname, :gender

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

  def registration
    Registration.new first_name: first_name,
                     surname: surname,
                     nickname: nickname,
                     gender: gender,
                     distance: distance,
                     fundraiser: fundraiser,
                     charity_id: charity_id
  end

  def charity_options
    Charity.all
  end

  def distance_options
    [['3km Kids', '3km'], ['5km Run/Walk', '5km'], ['10km Run', '10km'], ['Half Marathon', '21km']]
  end

  def fundraiser_options
    [['As an Individual', 'individual'], ['As part of a team', 'team'], ['I do not want to fundraise', 'no']]
  end

  def gender_options
    [['Male', 'm'], ['Female', 'f']]
  end
end
