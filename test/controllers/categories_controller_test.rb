require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categorie = categories(:one)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    get new_categorie_url
    assert_response :success
  end

  test "should create categorie" do
    assert_difference('Categorie.count') do
      post categories_url, params: { categorie: {  } }
    end

    assert_redirected_to categorie_url(Categorie.last)
  end

  test "should show categorie" do
    get categorie_url(@categorie)
    assert_response :success
  end

  test "should get edit" do
    get edit_categorie_url(@categorie)
    assert_response :success
  end

  test "should update categorie" do
    patch categorie_url(@categorie), params: { categorie: {  } }
    assert_redirected_to categorie_url(@categorie)
  end

  test "should destroy categorie" do
    assert_difference('Categorie.count', -1) do
      delete categorie_url(@categorie)
    end

    assert_redirected_to categories_url
  end
end
