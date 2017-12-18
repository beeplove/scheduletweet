FactoryBot.define do

  factory :user do
    name "John Smith"
  end

  factory :tweet do
    user
  end

end
