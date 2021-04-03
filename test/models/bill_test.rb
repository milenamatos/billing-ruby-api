require "test_helper"

class BillTest < ActiveSupport::TestCase
  def setup
    @bill = bills(:one)
  end

  test "the truth" do
    assert true
  end

  test "should not save without any params" do
    @bill = Bill.new
    assert_not @bill.save and @bill.valid?
  end

  test "should not save without price" do
    @bill.price = nil
    assert_not @bill.save and @bill.valid?
  end

  test "should not save with invalid price (string)" do
    @bill.price = 'any'
    assert_not @bill.save and @bill.valid?
  end

  test "should not save with invalid price (<= 0)" do
    @bill.price = 0
    assert_not @bill.save and @bill.valid?
  end

  test "should not save without due_date" do
    @bill.due_date = nil
    assert_not @bill.save and @bill.valid?
  end

  test "should not save with invalid due_date" do
    @bill.due_date = '11-22-33'
    assert_not @bill.save and @bill.valid?
  end

  test "should not save without status" do
    @bill.status = nil
    assert_not @bill.save and @bill.valid?
  end

  test "should not allow invalid status" do
    assert_raises ArgumentError do
      @bill.status = 'any'
    end
  end

  test "should not save without registration" do
    @bill.registration_id = nil
    assert_not @bill.save and @bill.valid?
  end

  test "should not save with invalid registration (not found)" do
    assert_raises (ActiveRecord::RecordNotFound) do
      @bill.registration = Registration.find(course_name: 'not found')
    end
  end

  test "should save with correct values" do
    assert @bill.save and @bill.valid?
  end
end
