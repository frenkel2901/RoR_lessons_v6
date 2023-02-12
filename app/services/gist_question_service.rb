class GistQuestionService

  GITHUB_TOKEN = ENV['GITHUB_TOKEN']

  def initialize(test_passage, client: default_client)
    @test_passage = test_passage
    @question = test_passage.current_question
    @test = @question.test
    @client = client
  end

  def call
    gist = structured_gist

    to_gist = @question.gists.new({url: gist.url, question_id: @question.id, user_id: @test_passage.user_id})

    gist if to_gist.save! || status?

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

  def status?
    @client.last_response.status == 201
  end

  def structured_gist
    Struct.new("StructuredGist", :id, :url)
    gist = @client.create_gist(gist_params)
    Struct::StructuredGist.new(gist[:id], gist[:html_url])
  end

end
