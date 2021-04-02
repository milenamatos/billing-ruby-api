class Student < ApplicationRecord
  enum gender: {fem: 'F', masc: 'M'}
  enum payment: {card: 'Cartão', ticket: 'Boleto'}
  
  validates :name, presence: true, uniqueness: true
  validates :document, presence: true, uniqueness: true, length: {is: 11}
  validates :gender, presence: true
  validates :payment, presence: true
end
