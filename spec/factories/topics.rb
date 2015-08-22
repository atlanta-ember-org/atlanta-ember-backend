FactoryGirl.define do
  factory :topic do
    sequence :name do |n|
      "Great Name #{n}"
    end
    description "MyString"
  end
end
