module ApplicationHelper
#  gravatar_url(current_user) is a helper method to solve the gravatar url of the singed in user
    def gravatar_url(user)
        gravatar_id = Digest::MD5::hexdigest(user.email).downcase
        url = "https://gravatar.com/avatar/#{gravatar_id}.png"
      end
end
