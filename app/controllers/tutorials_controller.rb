class TutorialsController < ApplicationController
  
  require 'sectionizer'
  require 'open3'
  
  def index
  end

  def show
    #@output = execute params[:code], params[:input]
    
    respond_to do |format|
      format.js{ @output = execute params[:code], params[:input] }
      format.html
      #format.text {render text: @output }
      #format.html {render text: @output}
      #format.xml { render xml:  @output }
    #binding.pry
    end
  end

  def create
    #render plain: params
    sectionize_tutorial
    render 'show'
  end
  
  def executecode
    binding.pry
    #render plain: params 
   # @output = "La vaca"
    #respond_to do |format|
      #format.js      #format.text {render text: @output }
      #format.html {render 'show'}
      #format.xml { render xml:  @output }
     # end
  end
  

  private

  def sectionize_tutorial
    page = Sectionizer.new params[:url]
    sections = page.sectionize
 
    File.open('app/views/tutorials/show.html.erb', 'w') do |file|
      file.write "<%= button_tag 'Show editor', id: 'editor-button' %>"
      
      sections.each_key do |key|
        #binding.pry
        file.write(sections[key][:title])
        #file.write sections[key][:content]
        #binding.pry
      end
      file.write('<div id="todo-editor">
                     <div id="editor">function foo(items) {
                        var x = "All this is syntax highlighted"
                        return x;
                       }</div><br>
                      <%= label_tag :input %><br>
                      <%= text_area_tag :input %><br>
                      <%= label_tag :outpute %><br>
                      <%= text_area_tag :output, @output %><br>
                      <%= submit_tag "Execute", id: "code-submit"%>
                       
                  </div>'
                  )
    end
  end

  def execute code, input
    # files extentions and execution commands
    language = :ruby
    languages = {cpp: ['.cpp',"g++ program.cpp -o program.out"], 
                 ruby: ['.rb', "ruby tmp/programs/program.rb"], 
                 python: ['.py', "python program.py"], 
                 c: ['.c', "gcc program.c -o a.out"] }
    
    if languages.has_key? language
      File.open("tmp/programs/program#{languages[language][0]}", 'w') do |file|
        file.write code
      end
      puts("#{`g++ program.cpp -o program.out tmp/programs/program."#{languages[language][0]}"`}") if languages[language][0] == '.cpp'
       end
    
    o,e,s = Open3.capture3('./tmp/programs/program.out', stdin_data: input) if languages[language][0] == '.cpp'
    o,e,s = Open3.capture3("#{languages[language][1]}", stdin_data: input)
    binding.pry
    return o 
  end
end
