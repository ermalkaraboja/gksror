class Role < ApplicationRecord
  has_many :users, through: :users
end
