ActiveAdmin.register Subscription do
  menu priority: 2

  scope :all, default: true
  scope :active
  scope :pending
  scope :canceled

  filter :list
  filter :lead_email_contains, label: "Email Contains"
  filter :created_at

  index do
    column(:status) { |subscription| status_tag subscription.status }
    column(:list)
    column(:lead)
    column(:created_at)

    actions do |subscription|
      link_to "Resend", resend_admin_subscription_path(subscription), method: :put
    end
  end

  member_action :resend, method: :put do
    SubscriptionMailer.send(resource)

    redirect_to collection_path, notice: "Success sending to #{resource.lead_email}"
  end

  form do |f|
    f.inputs do
      f.input :lead
      f.input :list
      f.input :status, as: :select, collection: SubscriptionStatus.to_a
    end

    f.actions
  end
end
