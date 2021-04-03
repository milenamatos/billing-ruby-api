require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  students_url = "/api/v1/students/"
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url, as: :json
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post students_url, params: { student: 
        { name: 'Teste Create', document: '02416840053', gender: :fem, payment: :ticket } 
      }, as: :json
    end

    assert_response 201
  end

  test "should show student" do
    get students_url + @student.id.to_s, as: :json
    assert_response :success
  end

end
