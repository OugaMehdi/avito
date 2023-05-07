require "application_system_test_case"

class UtilisateursTest < ApplicationSystemTestCase
  setup do
    @utilisateur = utilisateurs(:one)
  end

  test "visiting the index" do
    visit utilisateurs_url
    assert_selector "h1", text: "Utilisateurs"
  end

  test "creating a Utilisateur" do
    visit utilisateurs_url
    click_on "New Utilisateur"

    click_on "Create Utilisateur"

    assert_text "Utilisateur was successfully created"
    click_on "Back"
  end

  test "updating a Utilisateur" do
    visit utilisateurs_url
    click_on "Edit", match: :first

    click_on "Update Utilisateur"

    assert_text "Utilisateur was successfully updated"
    click_on "Back"
  end

  test "destroying a Utilisateur" do
    visit utilisateurs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Utilisateur was successfully destroyed"
  end
end
