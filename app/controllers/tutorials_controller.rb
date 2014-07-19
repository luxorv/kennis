class TutorialsController < ApplicationController
  def index
  end

  def create
    render plain: params
  end
    
end
