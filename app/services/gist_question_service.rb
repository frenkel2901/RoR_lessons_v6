StructuredGist = Struct.new(:status, :url) do
  def success?
    status == 201
  end
end

class GistQuestionService

  def initialize(test_passage, client: default_client)
    @test_passage = test_passage
    @question = test_passage.current_question
    @test = @question.test
    @client = client
  end

  def call
    gist = @client.create_gist(gist_params)

    if created?
      to_gist = @question.gists.create!({url: gist.html_url, question_id: @question.id, user_id: @test_passage.user_id})
    else
    end

    StructuredGist.new(@client.last_response.status, to_gist.url)
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

  def created?
    @client.last_response.status == 201
  end
end
