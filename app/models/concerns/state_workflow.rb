module StateWorkflow
  extend ActiveSupport::Concern

  included do
    include AASM
    aasm column: :state, whiny_persistence: true do
      state :new, initial: true
      state :started
      state :finished
      state :archived
      state :on_hold

      event :start do
        transitions from: :new, to: :started, guard: :can_be_started?
      end

      event :pause do
        transitions from: :started, to: :on_hold
      end

      event :resume do
        transitions from: :on_hold, to: :started
      end

      event :finish do
        transitions from: :started, to: :finished
      end

      event :archive do
        transitions from: %i[finished on_hold], to: :archived
      end
    end
  end

  private

  def can_be_started?
    false
  end
end
