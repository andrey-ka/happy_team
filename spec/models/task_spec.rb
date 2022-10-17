require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:project) }
    it { is_expected.to belong_to(:owner).optional }
  end

  describe 'state machine' do
    let(:task) { create(:task, :with_project) }

    context 'when start event is triggered without an owner' do
      it 'raises an AASM exception' do
        expect { task.start! }.to raise_error(
          AASM::InvalidTransition,
          /Event 'start' cannot transition from 'new'/
        )
      end
    end

    context 'when start is triggered with an owner' do
      let(:owner) { create(:member) }

      before { task.update(owner_id: owner.id) }

      it 'start is triggered without an exception' do
        expect(task.start!).to be_truthy
      end
    end
  end

  describe '#identifier' do
    let(:project_a) { create(:project, code: 'A') }
    let(:project_b) { create(:project, code: 'B') }
    let(:task_a_one) { create(:task, project: project_a) }
    let(:task_a_two) { create(:task, project: project_a) }
    let(:task_b_one) { create(:task, project: project_b) }

    specify { expect(task_a_one.identifier).to eq('A-1') }
    specify { expect(task_a_two.identifier).to eq('A-2') }
    specify { expect(task_b_one.identifier).to eq('B-1') }
  end
end
