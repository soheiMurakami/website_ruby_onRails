require 'test_helper'

class RemindersTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "create a reminder" do 
    visit new_reminder_path
    fill :name, with:"Finish Testing"
    fill :priority, with: "1"
    click "Create Reminder"
    
    page.has_contenct?("reminder created")
    page.has_contenct?("Finish testing")
  end
end
