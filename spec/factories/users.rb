FactoryGirl.define do
  factory :user do
    first_name "Example"
    last_name "User"
    password "password"
    password_confirmation "password"
  end
end
