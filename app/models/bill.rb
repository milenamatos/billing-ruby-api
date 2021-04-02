class Bill < ApplicationRecord
  belongs_to :registration

  enum status: {open: 'Aberta', closed: 'Paga', overdue: 'Atrasada'}

  validates :price, presence: true
  validates :due_date, presence: true
  validates :status, presence: true
end
