class Task < ApplicationRecord
  include StateWorkflow

  belongs_to :project
  belongs_to :owner, class_name: 'Member', optional: true

  enum priority: { low: 0, medium: 1, high: 2 }, _suffix: :priority
  auto_increment :scoped_number, scope: :project_id, force: true, lock: false, before: :create

  validates :title, presence: true
  delegate :code, to: :project, prefix: true

  def identifier
    [project_code, scoped_number].join('-')
  end

  private

  def can_be_started?
    owner.present?
  end
end
