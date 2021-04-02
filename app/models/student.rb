class Student < ApplicationRecord
  enum gender: {fem: 'F', masc: 'M'}
  enum payment: {card: 'Cartão', ticket: 'Boleto'}
  
  validates :name, presence: true, uniqueness: true
  validates :document, presence: true, uniqueness: true, length: {is: 11}, numericality: { only_integer: true }
  validates :birth_date, timeliness: { on_or_before: lambda { Date.current }, type: :date } , allow_blank: true
  validates :gender, presence: true
  validates :payment, presence: true

end
