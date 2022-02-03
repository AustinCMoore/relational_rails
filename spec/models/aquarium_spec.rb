require 'rails_helper'

RSpec.describe Aquarium, type: :model do
  describe 'relationships' do
    it { should have_many(:fish) }
  end
end
