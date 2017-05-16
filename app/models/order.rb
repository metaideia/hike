class Order < ApplicationRecord
  validates :name, :email, :phone, presence: true
end
