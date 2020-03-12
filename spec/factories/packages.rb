# frozen_string_literal: true

FactoryBot.define do
  factory :package_item do

    association :courier, factory: :courier
    tracking_number { rand(10_000_000_000..20_000_000_000) }
    delivery_status { sample(true, false)}
  end
end