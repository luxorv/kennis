require 'mechanize'
require 'pry'

class Crawler
  def initialize an_url
   agent = Mechanize.new
   @page = agent.get(an_url)
   #binding.pry
  end

  def extract_readable_info_from_page
    article = @page.search('#rdb-article-content').search('div')[0].search('article').size
    section = @page.search('#rdb-article-content').search('div')[0].search('section').size
    div = @page.search('#rdb-article-content').search('div')[0].search('div').size

    #binding.pry

    return info = @page.search('#rdb-article-content').search('div')[0].search('article') if article >= 1
    return info = @page.search('#rdb-article-content').search('div')[0].search('section') if section >= 1
    return info = @page.search('#rdb-article-content').search('div')[0].search('div') if div >= 1

    #binding.pry
  end
end


