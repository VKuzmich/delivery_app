# frozen_string_literal: true

class Package < ApplicationRecord
  belongs_to :courier
  validates :tracking_number, presence: true,
                              length: { in: 10..20 }
  validates :delivery_status, inclusion: [true, false]
end
