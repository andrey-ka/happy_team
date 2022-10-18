module ApplicationHelper
  include Pagy::Frontend

  BOOTSTRAP_CLASS_ALERTS_MAP = {
    alert: 'alert-danger',
    error: 'alert-danger',
    notice: 'alert-primary',
    success: 'alert-success'
  }.freeze

  def flash_class(level)
    BOOTSTRAP_CLASS_ALERTS_MAP[level.to_sym]
  end

  def enum_options_for_select(klass, field, selected)
    transformed_options = klass.public_send(field).map do |key, value|
      [key.titleize, klass.public_send(field).key(value)]
    end
    options_for_select(transformed_options, selected)
  end

  def possible_state_options_for_select(instance)
    options_for_select(instance.aasm.states(permitted: true))
  end

  # @todo - For future performance improvement
  def associated_options_for_select(scope, key_field)
    options_for_select(scope.map { |r| [r.public_send(key_field), r.id]})
  end
end
