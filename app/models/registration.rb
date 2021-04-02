class Registration < ApplicationRecord
  belongs_to :institution
  belongs_to :student

  validates :total_price, presence: true
  validates_numericality_of :total_price, :greater_than => 0

  validates :bill_quantity, presence: true
  validates_numericality_of :bill_quantity, :greater_than_or_equal_to => 1

  validates :due_date, presence: true
  validates_inclusion_of :due_date, :in => 1..31

  validates :course_name, presence: true
  validates :institution, presence: true
  validates :student, presence: true
end
