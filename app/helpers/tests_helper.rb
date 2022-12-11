module TestsHelper
  def question_header(test, action)
    headers = { create: "Create New #{test.title} Question", edit: "Edit #{test.title} Question" }
      headers[action]
  end
    
  def year_now
    Time.current.year
  end
    
  def github_url(author:, repo:, title:)
    link_to title, "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'noopener nofollow'
  end
end
