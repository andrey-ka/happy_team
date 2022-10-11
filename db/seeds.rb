class Notifier
  def initialize
    @messages = []
  end
  def add_summary(string)
    messages << ' '
    messages << "===> #{string}..."
  end

  def add_message(string)
     messages << "  #{string}"
  end

  def print
    puts; puts 'rake db:seed summary:'
    messages.each { |m| puts m }
    puts
  end

  private

  attr_reader :messages
end

@notifier = Notifier.new

@notifier.add_summary "creating users"

@notifier.add_message "user 1"

@notifier.print
