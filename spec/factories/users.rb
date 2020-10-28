FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {"hoge12"}
    password_confirmation {password}
    last_name             {"かなカナ漢字"}
    first_name            {"かなカナ漢字"}
    last_name_kana        {"カタカナ"}
    first_name_kana       {"カタカナ"}
    birth_day             {"2020-01-01"}
  end
end