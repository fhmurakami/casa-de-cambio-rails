class Address < ApplicationRecord
  has_many :users

  validates :street, :city, :state, 
            :neighbourhood, :postal_code,
            presence: true

  def full_address
    "#{street}, #{neighbourhood} - #{city}, #{state} - CEP: #{postal_code} "
  end
end
