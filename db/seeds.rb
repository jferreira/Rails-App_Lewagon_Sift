require 'json'
require 'date'

response_raw = File.read(File.expand_path("db/catalan_articles.json"))

response = JSON.parse(response_raw)

array_response = response["articles"]["results"]

ARTICLE_IMAGES = [
    "https://images.ecosia.org/FY28O5m_ZcGa2lp9BQxtPIpwm5Y=/0x390/smart/http%3A%2F%2Fgocartours.com%2Fwp-content%2Fuploads%2F120912020406-spain-catalonia-protest-story-top.jpg",
    "https://images.ecosia.org/lw8E1aFKxsN_bxTwL5WXvTXKHn0=/0x390/smart/https%3A%2F%2Fcdn01.theintercept.com%2Fwp-uploads%2Fsites%2F1%2F2017%2F10%2Fcatalonia-referendum-spain-protests-aftermath-robert-mackey-1506976177-article-header.jpg",
    "https://images.ecosia.org/Oz4wI71ex9ilPFHRtENVEIzBfZ4=/0x390/smart/http%3A%2F%2Fwww.xpats.com%2Fsites%2Fdefault%2Ffiles%2Fstyles%2Fbig_article%2Fpublic%2Fcatl_0.png",
    "https://images.ecosia.org/kM9sT7KDiR-vLDbjue3NoEKaLlg=/0x390/smart/http%3A%2F%2Fi.dailymail.co.uk%2F1%2F2018%2F03%2F25%2F17%2Fwire-2574640-1521996944-988_634x422.jpg",
    "https://images.ecosia.org/kvzmtUcWSfnCDyhlJ7PhjqOz3Wo=/0x390/smart/http%3A%2F%2Fwww.politico.eu%2Fwp-content%2Fuploads%2F2017%2F09%2FGettyImages-492471246-1200x628.jpg"
]

LAT = %w[-8.6594824 -8.678640 -8.649100 -8.697390]
LONG = %w[115.1301361 115.262720 115.137890 115.161940]

FIRST_NAMES = %w[James Sally Claire Hennery Stine Barry Sophia Ava Jackson Olivia Aiden Lucas Liam]
LAST_NAMES = %w[Smith Johnson Williams Brown Davis Miller Wilson Thomas Gonzalez Patterson Cox Simmons Bryant]

