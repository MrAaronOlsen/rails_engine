require 'rails_helper'

RSpec.describe Invoice do

  describe 'Validations' do

    it { should validate_presence_of(:status) }

  end

  describe 'Relations' do

    it { should belong_to(:customer)}
    it { should belong_to(:merchant)}
    it { should have_many(:items).through(:invoice_items)}

  end
end