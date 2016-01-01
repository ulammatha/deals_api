require 'rails_helper'

RSpec.describe Deal, type: :model do
  describe 'db structure' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:current_amount).of_type(:decimal) }
    it { is_expected.to have_db_column(:previous_amount).of_type(:decimal) }
    it { is_expected.to have_db_column(:expiry).of_type(:datetime) }
    it { is_expected.to have_db_column(:available_coupons).of_type(:integer) }
    it { is_expected.to have_db_column(:sold_coupons).of_type(:integer) }
    it { is_expected.to have_db_column(:restaurant_id).of_type(:integer) }
    it { is_expected.to have_db_column(:image_file_name).of_type(:string) }
    it { is_expected.to have_db_column(:image_content_type).of_type(:string) }
    it { is_expected.to have_db_column(:image_file_size).of_type(:integer) }
    it { is_expected.to have_db_column(:image_updated_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:restaurant) }
  end

  describe 'validations' do
    subject { create(:deal) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:current_amount) }
    it { is_expected.to validate_presence_of(:previous_amount) }
    it { is_expected.to validate_presence_of(:expiry) }
    it { is_expected.to validate_presence_of(:available_coupons) }
    it { is_expected.to validate_presence_of(:sold_coupons) }
    it { is_expected.to validate_presence_of(:image) }
  end
end
