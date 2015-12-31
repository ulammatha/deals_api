require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'db structure' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:phone).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:address).of_type(:text) }
    it { is_expected.to have_db_column(:rating).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:vendor) }
  end

  describe 'validations' do
    subject { create(:restaurant) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:address) }
  end
end
