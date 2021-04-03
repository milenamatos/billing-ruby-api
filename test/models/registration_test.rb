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
end
