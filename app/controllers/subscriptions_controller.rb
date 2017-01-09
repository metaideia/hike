class SubscriptionsController < ApiController
  ##
  # Creates a new subscription for a lead
  #
  #   POST /subscriptions
  #
  #   {
  #     data: {
  #       name: "John",
  #       email: "john@doe.com",
  #       list_id: "ffbf67e8-722f-4473-ac3a-3cea5ac6b061"
  #     }
  #   }
  #
  # If lead does not exists, then creates it first.
  # If subscription already exists, just resends email to lead.
  # An error is raised if the list is not found.
  #
  def create
    form = CreateSubscription.new(params[:data])

    if form.save
      render json: { data: form.data }, status: :ok
    else
      render json: { errors: form.error_messages }, status: :unprocessable_entity
    end
  end
end