module ApplicationHelper
  BOOTSTRAP_CLASS_ALERTS_MAP = {
    alert: 'alert-error',
    error: 'alert-error',
    notice: 'alert-info',
    success: 'alert-success'
  }.freeze

  def flash_class(level)
    ['alert', BOOTSTRAP_CLASS_ALERTS_MAP[level.to_sym]].join(' ')
  end
end
