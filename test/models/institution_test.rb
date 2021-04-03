require "test_helper"

class InstitutionTest < ActiveSupport::TestCase
  def setup
    @institution = Institution.new(name: 'Teste', institution_type: :university)
  end

  test "the truth" do
    assert true
  end

  test "should not save without any params" do
    @institution = Institution.new
    assert_not @institution.save and @institution.valid?
  end

  test "should not save without name" do
    @institution.name = nil
    assert_not @institution.save and @institution.valid?
  end

  test "should not save with invalid document (string)" do
    @institution.document = 'any'
    assert_not @institution.save and @institution.valid?
  end

  test "should not save with invalid document (incorrect length)" do
    @institution.document = '12345'
    assert_not @institution.save and @institution.valid?
  end

  test "should not save without type" do
    @institution.institution_type = nil
    assert_not @institution.save and @institution.valid?
  end

  test "should not allow invalid type" do
    assert_raises ArgumentError do
      @institution.institution_type = 'any'
    end
  end

  test "should save with correct values" do
    assert @institution.save and @institution.valid?
  end
end
