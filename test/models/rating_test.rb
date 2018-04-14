require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  test "has valid factory" do
    rating = FactoryBot.build :rating
    
    assert rating.valid?
  end
  
  test "presence of required fields" do
    rating = Rating.new
    assert validate_presence_of(:title), rating
    assert validate_presence_of(:rating), rating
    assert validate_presence_of(:description), rating
  end
  
  test "relationships" do
    rating = Rating.new
    
    assert belong_to(:viewer), rating
  end
end
