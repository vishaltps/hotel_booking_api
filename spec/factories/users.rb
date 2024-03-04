# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'test@google.com' }
    name { 'FooBar' }
  end
end