TOPICS = ["Catalan Independence", "World War II", "Syrian Civil War", "Woodburn Forest Oil Drill", "Brexit"]
TOPIC_IMAGES = %w[https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0Sh9wgqQ9pkZvMYFbo2YoDwp7unpK4lld5ergTX49wUBrkhUUnw https://nationalinterest.org/sites/default/files/styles/desktop__1486_x_614/public/main_images/image-2018-08-03%20%282%29.jpg?itok=A5yxqLOJ http://mediad.publicbroadcasting.net/p/shared/npr/styles/x_large/nprshared/201805/145931894.jpg https://i.ytimg.com/vi/IIXyTevovgQ/maxresdefault.jpg https://scd.france24.com/en/files/imagecache/home_1024/article/image/brexit-drapeau-131118-m.jpg]

EVENTS = %w[
Spanish president attacks Catalan Referendum
Catalan President Flees into exile
Riot police clash with referendum voters
War is Declared
Battle of the Bulge
V-E Day
President Assad sacks Hama governor,
Government steps up the Homs bombardment,
Prime Minister Riad Hijab defects
Start drilling for oil
PSNI accused of squandering £1m on policing oil drill protest
Company behind Woodburn Forest oil drill call off project
Referendum Called
Hard or soft brexit
Brexit deal
]

EVENTS_LOCATIONS = ["Barcelona,Spain","Barcelona,Spain","Barcelona,Spain", "Aleppo,Syria","Aleppo,Syria","Aleppo,Syria", "Berlin,Germany","Berlin,Germany","Berlin,Germany", "Woodburn,NorthernIreland","Woodburn,NorthernIreland","Woodburn,NorthernIreland","London,UK","London,UK","London,UK"]

EVENTS_DATES = [
  # Catalan
  [2017,9,22],
  [2017,10,1],
  [2018,10,5],
  # WWII
  [1917,4,6],
  [1939,9,1],
  [1944,12,16],
  # Syrian
  [1945,9,2],
  [2012,2,22],
  [2012,10,1],
  # Woodburn
  [2016,5,18],
  [2016,6,17],
  [2016,7,9],
  # Brexit
  [2016,1,12],
  [2016,6,17],
  [2018,11,14]
]

EVENTS_IMAGES = %w[
https://images.indianexpress.com/2017/10/mariano-rajoy.jpg
https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUUWO3Fd22RhWF6FyxCh7hFzB8puX4lBZ16AotKJQLQuAXvrVwRg
https://images.indianexpress.com/2017/10/catalonia-7591.jpg
https://bloximages.newyork1.vip.townnews.com/hickoryrecord.com/content/tncms/assets/v3/editorial/7/31/7312bc52-e393-11e8-adc1-6f492aca5b0d/5be49a127e60f.image.jpg
https://news.wttw.com/sites/default/files/field/image/1_1.jpg
https://www.readex.com/sites/default/files/Omaha%20World%20Herald%20%2005-07-1945.jpg
http://www.irishnews.com/picturesarchive/irishnews/irishnews/2016/05/17/172606801-83dc0b18-72cb-4002-82d7-703142bf54ca.jpg
https://cdn-01.belfasttelegraph.co.uk/news/northern-ireland/article34847449.ece/ed28c/AUTOCROP/w620h342/2016-07-01_new_22448590_I1.jpg
http://www.irishnews.com/picturesarchive/irishnews/irishnews/2016/06/16/190106194-34f2c7b8-d29f-458d-8ad1-d69524b8dc1f.jpg
https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6FbPGh6Y9CHp5ezoiVXI45-ycLnwAgVsCD7utOJ82awNeIhtZaA
https://hannahwoodwardwrites.files.wordpress.com/2016/10/hard-or-soft-brexit.jpg
https://img.rasset.ie/0010ff9e-500.jpg
]

puts "Seeding started"

 ### Create new users ####

FIRST_NAMES.each_with_index do |name, idx|

    user_data = {
        first_name = name,
        last_name = LAST_NAMES[idx],
        email_address = "#{name}@#{name}.com",
        password = 123456,
        photo = nil
    }

    user = User.new(user_data)
    user.save!

    puts "User #{user.first_name} created"

end

### Create Topic ####
puts "Creating topics"

TOPICS.each_with_index do |topic, idx|
    topic_data = {
        name: topic
        image_url: TOPIC_IMAGES[idx]
    }

    topic = Topic.new(topic_data)
    topic.save!

    puts "Topics created: #{topic.name}"
end


### Create Event ####

puts "Creating Events"

EVENTS.each_with_index do |event, idx|

        i = 0

        case idx
          when idx < 3
          i = 1
          when idx < 6
          i = 2
          else
          i = 3
          end

    event_data = {
        name: event
        image_url: EVENTS_IMAGES[idx],
        date_time: Date.new(EVENTS_DATES[idx][0],EVENTS_DATES[idx][1],EVENTS_DATES[idx][2]),
        location: EVENTS_LOCATIONS[idx],
        lat: LAT.sample,
        lng: LONG.sample,
        topic_id: Topic.find_by(id: i)
    }

    event = Event.new(event_data)
    event.save!

    puts "Event created: #{event.name}"
end


### Create new publisher using article source ####

articles.results.each do |article|

    src = article.source

    publisher_data = {
        image_url: 'https://upload.wikimedia.org/wikipedia/en/thumb/f/ff/BBC_News.svg/1280px-BBC_News.svg.png',
        web_url: src.uri,
        name: src.title,
        location: EVENTS_LOCATIONS.sample,
        lat: LAT.sample,
        lng: LONG.sample,
        description: src.description,
        type: src.dataType
    }

    publisher = Publisher.new(publisher_data)
    publisher.save!

    puts "Publisher created: #{publisher_data.title}"

    ### Create new author

    article.authors.each do |author|

        author_data = {
            first_name: author.name.split[0],
            last_name: author.name.split[1],
            twitter_handle: @rogermutt,
            location: EVENTS_LOCATIONS.sample,
            lat: LAT.sample,
            lng: LONG.sample
        }

        author = Author.new(author_data)
        author.save!

        puts "author created: #{author_data.first_name}"
    end

    ### Create new article

    article_data = {
        name: article.title,
        description: article.title, ### To be changed
        body_text: article.body,
        image_url: ARTICLE_IMAGES.sample,
        source_url: url,
        dateTime: dateTime,
        type: dataType,
        language: lang,
        location: LOCATIONS.sample,
        lat: LAT.sample,
        lng: LONG.sample,
        count_views: (200..5000).to_a.sample,
        average_user_score: (-5..5).to_a.sample,
        published: true,
        author_id: Author.all.sample,
        event_id: Event.all.sample,
        publisher_id: Publisher.all.sample
    }

    publisher = Publisher.new(publisher_data)
    publisher.save!

    puts "Article created: #{publisher_data.title}"

end
