class User < ApplicationRecord
  has_many :products
  enum role: [:user, :moderator, :admin]
end
