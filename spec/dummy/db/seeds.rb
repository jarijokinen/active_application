require "factory_girl"
require "forgery"

if Rails.env.development?
  FactoryGirl.find_definitions

  customer = User.create(
    email: "user@example.com", 
    password: "goodpass",
    password_confirmation: "goodpass"
  )
  customer.confirm!
  customer.add_role :customer

  administrator = User.create(
    email: "administrator@example.com", 
    password: "goodpass",
    password_confirmation: "goodpass"
  )
  administrator.confirm!
  administrator.add_role :administrator

  blogs = FactoryGirl.create_list(:blog, 10, user: customer)
  categories = FactoryGirl.create_list(:category, 5, blog: blogs[0])
  posts = FactoryGirl.create_list(:post, 30, category: categories[0])
  comments = FactoryGirl.create_list(:comment, 10, post: posts[0])
end
