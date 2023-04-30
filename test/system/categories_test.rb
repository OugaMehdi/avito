require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @categorie = categories(:one)
  end

  test "visiting the index" do
    visit categories_url
    assert_selector "h1", text: "Categories"
  end

  test "creating a Categorie" do
    visit categories_url
    click_on "New Categorie"

    click_on "Create Categorie"

    assert_text "Categorie was successfully created"
    click_on "Back"
  end

  test "updating a Categorie" do
    visit categories_url
    click_on "Edit", match: :first

    click_on "Update Categorie"

    assert_text "Categorie was successfully updated"
    click_on "Back"
  end

  test "destroying a Categorie" do
    visit categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Categorie was successfully destroyed"
  end
end
