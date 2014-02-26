class ParserComentariosProperPage
  attr_accessor :main_links
  def initialize(main_links)
    @main_links = main_links
    @array_comments = []
  end

  # get the proper comments
  def get_proper_comments
    @main_links.each do |url_page|
    # page to parse
      page_comentarios_proper_page = Nokogiri::HTML(open(url_page))
      # page title and url
      @title_news = page_comentarios_proper_page.css("div.more-news a").text
      @url_page = page_comentarios_proper_page.css("div.more-news a")[0]['href']
      # hater name and comment
      hater_name_comment = page_comentarios_proper_page.css("ol#comments article")
      hater_name_comment.each do |name_comment|
        @hater_name = name_comment.css("h6 a").text.scan(/(.+) \(\d+\)/)
        @hater_comment = name_comment.css("p")[0].text
        # date & time
        @date_tim = Time.now
        # add info to comments array
        @array_comments.push [@title_news, @url_page, @hater_name, @hater_comment, @date_time]
        print_info
      end
    end
  end

  # print the info – only for debug purposes
  def print_info
    puts @title_news
    puts @url_page
    puts @hater_name
    puts @hater_comment
    puts @date_time
    puts
  end

end