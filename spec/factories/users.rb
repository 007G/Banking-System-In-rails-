FactoryBot.define do
  factory :user do
    email "lowabitiku@topikt.com"
    password "123456"


    ignore { confirm_user true }

    after(:build) do |object, evaluator|
      object.skip_confirmation! if evaluator.confirm_user
    end
  end
end
