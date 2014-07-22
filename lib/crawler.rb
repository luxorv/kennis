require 'mechanize'
require 'pry'

class Crawler
  attr_reader :title
  def initialize an_url
   agent = Mechanize.new
   @page = agent.get(an_url)
   @title = @page.search('#rdb-article-title')
   #binding.pry
  end

  def extract_readable_info_from_page
    #binding.pry
    article = @page.search('#rdb-article-content').search('div')[0].search('article').size
    section = @page.search('#rdb-article-content').search('div')[0].search('section').size
    div = @page.search('#rdb-article-content').search('div')[0].search('div').size

    #binding.pry

    return info = @page.search('#rdb-article-content').search('div')[0].search('article') if article >= 1
    return info = @page.search('#rdb-article-content').search('div')[0].search('section') if section >= 1
    return info = @page.search('#rdb-article-content').search('div')[0].search('div') if div >= 1

    #binding.pry
  end

  def page_title
    @page.search('#rdb-article-title').search('h1')
  end
end


