module AuthenticationMacros
  def login_viewer
    viewer = FactoryBot.create :viewer
    ApplicationController.any_instance.stubs(:current_viewer).returns(viewer)
    viewer
  end    

  def reset_login  
    ApplicationController.any_instance.stubs(:current_viewer).returns(nil)
  end   
end