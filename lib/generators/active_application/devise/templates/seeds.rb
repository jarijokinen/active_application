unless Rails.env.production?
  user = FactoryGirl.create(:user, email: "user@example.com",
    password: "goodpass", password_confirmation: "goodpass")
  user.confirm!
end
