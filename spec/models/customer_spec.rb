require 'rails_helper'

Rspec.desribe Customer do

  describe 'Validations' do

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:created_at) }
    it { should validate_presence_of(:updated_at) }

  end

  describe 'Relations' do

    it { should have_many(:invoices)}

  end
end