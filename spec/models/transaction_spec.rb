require 'rails_helper'

RSpec.describe Transaction do

  describe 'Validations' do

    it { should validate_presence_of(:credit_card_number) }
    it { should validate_presence_of(:result) }

  end

  describe 'Relations' do

    it { should belong_to(:invoice)}

  end
end