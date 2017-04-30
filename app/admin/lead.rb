ActiveAdmin.register Lead do
  menu priority: 3

  filter :lists
  filter :subscriptions_status_eq, as: :select, collection: SubscriptionStatus.to_a, label: "Status"
  filter :name
  filter :email
  filter :created_at

  index do
    column(:name)
    column(:email)
    column(:created_at)

    actions
  end
end
