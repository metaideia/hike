class API::PaymentsController < APIController
  def create
    order = Order.new permitted_params

    if order.save
      payment = PagSeguro::PaymentRequest.new

      payment.reference = order.id
      payment.notification_url = api_payment_notifications_url
      payment.redirect_url = params[:redirect_success_url]
      payment.items << {
        id: "mindcolors",
        description: "Coleção Mindcolors - 5 quadros 30x40cm",
        amount: 397.00,
        weight: 2000
      }

      response = payment.register

      if response.errors.none?
        redirect_to response.url
      else
        logger.info params.inspect
        logger.error "Pagseguro: #{response.errors.join(", ")}"

        redirect_to params[:redirect_error_url]
      end
    else
      redirect_to params[:redirect_error_url]
    end
  end

  private

  def permitted_params
    params.require(:data).permit(:name, :email, :phone)
  end
end
