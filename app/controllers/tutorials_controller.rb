class TutorialsController < ApplicationController
  require 'sectionizer'
  
  def index
  end

  def show
  end

  def create
    #render plain: params
    sectionize_tutorial
    render 'show'
  end

  private

  def sectionize_tutorial
    page = Sectionizer.new params[:url]
    sections = page.sectionize

    File.open('app/views/tutorials/show.html.erb','w') do |file|
      sections.each_key do |key|
        file.write sections[key][:title]
        #file.write sections[key][:content]
        #binding.pry
      end
    end
  end
    
end
