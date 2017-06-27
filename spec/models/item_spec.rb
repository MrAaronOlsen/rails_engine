require 'rails_helper'

Rspec.desribe Item do

  describe 'Validations' do

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_presence_of(:created_at) }
    it { should validate_presence_of(:updated_at) }

  end

  describe 'Relations' do

    it { should belong_to(:merchant) }
    it { should have_many(:invoices).through(:invoice_items) }

  end
end