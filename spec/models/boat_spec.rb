require 'rails_helper'

RSpec.describe Boat, type: :model do
  describe 'relationships' do
    it { should belong_to(:dock) }
  end

  describe 'validates' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :crew_size}
    # it { should validate_presence_of :motor_powered}
  end
end
