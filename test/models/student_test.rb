require "test_helper"

class StudentTest < ActiveSupport::TestCase
  def setup
    @student = Student.new(name: 'Teste', document: '48736964883', gender: :fem, payment: :card)
  end

  test "the truth" do
    assert true
  end

  test "should not save without any params" do
    @student = Student.new
    assert_not @student.save and @student.valid?
  end

  test "should not save without name" do
    @student.name = nil
    assert_not @student.save and @student.valid?
  end

  test "should not save without document" do
    @student.document = nil
    assert_not @student.save and @student.valid?
  end

  test "should not save with invalid document (string)" do
    @student.document = 'any'
    assert_not @student.save and @student.valid?
  end

  test "should not save with invalid document (incorrect length)" do
    @student.document = '12345'
    assert_not @student.save and @student.valid?
  end

  test "should not save without gender" do
    @student.gender = nil
    assert_not @student.save and @student.valid?
  end
  
  test "should not allow invalid gender" do
    assert_raises ArgumentError do
      @student.gender = 'any'
    end
  end

  test "should not save without payment" do
    @student.payment = nil
    assert_not @student.save and @student.valid?
  end

  test "should not allow invalid payment" do
    assert_raises ArgumentError do
      @student.payment = 'any'
    end
  end

  test "should not save with invalid birth date" do
    @student.birth_date = '12-34-56'
    assert_not @student.save and @student.valid?
  end

  test "should not save with invalid birth date (future date)" do
    @student.birth_date = '12/01/2022'
    assert_not @student.save and @student.valid?
  end

  test "should save with correct values" do
    assert @student.save and @student.valid?
  end
end
