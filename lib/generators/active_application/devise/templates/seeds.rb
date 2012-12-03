unless Rails.env.production?
  user = Factory(:user, email: "user@example.com", 
                 password: "goodpass", password_confirmation: "goodpass")
  user.confirm!
end
