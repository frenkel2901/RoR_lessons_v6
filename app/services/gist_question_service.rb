class GistQuestionService

  StructuredGist = Struct.new(:url, :status) do
    def success?
      self.status
    end
  end

  def initialize(test_passage, client: default_client)
    @test_passage = test_passage
    @question = test_passage.current_question
    @test = @question.test
    @client = client
  end

  def call
    gist = @client.create_gist(gist_params)

    if gist_created?
      to_gist = @question.gists.create!({url: gist.html_url, question: @question, user: @test_passage.user})
      url = to_gist.url
    else
      url = nil
    end

    StructuredGist.new(url, gist_created?)
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
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN'))
  end

  def gist_created?
    @client.last_response.status == 201
  end
end
