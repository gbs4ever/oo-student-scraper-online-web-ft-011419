require 'open-uri'
require 'pry'


class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    data=[]
  file=doc.css("div.student-card").each do |element|
    data << a={:profile_url=>element.css("a").attribute("href").value,
    :name=>element.css(".student-name").text,
    :location=>element.css(".student-location").text}
end
data
  end

  def self.scrape_profile_page(profile_url)
      doc = Nokogiri::HTML(open(profile_url))
      file={}
      #this is the links css   (".social-icon-container a") .attribute("href").value
      links=doc.css(".social-icon-container a").map{|data|data.attribute("href").value}
      links.each do|tag|
        binding.pry
                if links.include?("linkedin")
                  file[:linkedin]="tag"
                  elsif links.include?(tag)
                    file[:github]="tag"
                  elsif links.include?(tag)
                      file[:twitter]="tag"
                    else
                        file[:blog]="tag"
                end

      end
      file
      end
#:profile_quote=>"\"Forget safety. Live where you fear to live. Destroy your reputation. Be notorious.\" - Rumi",
#     :bio=> "I'm a school"


end
