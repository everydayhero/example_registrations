class SecondaryRegistrationsController < RegistrationsController
  def form_url
    secondary_registration_path
  end
end
