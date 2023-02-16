class OctokitClient
  GITHUB_TOKEN = ENV['GITHUB_TOKEN'].freeze

  def initialize
    @client = setup_client
  end

  def create_gist(params)
    #@client.create_gist(params)
    @http_client.post('gists') do |request|
    request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
    request.headers['Content-Type'] = 'aplication/json'
    request.body = params.to_json
  end

  private

  def setup_client
    Octokit::Client.new(access_token: GITHUB_TOKEN)
  end
end
