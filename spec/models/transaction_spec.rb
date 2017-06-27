require 'rails_helper'

Rspec.desribe Invoice_Items do

  describe 'Validations' do

    it { should validate_presence_of(:credit_card_number) }
    it { should validate_presence_of(:credit_card_expiration_date) }
    it { should validate_presence_of(:result) }
    it { should validate_presence_of(:created_at) }
    it { should validate_presence_of(:updated_at) }

  end

  describe 'Relations' do

    it { should belong_to(:invoice)}

  end
end