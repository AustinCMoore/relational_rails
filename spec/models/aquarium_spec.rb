require 'rails_helper'

RSpec.describe Aquarium, type: :model do
  describe 'relationships' do
    it { should have_many(:fish) }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :clean}
    it { should validate_presence_of :number_of_types}
  end
end
