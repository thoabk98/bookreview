module ApplicationHelper
    def avatar_url(user)
      if user.image.present? 
        user.image
      else   
      'default.jpg'
      end
    end
end