require_relative 'crawler'

class Sectionizer
  def initialize url
    crawl = Crawler.new url
    #obtain the children of the page tutorial container(which can be an <article>, <div>, <section>) so, we can iterate them
    @page_elements = crawl.extract_readable_info_from_page.children 
    @sections = {}                                # will save the tutorial as a set of titles and content organized by keys and values
    @title_tags = get_titles_tag
  end

  def get_titles_tag
    #deduces the tags used for the page titles (the hs)
    
    return 'h1' if @page_elements.search('h1').size >= 1
    return 'h2' if @page_elements.search('h2').size >= 1
    return 'h3' if @page_elements.search('h3').size >= 1
    return 'h4' if @page_elements.search('h4').size >= 1
    return 'h5' if @page_elements.search('h5').size >= 1
    return 'h6' if @page_elements.search('h6').size >= 1
  end

  def sectionize
    
    section_number = 0
    titles = @page_elements.search(@title_tags)

    @page_elements.each do |c|
      #binding.pry
      if c.class == Nokogiri::XML::Element and titles.include? c
        doc = Nokogiri::XML('')                             #creates a document where elements can be created(can be see as an html or xml document)
        title_div = Nokogiri::XML::Node.new 'div', doc      #creates a div in the document
        content_div = title_div.clone                       #copy title_div to content_div
        title_div['class'] = 'title'                        #gives the content_div a class named title
        content_div['class'] = 'content'                  
        title_div << c
        #binding.pry
        section_number += 1
        @sections[section_number.to_s] = {title: title_div, content: content_div}
      elsif @sections[section_number.to_s] != nil
      #binding.pry
      @sections[section_number.to_s][:content] << c
      end
    end
    @sections
  end
end

#crawl = Crawler.new 'http://www.readability.com/m?url=http://railsguides.net/advanced-rails-model-generators/'
#crawl = Crawler.new 'http://www.readability.com/m?url=http://guides.rubyonrails.org/getting_started.html'
#crawl = Crawler.new 'http://www.readability.com/m?url=http://cwbuecheler.com/web/tutorials/2013/node-express-mongo/'
#crawl = Crawler.new 'http://www.readability.com/m?url=http://www.regular-expressions.info/tutorial.html'
#crawl = Crawler.new 'http://www.readability.com/m?url=http://blog.xenodesystems.com/2013/01/aprendamos-juntos-coffeescript-de-la.html' #does not work
#crawl = Crawler.new 'http://www.readability.com/m?url=http://blog.teamtreehouse.com/the-absolute-beginners-guide-to-coffeescript'
#crawl = Crawler.new 'http://www.readability.com/m?url=http://coenraets.org/blog/phonegap-tutorial/'


#binding.pry
sec = Sectionizer.new 'http://www.readability.com/m?url=http://railsguides.net/advanced-rails-model-generators/'
secciones = sec.sectionize

#binding.pry

File.open("rails.html", "w") do |file|
  file.write(secciones["2"][:title])
  file.write(secciones["2"][:content])
end


