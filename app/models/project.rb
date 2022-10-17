class Project < ApplicationRecord
  include StateWorkflow

  has_many :tasks, dependent: :destroy

  enum objective_type: { production: 0, research: 1, education: 2, community: 3 }

  validates :name, presence: true
  validates :code, uniqueness: true, presence: true

  private

  def can_be_started?
    tasks.any?
  end
end
