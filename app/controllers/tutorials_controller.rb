class TutorialsController < ApplicationController
  require_relative '../../lib/sectionizer.rb'
  
  def index
  end

  def create
    render plain: params
  end

  private

  def sectionize_tutorial

  end
    
end
