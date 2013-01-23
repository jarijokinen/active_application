FactoryGirl.define do
  factory :category do
    blog
    sequence(:name) { |n| Forgery::LoremIpsum.words(n, random: true) }
  end
end
