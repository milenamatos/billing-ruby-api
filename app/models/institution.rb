class Institution < ApplicationRecord
  belongs_to :institution_type
  validates :name, presence: true, uniqueness: true
  validates :document, uniqueness: true, length: {is: 14}
end
