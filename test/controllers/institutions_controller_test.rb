require "test_helper"

class InstitutionsControllerTest < ActionDispatch::IntegrationTest
  institutions_url = "/api/v1/institutions/"
  setup do
    @institution = institutions(:one)
  end

  test "should get index" do
    get institutions_url, as: :json
    assert_response :success
  end

  test "should create institution" do
    assert_difference('Institution.count') do
      post institutions_url, params: { institution: 
        { name: 'Teste Create', document: '52257106000179', institution_type: :university } 
      }, as: :json
    end
    puts @institution.errors.inspect

    assert_response 201
  end

  test "should show institution" do
    get institutions_url + @institution.id.to_s, as: :json
    assert_response :success
  end
  
end
