module SitesHelper
    def title(page_title, show_title=true)
        content_for(:title) { page_title.to_s }
        @show_title = show_title
    end
    
    def nav_link(text,path)
        if current_page?(path)
            link_to(text,path,class: ["nav-item","nav-link","active"])
        else
            link_to(text,path, class: ["nav-item","nav_link"])
        end
    end
end
