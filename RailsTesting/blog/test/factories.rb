FactoryGirl.define do
  factory :user do
    username 'abc'
    password_hash 'aaaa'
    password_salt 'asdasdsa'
  end

  factory :article do
    title ''
    content ''
  end
end
