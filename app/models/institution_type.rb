class InstitutionType < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
