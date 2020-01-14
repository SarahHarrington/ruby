class Application
    attr_accessor :environment
    def initialize
        @environment = environment
    end

    def connect_to_database
        puts "Connecting to #{@environment} database..."
    end

    def handle_request
        puts "Handling #{@environment} request..."
    end

    def write_to_log
        puts "Writing to #{@environment} log file..."
    end

    def in_environment(env)
        original_env = @environment
        @environment = env
        yield
    rescue Exception => e
        puts e.message
    ensure
        @environment = original_env
        puts "resetting to #{@environment}"
    end
end

app = Application.new
app.environment = :development

app.in_environment(:development) do
    app.connect_to_database
    app.handle_request
    raise "Boom!"
    app.write_to_log
end