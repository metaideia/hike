ActiveAdmin.register Order do
  menu priority: 5

  filter :name
  filter :email
  filter :phone
  filter :created_at

  index do
    column(:name)
    column(:email)
    column(:phone)
    column(:created_at)

    actions
  end
end
