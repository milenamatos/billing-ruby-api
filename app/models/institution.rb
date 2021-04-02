class Institution < ApplicationRecord
  enum institution_type: { university: 'Universidade', school: 'Escola', dayCare: 'Creche' }

  validates :name, presence: true, uniqueness: true
  validates :document, uniqueness: true, length: {is: 14}, allow_blank: true, numericality: { only_integer: true }
  validates :institution_type, presence: true
end
