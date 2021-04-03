class Bill < ApplicationRecord
  belongs_to :registration

  enum status: {open: 'Aberta', closed: 'Paga', overdue: 'Atrasada'}

  validates :price, presence: true
  validates_numericality_of :price, :greater_than => 0

  validates :due_date, presence: true, timeliness: { on_or_after: lambda { Date.current }, type: :date } 
  validates :status, presence: true
end
