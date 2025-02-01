RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.start
  ensure
    DatabaseCleaner.clean
  end

  config.include FactoryBot::Syntax::Methods
end
