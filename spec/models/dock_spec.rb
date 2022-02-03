require 'rails_helper'

RSpec.describe Dock, type: :model do
  describe 'relationships' do
    it { should have_many(:boats) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :open }
    it { should validate_presence_of :capacity }
  end
end
