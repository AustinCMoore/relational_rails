require 'rails_helper'

RSpec.describe Fish, type: :model do
  describe 'relationships' do
    it { should belong_to(:aquarium) }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :bioluminescent}
    it { should allow_value(false).for(:fish) }
  end
end
