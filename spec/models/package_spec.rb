# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Package, type: :model do
  it { should belong_to(:courier) }
  it { should validate_presence_of(:tracking_number) }
  it { should validate_length_of(:tracking_number).is_at_least(10).is_at_most(20)}
  # it { should validate_inclusion_of(:delivery_status).in_array([true, false])}
end
