class Comentarios1
  def initialize
    @main_links = Nokogiri::HTML(open("http://comentarios1.folha.com.br/"))
  end

 # get the links from the main 'comentarios' page
  def get_main_links
    main_links = Array.new
    @main_links.css("ol a").each do |x|
      if x[:href].include? 'http://comentarios1.folha.com.br/comentarios/'
        main_links.push x[:href]
      end
    end
    # return the links
    main_links
  end
end