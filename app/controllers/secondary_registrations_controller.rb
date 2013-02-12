class SecondaryRegistrationsController < RegistrationsController
  helper_method :order

  def form_url
    secondary_registration_path
  end

  def order
    @order ||= Order.find params[:order_id]
  end
end
