FactoryGirl.define do
  factory :blog do
    user
    sequence(:name) { |n| Forgery::LoremIpsum.words(n, random: true) }
  end
end
