FactoryBot.define do
   factory :viewer do |f|
      f.sequence(:name) { |n| "Test User #{n}" }
      f.sequence(:email) { |n| "test#{n}@example.com" }
      f.password "password"
      f.password_confirmation { |d| d.password }
   end
   factory :rating do |f|
      f.sequence(:title) { |n| "Rating #{n}" }
      f.sequence(:rating) { |n| "Rating #{n}" }
      f.sequence(:description) { |n| "Rating #{n}" }
      f.association :viewer
   end
end