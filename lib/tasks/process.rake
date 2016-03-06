namespace :process do
  task parse: :environment do
    require 'open-uri'
    doc = Nokogiri::HTML(open("http://www.radiohit.si/index.php?show=live&f=liveJSON"))
    song = JSON.parse(doc)
    if (Song.last.name != song["songTitle"]) && song["songTitle"] != "GOVORNA VSEBINA"
      Song.create(name: song["songTitle"])
    end
  end
end
