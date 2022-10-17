require 'rails_helper'

RSpec.describe Member, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:tasks) }
    it { is_expected.to have_many(:projects).through(:tasks) }
  end

  describe '#email' do
    context 'when email is already used' do
      let(:email) { 'sample@mail.com' }
      let(:member_dup) { build(:member, email:) }

      before { create(:member, email:) }

      it 'raises an exception on save' do
        expect do
          member_dup.save!
        end.to raise_error(ActiveRecord::RecordInvalid, /Email has already been taken/)
      end
    end

    context 'when format is wrong' do
      let(:member) { build(:member, email: 'sample@gmail.') }

      it 'raises an exception on save' do
        expect { member.save! }.to raise_error(
          ActiveRecord::RecordInvalid,
          / Email does not appear to be a valid e-mail address/
        )
      end
    end
  end
end
