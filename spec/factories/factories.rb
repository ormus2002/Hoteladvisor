FactoryGirl.define do
  factory :user do
    name 'John Doe'
    email 'person1@example.com'
    password 'password'
    password_confirmation 'password'
    end

  factory :hotel do
    sequence(:title) { |n| "Hotel_#{n}" }
    rating 0
    is_breakfast false
    room_description 'room description'
    room_price 10.00
  end

  factory :address do
    country 'United States'
    state   'CA'
    city    'Los Angeles'
    street  'Altadena Drive'
    hotel
  end

  factory :comment do
    rating 4
    text 'Super hotel'
    hotel
  end
end