require 'rails_helper'

RSpec.describe Dock, type: :model do
  describe 'relationships' do
    it { should have_many(:boats) }
  end
end
