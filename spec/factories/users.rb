FactoryBot.define do
  factory :user do
    nickname              { 'yamada' }
    email                 { 'yamada@gmail.com' }
    password              { 'yamada00' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '隆夫' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タカオ' }
    birth_date            { '1940-04-01' }
  end
end
