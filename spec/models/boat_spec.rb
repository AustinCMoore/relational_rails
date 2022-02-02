require 'rails_helper'

RSpec.describe Boat, type: :model do
  describe 'relationships' do
    it { should belong_to(:dock) }
  end
end
