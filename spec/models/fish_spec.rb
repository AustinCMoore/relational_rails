require 'rails_helper'

RSpec.describe Fish, type: :model do
  describe 'relationships' do
    it { should belong_to(:aquarium) }
  end
end
