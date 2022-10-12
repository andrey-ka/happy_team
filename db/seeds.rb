class Notifier

  attr_reader :messages
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
end
@notifier = Notifier.new

def create_member(params)
  if Member.where(email: params[:email]).exists?
     @notifier.add_message("Member with email: #{params[:email]} exists.")
  else
    pw = ENV['DEVELOPMENT_DEFAULT_PASSWORD']
    Member.create!(params.merge({ password: pw, password_confirmation: pw }))
    @notifier.add_message("Created member with email: #{params[:email]}.")
  end
end

if ENV['DEVELOPMENT_SEEDS'].present?
  @notifier.add_summary "Dev seeds enabled starting..."
  @notifier.add_summary "Creating members"

  # Creating members
  create_member(first_name: 'Andrii', last_name: 'Kaban', email: 'andrii.k@mail.com', role: :admin)
  create_member(first_name: 'John',   last_name: 'Smith', email: 'john.s@mail.com')
  create_member(first_name: 'Frank', last_name: 'Brown', email: 'frank.b@mail.com')
end

@notifier.print
