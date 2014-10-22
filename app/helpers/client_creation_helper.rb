helpers do
  CREDENTIAL_STORE_FILE = "#{$0}-oauth2.json"

  def logger; settings.logger end

  def api_client; settings.api_client; end

  def calendar_api; settings.calendar; end

  def user_credentials
    # Build a per-request oauth credential based on token stored in session
    # which allows us to use a shared API client.
    @authorization ||= (
      auth = api_client.authorization.dup
      auth.redirect_uri = to('/oauth2callback')
      auth.update_token!(session)
      auth
    )
  end

  configure do
    log_file = File.open('calendar.log', 'a+')
    log_file.sync = true
    logger = Logger.new(log_file)
    logger.level = Logger::DEBUG

    client = Google::APIClient.new(
      :application_name => 'Ruby Calendar sample',
      :application_version => '1.0.0')

    file_storage = Google::APIClient::FileStorage.new(CREDENTIAL_STORE_FILE)
    if file_storage.authorization.nil?
      client_secrets = Google::APIClient::ClientSecrets.load
      # client_secrets = ENV["client_secret"].to_json
      client.authorization = client_secrets.to_authorization
      client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
    else
      client.authorization = file_storage.authorization
    end

    # Since we're saving the API definition to the settings, we're only retrieving
    # it once (on server start) and saving it between requests.
    # If this is still an issue, you could serialize the object and load it on
    # subsequent runs.
    calendar= client.discovered_api('calendar', 'v3')
    $service = calendar
    set :logger, logger
    set :api_client, client
    set :calendar, calendar
  end

end
