class Project < ApplicationRecord
  include AASM
  enum objective_type: { production: 0, research: 1, education: 2, community: 3 }

  validates :name, presence: true
  validates :code, uniqueness: true, presence: true

  aasm column: :state, whiny_persistence: true do
    state :new, initial: true
    state :started
    state :finished
    state :archived
    state :on_hold

    event :start do
      transitions from: :new, to: :started
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
      transitions from: [:finished, :on_hold], to: :archived
    end
  end
end
