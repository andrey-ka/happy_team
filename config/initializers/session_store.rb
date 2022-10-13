Rails.application.config.session_store(
  :active_record_store,
  key: "_happy_team_session-#{Rails.env}",
  secure: Rails.env.production?
)
