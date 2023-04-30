require "test_helper"

class SousCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sous_categorie = sous_categories(:one)
  end

  test "should get index" do
    get sous_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_sous_categorie_url
    assert_response :success
  end

  test "should create sous_categorie" do
    assert_difference('SousCategorie.count') do
      post sous_categories_url, params: { sous_categorie: {  } }
    end

    assert_redirected_to sous_categorie_url(SousCategorie.last)
  end

  test "should show sous_categorie" do
    get sous_categorie_url(@sous_categorie)
    assert_response :success
  end

  test "should get edit" do
    get edit_sous_categorie_url(@sous_categorie)
    assert_response :success
  end

  test "should update sous_categorie" do
    patch sous_categorie_url(@sous_categorie), params: { sous_categorie: {  } }
    assert_redirected_to sous_categorie_url(@sous_categorie)
  end

  test "should destroy sous_categorie" do
    assert_difference('SousCategorie.count', -1) do
      delete sous_categorie_url(@sous_categorie)
    end

    assert_redirected_to sous_categories_url
  end
end
