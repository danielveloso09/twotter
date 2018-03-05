FactoryBot.define do
  factory :post do
    user
    message { 'the-message' }
  end
end
