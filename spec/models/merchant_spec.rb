require 'rails_helper'

RSpec.describe Merchant do

  describe 'Validations' do

    it { should validate_presence_of(:name) }

  end

  describe 'Relations' do

    it { should have_many(:items) }
    it { should have_many(:invoices) }

  end
end