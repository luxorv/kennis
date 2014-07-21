class TutorialsController < ApplicationController
  
  require 'sectionizer'
  require 'open3'
  
  def index
  end

  def show
    #@output = execute params[:code], params[:input]
    
    respond_to do |format|
      format.js{ @output = execute params[:code], params[:input], params[:language] }
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
                     <%= label_tag "Select Language: " %>
                     <select id="lang">
                        <option value="c_cpp">C/C++</option>
                        <option value="ruby">Ruby</option>
                        <option value="python">Python</option>
                        <option value="java">Java</option>
                     </select> 
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

  def execute code, input, language
    # files extentions and execution commands
    language = language.to_sym
    languages = {c_cpp: ['.cpp',"g++ tmp/programs/program.cpp -o tmp/programs/program.out"], 
                 ruby: ['.rb', "ruby tmp/programs/program.rb"], 
                 python: ['.py', "python tmp/programs/program.py"], 
                 c: ['.c', "gcc program.c -o a.out"] }
    
    if languages.has_key? language
      File.open("tmp/programs/program#{languages[language][0]}", 'w') do |file|
        file.write code
      end
      puts(`g++ tmp/programs/program.cpp -o tmp/programs/program.out`) if languages[language][0] == '.cpp'
    end
    #binding.pry
    if languages[language][0] == '.cpp'
      o,e,s = Open3.capture3('./tmp/programs/program.out', stdin_data: input)
      #binding.pry
    else
      o,e,s = Open3.capture3("#{languages[language][1]}", stdin_data: input)
    end
    #binding.pry
    return o 
  end
end
