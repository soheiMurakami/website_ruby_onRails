require 'test_helper'

class RatingsTest < ActionDispatch::IntegrationTest

  
  test "ratings protected" do
    visit ratings_path
    
    assert_equal page.current_path, login_path
    assert page.has_content?("log in")
  end
  
  test "create a new rating" do
    login_viewer
    visit ratings_path
    click_link "Create Rating"

    fill_in "Title", with: "darkKnight"
    fill_in "Rating", with: "1"
    fill_in "Description", with: "great"
    click_on "Create Rating"
    
    assert page.has_content?("created rating")
    assert page.has_content?("Finish Testing")
  end   
  
  test "create without name fails" do
    login_viewer
    visit new_rating_path     
    
    fill_in "Rating", with: "10"
    fill_in "Description", with: "that is so annoying"
    click_on "Create Rating"
    
    assert_equal page.current_path, ratings_path
    assert page.has_content?("fix the errors")
    assert page.has_content?("can't be blank")
  end
  
  test "delete rating" do
    viewer = login_viewer    
    rating = FactoryBot.create :rating, viewer: viewer
    
    visit rating_path(rating)
    click_link "Delete"
    
    assert_equal ratings_path, page.current_path
    assert page.has_content?("deleted rating")
    refute page.has_content?(rating.title)
  end
  
end