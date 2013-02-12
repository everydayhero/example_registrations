class RegistrationsController < ApplicationController
  helper_method :registration, :form_url

  def registration
    @registration ||= Registration.new
  end

  def form_url
    register_path
  end
end
