class API::PaymentNotificationsController < APIController
  def create
    transaction = PagSeguro::Transaction.find_by_notification_code params[:notificationCode]

    if transaction.errors.empty?
      order = Order.find(transaction.reference)
      order.update status: transaction.status.status
    end

    render nothing: true, status: 200
  end
end
