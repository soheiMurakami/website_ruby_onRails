class AuthentificationsController < ApplicationController
    
    def create
        #render json: omni_hash.to_json
        #return 
       # render json: viewer_hash.to_json
       # return
        viewer = Viewer.where(vid: viewer_hash[:vid]).first
        if viewer
            login(viewer)
            redirect_to root_path, notice: "you logged in"
        else 
            viewer = Viewer.create_from_hash(viewer_hash)
            if viewer.save
                login(viewer)
                redirect_to root_path, notice: "signed in"
            else 
                session[:viewer_hash] = viewer_hash
                redirect_to register_path, notice: "fill in the missing info"
            end
        end
    end
    
    private
    
    def omni_hash
        request.env['omniauth.auth']
    end
    
    def viewer_hash
        hash = {}
        hash[:vid] = omni_hash['vid']
        if omni_hash['info']
            hash[:name] = omni_hash['info']['name']
            hash[:email] = omni_hash['info']['email']
        end
        if omni_hash['credentials']['token']
            hash[:token] = omni_hash['credentials']['token']
        end
        hash
    end
end
