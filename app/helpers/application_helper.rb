module ApplicationHelper
    def avatar_url(user)
        if user.imgae_url.present?
          user.imgae_url
        else
          'default.jpg'
        end
      end
end
