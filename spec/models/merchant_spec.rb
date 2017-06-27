require 'rails_helper'

Rspec.desribe Merchant do

  describe 'Validations' do

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:created_at) }
    it { should validate_presence_of(:updated_at) }

  end

  describe 'Relations' do

    it { should have_many(:items) }
    it { should have_many(:invoices) }

  end
end