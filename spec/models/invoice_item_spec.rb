require 'rails_helper'

Rspec.desribe Invoice_Items do

  describe 'Validations' do

    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_presence_of(:created_at) }
    it { should validate_presence_of(:updated_at) }

  end

  describe 'Relations' do

    it { should belong_to(:item)}
    it { should belong_to(:invoice)}

  end
end