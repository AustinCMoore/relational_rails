require 'rails_helper'

RSpec.describe Fish, type: :model do
  describe 'relationships' do
    it { should belong_to(:aquarium) }
  end

  describe 'validates' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :bioluminescent}
    it { should validate_presence_of :quantity}
  end
end
