module AdminHelper
  MAX_TEXT_PREVIEW_SIZE = 50.freeze

  def truncated_description(description)
    preview = description[0, MAX_TEXT_PREVIEW_SIZE]
    preview += '...' if description.size > MAX_TEXT_PREVIEW_SIZE
    preview
  end
end
