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

  has_many :bill

  after_create :create_bills

  def create_bills 
    current_date = DateTime.now
		current_day = current_date.strftime("%d").to_i
	  current_month = current_date.strftime("%m").to_i

    first_last_valid_due_date = current_date.end_of_month.day
    correct_due_date = (self.due_date <= first_last_valid_due_date) ? due_date : first_last_valid_due_date
		first_bill_date = current_date.change(day: correct_due_date)
    bill_date = (correct_due_date > current_day) ? first_bill_date : first_bill_date.next_month

		price = self.total_price / self.bill_quantity

    for i in 1..self.bill_quantity do
      self.bill.build({registration_id: self.id, due_date: bill_date.strftime("%Y/%m/%d"), price: price})
      temp_bill_date = bill_date.next_month
      last_valid_due_date = temp_bill_date.end_of_month.day
      correct_due_date = (self.due_date <= last_valid_due_date) ? self.due_date : last_valid_due_date
		  bill_date = temp_bill_date.change(day: correct_due_date)    
    end 
    self.save
  end 
end
