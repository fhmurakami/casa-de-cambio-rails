class User < ApplicationRecord
  has_many :transactions

  validates :name, :email, :cpf, presence: true
end
