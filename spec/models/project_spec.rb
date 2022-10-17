require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:tasks) }
  end

  describe 'state machine' do
    let(:project) { create(:project) }

    context 'when start event is triggered without any tasks' do
      it 'raises an AASM exception' do
        expect { project.start! }.to raise_error(
          AASM::InvalidTransition,
          /Event 'start' cannot transition from 'new'/
        )
      end
    end

    context 'when start event is triggered without the first task' do
      before { project.tasks.create!(title: 'Initial one') }

      it 'starts task without an exception' do
        expect(project.start!).to be_truthy
      end
    end
  end
end
