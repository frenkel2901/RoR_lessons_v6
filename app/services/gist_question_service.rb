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
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: "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")
  end
end
