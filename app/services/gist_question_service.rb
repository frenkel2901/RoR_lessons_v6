class GistQuestionService

  GITHUB_TOKEN = ENV['GITHUB_TOKEN']

  def initialize(question, client: default_client)
    @question = question
    @test = question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: GITHUB_TOKEN)
  end

  #def structured_gist
  #  Struct.new("StructuredGist", :id, :url)
  #  gist = @client.create_gist(gist_params)
  #  Struct::StructuredGist.new(gist[:id], gist[:html_url])
  #end
end
