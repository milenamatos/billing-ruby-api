require "test_helper"

class RegistrationTest < ActiveSupport::TestCase
  def setup
    @registration = registrations(:one)
  end

  test "the truth" do
    assert true
  end

  test "should not save without any params" do
    @registration = Registration.new
    assert_not @registration.save and @registration.valid?
  end

  test "should not save without total_price" do
    @registration.total_price = nil
    assert_not @registration.save and @registration.valid?
  end

  test "should not save with invalid total_price" do
    @registration.total_price = 0
    assert_not @registration.save and @registration.valid?
  end

  test "should not save without bill_quantity" do
    @registration.bill_quantity = nil
    assert_not @registration.save and @registration.valid?
  end

  test "should not save with invalid bill_quantity" do
    @registration.bill_quantity = 0
    assert_not @registration.save and @registration.valid?
  end

  test "should not save without due_date" do
    @registration.due_date = nil
    assert_not @registration.save and @registration.valid?
  end
  
  test "should not save with invalid due_date (not between 1 and 31) " do
    @registration.due_date = 50
    assert_not @registration.save and @registration.valid?
  end

  test "should not save without course_name" do
    @registration.course_name = nil
    assert_not @registration.save and @registration.valid?
  end

  test "should not save without institution" do
    @registration.institution_id = nil
    assert_not @registration.save and @registration.valid?
  end

  test "should not save with invalid institution (not found)" do
    assert_raises (ActiveRecord::RecordNotFound) do
      @registration.institution = Institution.find(name: 'not found')
    end
  end

  test "should not save without student" do
    @registration.student_id = nil
    assert_not @registration.save and @registration.valid?
  end

  test "should not save with invalid student (not found)" do
    assert_raises (ActiveRecord::RecordNotFound) do
      @registration.student = Student.find(name: 'not found')
    end
  end

  test "should save with correct values" do
    assert @registration.save and @registration.valid?
  end

  test "should save correct number of bills" do
    new_registration = Registration.create({total_price: 1, institution_id: 1, student_id: 1, course_name: 'teste', due_date: 15, bill_quantity: 4 })
    new_registration.create_bills
    assert new_registration and new_registration.valid?
    assert_equal new_registration.bill_quantity, new_registration.bill.length
  end

  test "should save correct total price" do
    new_registration = Registration.create({total_price: 100, institution_id: 1, student_id: 1, course_name: 'teste', due_date: 15, bill_quantity: 4 })
    new_registration.create_bills
    assert new_registration and new_registration.valid?
    sum_price = 0
    new_registration.bill.each do | item | 
      sum_price += item.price
    end 
    assert_equal new_registration.total_price, sum_price
  end

  test "should save registration with due date = 31" do
    new_registration = Registration.create({total_price: 1, institution_id: 1, student_id: 1, course_name: 'teste', due_date: 31, bill_quantity: 4 })
    new_registration.create_bills
    assert new_registration and new_registration.valid?
  end

  test "should save bills with correct due dates" do
    new_registration = Registration.create({total_price: 2400, institution_id: 1, student_id: 1, course_name: 'teste', due_date: 31, bill_quantity: 12 })
    new_registration.create_bills
    assert new_registration and new_registration.valid?
    new_registration.bill.each do | item | 
      pp(item.due_date)
    end
  end
end
