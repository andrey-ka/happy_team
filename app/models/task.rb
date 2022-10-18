class Task < ApplicationRecord
  include StateWorkflow
  FOCUSABLE_TASKS_COUNT = 5

  belongs_to :project
  belongs_to :owner, class_name: 'Member', optional: true

  enum priority: { low: 0, medium: 1, high: 2 }, _suffix: :priority
  auto_increment :scoped_number, scope: :project_id, force: true, lock: false, before: :create

  validates :title, presence: true
  delegate :code, :name, to: :project, prefix: true
  delegate :full_name, to: :owner, prefix: true, allow_nil: true

  scope :priority, -> { order(priority: :desc) }
  scope :focusable, -> { priority.limit(FOCUSABLE_TASKS_COUNT) }

  def identifier
    [project_code, scoped_number].join('-')
  end

  private

  def can_be_started?
    owner.present?
  end
end
