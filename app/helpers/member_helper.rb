module MemberHelper
  # @todo extract into decorator
  def member_task_title(task)
    "(#{task.identifier}) #{task.title}"
  end
end
