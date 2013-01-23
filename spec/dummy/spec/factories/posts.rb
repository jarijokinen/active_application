FactoryGirl.define do
  factory :post do
    category
    sequence(:title) { |n| Forgery::LoremIpsum.words(n, random: true) }
    sequence(:content) { |n| Forgery::LoremIpsum.words(n, random: true) }
  end
end
