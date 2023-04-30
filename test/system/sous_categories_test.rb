require "application_system_test_case"

class SousCategoriesTest < ApplicationSystemTestCase
  setup do
    @sous_categorie = sous_categories(:one)
  end

  test "visiting the index" do
    visit sous_categories_url
    assert_selector "h1", text: "Sous Categories"
  end

  test "creating a Sous categorie" do
    visit sous_categories_url
    click_on "New Sous Categorie"

    click_on "Create Sous categorie"

    assert_text "Sous categorie was successfully created"
    click_on "Back"
  end

  test "updating a Sous categorie" do
    visit sous_categories_url
    click_on "Edit", match: :first

    click_on "Update Sous categorie"

    assert_text "Sous categorie was successfully updated"
    click_on "Back"
  end

  test "destroying a Sous categorie" do
    visit sous_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sous categorie was successfully destroyed"
  end
end
