module ApplicationHelper
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
