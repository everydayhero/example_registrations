module ApplicationHelper
  def charity_options
    Charity.all
  end

  def distance_options
    [['3km Kids', '3km'], ['5km Run/Walk', '5km'], ['10km Run', '10km'], ['Half Marathon', '21km']]
  end

  def fundraiser_options order
    primary_registrant = order.primary_registrant

    [].tap do |options|
      options << ['I do not want to fundraise', 'no']

      if !primary_registrant || primary_registrant.fundraise_as('team')
        if primary_registrant && primary_registrant.fundraise_as('team')
          options << ["As part of team: #{primary_registrant.team_name}", 'team']
        else
          options << ['As part of a team', 'team']
        end
      end

      options << ['As an Individual', 'individual']
    end.reverse
  end

  def gender_options
    [['Male', 'm'], ['Female', 'f']]
  end
end
