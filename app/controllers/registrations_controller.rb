class RegistrationsController < ApplicationController
  helper_method :registration, :form_url, :order

  def registration
    @registration ||= Registration.new
  end

  def form_url
    register_path
  end

  def order
    @order ||= Order.new
  end
end
