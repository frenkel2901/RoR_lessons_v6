module TestsHelper    
  def year_now
    Time.current.year
  end
    
  def github_url(author:, repo:, title:)
    link_to title, "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'noopener nofollow'
  end
end
