require 'optparse'
include OptionParser::Arguable

class Alfi::Cli
  BINTRAY_OPTIONS_FILE_NAME = File.expand_path('~/.alfi_bintray.json')

  def exit_with(message)
    puts message
    exit 1
  end

  def call(arguments)
    @search_type = []
    create_options_parser
    search_param = @all_defined_arguments.include?(arguments.first) ? nil : arguments.shift
    @bintray_username = nil
    @bintray_key = nil
    @prefix = "implementation"
    @single_quotes = false
    @opt_parser.parse!(arguments)

    parse_bintray_auth

    exit_with("Missing query parameter\n".red + @opt_parser.help) unless search_param

    Alfi::Search.new.call(search_param, @search_type, @prefix, @single_quotes)
  end

  def create_options_parser
    @all_defined_arguments = [
      '-u',
      '--user',
      '-k',
      '--key',
      '-r',
      '--repository',
      '-h',
      '--help',
      '-v',
      '--version',
      '-p',
      '--prefix',
      '-s',
      '--single-quotes'
    ]
    @opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: alfi SEARCH_QUERY [OPTIONS]"
      opts.separator  ''
      opts.separator  'Options'

      opts.on('-u BINTRAY_USER_NAME', '--user BINTRAY_USER_NAME', 'your bintray user name') do |bintray_username|
        @bintray_username = bintray_username
      end
      opts.on('-k BINTRAY_KEY', '--key BINTRAY_KEY', 'your bintray api key') do |bintray_key|
        @bintray_key = bintray_key
      end
      opts.on('-h', '--help', 'Displays help') do
        puts opts.help
        exit
      end
      opts.on('-v', '--version', 'Displays version') do
        puts Alfi::VERSION
        exit
      end
      opts.on('-p PREFIX', '--prefix PREFIX', 'Use custom prefix instead of "implementation"') do |prefix|
        @prefix = prefix
      end
      opts.on('-s', '--single-quotes', 'Use single quotes instead of double quotes') do
        @single_quotes = true
      end
      opts.on('-r REPOSITORY_NAME', '--repository REPOSITORY_NAME', 'If should search on maven, jCenter or mavenCentral ') do |repository_name|
        if repository_name != "maven" && repository_name != "jcenter" && repository_name != "mavencentral"
          puts "Please choose one of the following maven, jcenter or mavencentral"
          exit
        end

        if repository_name.downcase == "maven"
          @search_type << "m"
        end

        if repository_name.downcase == "mavencentral"
          @search_type << "maven"
        end

        if repository_name.downcase == "jcenter"
          @search_type << "jcenter"
        end
      end

      opts.separator  "\nNow you are using alfi credentials for Bintray".yellow
      opts.separator  "But you also could enter your authentication data if you want. "\
                      "It will be saved once you provided it\n".green unless @bintray_username
    end
  end

  def parse_bintray_auth
    $bintray_auth = if @bintray_username && @bintray_key
                    # write new auth data
                    new_data = { user_name: @bintray_username, api_key: @bintray_key }
                    File.open(BINTRAY_OPTIONS_FILE_NAME, 'w+') do |f|
                      f.puts new_data.to_json
                    end
                    new_data
                  else
                    # read old auth data
                    return unless File.exist?(BINTRAY_OPTIONS_FILE_NAME)
                    auth_data = JSON.parse(File.read(BINTRAY_OPTIONS_FILE_NAME) || '{}', symbolize_names: true)
                    auth_data if auth_data[:user_name] && auth_data[:api_key]
                  end
  end
end
