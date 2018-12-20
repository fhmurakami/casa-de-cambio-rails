class User < ApplicationRecord
  has_many :transactions
  belongs_to :address, optional: true

  validates :name, :email, :cpf, presence: true
end
