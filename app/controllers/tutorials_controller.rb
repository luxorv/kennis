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
                       <%=form_tag "/tutorials", method: "post"  do %> 
                          <%= label_tag :input %><br>
                          <%= text_area_tag :input %><br>
                          <%= label_tag :output %><br>
                          <%= text_area_tag :output %><br>
                          <%= submit_tag "Execute", id: "code-submit"%>
                       <% end %>
                  </div>
                  <script>
                    var editor = ace.edit("editor");
                    editor.setOptions({
                      autoScrollEditorIntoView: true,
                      theme: "ace/theme/monokai",
                      showPrintMargin: false,
                      mode: "ace/mode/javascript"
                    });
                  </script>')
    end
  end
end
