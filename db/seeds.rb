require 'json'
require 'date'
require 'pry'

ARTICLE_IMAGES =
{
  "Catalan Independence":
  ["https://images.ecosia.org/FY28O5m_ZcGa2lp9BQxtPIpwm5Y=/0x390/smart/http%3A%2F%2Fgocartours.com%2Fwp-content%2Fuploads%2F120912020406-spain-catalonia-protest-story-top.jpg",
    "https://images.ecosia.org/lw8E1aFKxsN_bxTwL5WXvTXKHn0=/0x390/smart/https%3A%2F%2Fcdn01.theintercept.com%2Fwp-uploads%2Fsites%2F1%2F2017%2F10%2Fcatalonia-referendum-spain-protests-aftermath-robert-mackey-1506976177-article-header.jpg",
    "https://images.ecosia.org/kM9sT7KDiR-vLDbjue3NoEKaLlg=/0x390/smart/http%3A%2F%2Fi.dailymail.co.uk%2F1%2F2018%2F03%2F25%2F17%2Fwire-2574640-1521996944-988_634x422.jpg"
  ],
  "Brexit":
  ["https://cdn.newsapi.com.au/image/v1/944db993e767e5f692c418a11ffe6bc2",
  "https://cdn2.i-scmp.com/sites/default/files/styles/landscape/public/images/methode/2016/09/14/e5f952ec-799d-11e6-aba3-c12eb464ff87_1280x720.JPG?itok=uWtw4q87",
  "https://fm.cnbc.com/applications/cnbc.com/resources/img/editorial/2018/11/15/105575963-1542269439054gettyimages-1061486868.530x298.jpeg?v=1542269452"]
}


LAT = %w[-8.6594824 -8.678640 -8.649100 -8.697390]
LONG = %w[115.1301361 115.262720 115.137890 115.161940]

FIRST_NAMES = %w[James Sally Claire Hennery Stine Barry Sophia Ava Jackson Olivia Aiden Lucas Liam]
LAST_NAMES = %w[Smith Johnson Williams Brown Davis Miller Wilson Thomas Gonzalez Patterson Cox Simmons Bryant]

TOPICS = ["Catalan Independence", "World War II", "Syrian Civil War", "Woodburn Forest Oil Drill", "Brexit"]

TOPIC_IMAGES = {
  "Catalan Independence": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0Sh9wgqQ9pkZvMYFbo2YoDwp7unpK4lld5ergTX49wUBrkhUUnw",
  "Brexit": "data:image/jpeg;base64,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"
}


  # "https://nationalinterest.org/sites/default/files/styles/desktop__1486_x_614/public/main_images/image-2018-08-03%20%282%29.jpg?itok=A5yxqLOJ",
  # "http://mediad.publicbroadcasting.net/p/shared/npr/styles/x_large/nprshared/201805/145931894.jpg",
  # "https://i.ytimg.com/vi/IIXyTevovgQ/maxresdefault.jpg https://scd.france24.com/en/files/imagecache/home_1024/article/image/brexit-drapeau-131118-m.jpg"


EVENTS = {
  "Catalan Independence": ["Spanish president attacks Catalan Referendum", "Catalan President Flees into exile", "Riot police clash with referendum voters"],
  "World War II": ["War is Declared", "Battle of the Bulge", "V-E Day"],
  "Syrian Civil War": ["President Assad sacks Hama governor", "Government steps up the Homs bombardment", "Prime Minister Riad Hijab defects"],
  "Woodburn Forest Oil Drill": ["Start drilling for oil", "PSNI accused of squandering £1m on policing oil drill protest", "Company behind Woodburn Forest oil drill call off project"],
  "Brexit": ["Referendum Called", "Hard or soft brexit", "Brexit deal"]
}

EVENTS_LOCATIONS = {
  "Catalan Independence": "Barcelona,Spain",
  "World War II": "Aleppo,Syria",
  "Syrian Civil War": "Berlin,Germany",
  "Woodburn Forest Oil Drill": "Woodburn,NorthernIreland",
  "Brexit": "London,UK"
}

EVENTS_DATES = {
  "Catalan Independence": [[2017,9,22],[2017,10,1],[2018,10,5]],
  "World War II": [[1917,4,6],[1939,9,1],[1944,12,16]],
  "Syrian Civil War": [[1945,9,2],[2012,2,22],[2012,10,1]],
  "Woodburn Forest Oil Drill": [[2016,5,18],[2016,6,17],[2016,7,9]],
  "Brexit": [[2016,1,12], [2016,6,17], [2018,11,14]]
}

# EVENTS_DATES = [
#   # Catalan
#   [2017,9,22],
#   [2017,10,1],
#   [2018,10,5],
#   # WWII
#   [1917,4,6],
#   [1939,9,1],
#   [1944,12,16],
#   # Syrian
#   [1945,9,2],
#   [2012,2,22],
#   [2012,10,1],
#   # Woodburn
#   [2016,5,18],
#   [2016,6,17],
#   [2016,7,9],
#   # Brexit
#   [2016,1,12],
#   [2016,6,17],
#   [2018,11,14]
# ]

EVENTS_IMAGES = {
  "Catalan Independence":
  ["https://images.indianexpress.com/2017/10/mariano-rajoy.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUUWO3Fd22RhWF6FyxCh7hFzB8puX4lBZ16AotKJQLQuAXvrVwRg",
  "https://images.indianexpress.com/2017/10/catalonia-7591.jpg"],

  "Brexit":
    ["https://cdn.newsapi.com.au/image/v1/944db993e767e5f692c418a11ffe6bc2",
    "https://cdn2.i-scmp.com/sites/default/files/styles/landscape/public/images/methode/2016/09/14/e5f952ec-799d-11e6-aba3-c12eb464ff87_1280x720.JPG?itok=uWtw4q87",
    "https://fm.cnbc.com/applications/cnbc.com/resources/img/editorial/2018/11/15/105575963-1542269439054gettyimages-1061486868.530x298.jpeg?v=1542269452"],

  "World War II":
  ["https://bloximages.newyork1.vip.townnews.com/hickoryrecord.com/content/tncms/assets/v3/editorial/7/31/7312bc52-e393-11e8-adc1-6f492aca5b0d/5be49a127e60f.image.jpg",
  "https://news.wttw.com/sites/default/files/field/image/1_1.jpg",
  "https://www.readex.com/sites/default/files/Omaha%20World%20Herald%20%2005-07-1945.jpg"],

  "Syrian Civil War":
  ["http://www.irishnews.com/picturesarchive/irishnews/irishnews/2016/05/17/172606801-83dc0b18-72cb-4002-82d7-703142bf54ca.jpg",
  "https://cdn-01.belfasttelegraph.co.uk/news/northern-ireland/article34847449.ece/ed28c/AUTOCROP/w620h342/2016-07-01_new_22448590_I1.jpg",
  "http://www.irishnews.com/picturesarchive/irishnews/irishnews/2016/06/16/190106194-34f2c7b8-d29f-458d-8ad1-d69524b8dc1f.jpg"],

  "Woodburn Forest Oil Drill":
   ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6FbPGh6Y9CHp5ezoiVXI45-ycLnwAgVsCD7utOJ82awNeIhtZaA",
    "https://hannahwoodwardwrites.files.wordpress.com/2016/10/hard-or-soft-brexit.jpg",
    "https://img.rasset.ie/0010ff9e-500.jpg"]

}


EVENTS_DESCRIPTION = [
"Summary: The story of the controversial test oil drill site in Woodburn Forest in Northern Ireland, UK choosing to cease operations"
]


puts "-------------------------------------------"
puts "Removing old data"
puts ""

# User.destroy_all

# Topic.destroy_all
# Event.destroy_all

# Author.destroy_all
# Publisher.destroy_all

# Article.destroy_all

# SaveArticle.destroy_all
# UserScore.destroy_all
# FollowingItem.destroy_all

puts "-------------------------------------------"
puts "Seeding started"
puts ""

#### Create new users ####
puts "-------------------------------------------"
puts "Seeding Users"
puts ""

FIRST_NAMES.each_with_index do |name, idx|

    obj_data = {
        first_name: name,
        last_name: LAST_NAMES[idx],
        email: "#{name}@#{name}.com",
        password: 123456,
        photo: nil
    }

    user = User.new(obj_data)
    user.save!

    puts "User #{user.first_name} created"
end


["Catalan Independence", "Brexit"].each_with_index do |topic, t_idx|

response_raw = File.read(File.expand_path("db/articles_#{t_idx}.json"))
response = JSON.parse(response_raw)
array_response = response["articles"]["results"]


puts "-------------------------------------------"
puts "Seeding #{topic} TOPIC"
#### Create Topic ####

    obj_data = {
        name: topic,
        image_url: TOPIC_IMAGES[topic]
    }

    topic = Topic.new(obj_data)
    topic.save!

    puts "Topics created: #{topic.name}"


#### Create Event ####
puts "-------------------------------------------"
puts "Seeding EVENTS"

EVENTS[topic.name.to_sym].each_with_index do |event, idx|

    obj_data = {
        name: event,
        description: EVENTS_DESCRIPTION.sample,
        image_url: EVENTS_IMAGES[idx],
        date_time: Date.new(EVENTS_DATES[topic.name.to_sym][idx][0],EVENTS_DATES[topic.name.to_sym][idx][1],EVENTS_DATES[topic.name.to_sym][idx][2]),
        location: EVENTS_LOCATIONS[topic],
        lat: LAT.sample,
        lng: LONG.sample,
        topic_id: t_idx + 1
    }

    event = Event.new(obj_data)
    event.save!

    puts "Event created: #{event.name}"
    puts "Topic ID chosen: #{event.topic_id}"
end


#### Create new publisher using article source ####
puts "-------------------------------------------"
puts "Seeding PUBLISHERS"
puts ""

array_response.each do |article|

    src = article["source"]

    obj_data = {
        image_url: 'https://upload.wikimedia.org/wikipedia/en/thumb/f/ff/BBC_News.svg/1280px-BBC_News.svg.png',
        web_url: src["uri"],
        name: src["title"],
        location: EVENTS_LOCATIONS[topic.name.to_sym],
        lat: LAT.sample,
        lng: LONG.sample,
        description: src["description"]
    }

    publisher = Publisher.new(obj_data)
    publisher.save!

    puts "Publisher created: #{obj_data[:name]}"
end

#### Create new author
puts "-------------------------------------------"
puts "Seeding AUTHORS"
puts ""

array_response.each do |article|

  ## Iterating over "authors" because is an array

  article["authors"].each do |author|

    obj_data = {
        first_name: author["name"].split[0],
        last_name: author["name"].split[1],
        twitter_handle: "@RogerPubill",
        location: EVENTS_LOCATIONS[topic.name.to_sym],
        lat: LAT.sample,
        lng: LONG.sample
    }

    author = Author.new(obj_data)
    author.save!

    puts "author created: #{obj_data[:first_name]}"

  end
end

#     ### Create new article
puts "-------------------------------------------"
puts "Seeding ARTICLES"
puts ""

array_response.each do |article|

  a = article

    obj_data = {
        title: a["title"], ### To be changed
        description: a["title"], ### To be changed
        body_text: a["body"],
        image_url: ARTICLE_IMAGES[topic.name.to_sym],
        source_url: a["url"],
        date_time_published: a["dateTime"],
        publishing_type: a["dataType"],
        language: a["lang"],
        location: EVENTS_LOCATIONS[topic.name.to_sym],
        lat: LAT.sample,
        lng: LONG.sample,
        count_views: (200..5000).to_a.sample,
        average_user_score: (-5..5).to_a.sample,
        published: true,
        author_id: Author.all.sample.id,
        event_id: Event.all.sample.id,
        publisher_id: Publisher.all.sample.id
    }

    publisher = Article.new(obj_data)
    publisher.save!

    puts "Article created: #{obj_data[:title]}"
end



#     ### Create new following_item
puts "-------------------------------------------"
puts "Seeding FOLLOWED ITEMS"
puts ""

puts "Creating following_item"

  5.times do

    type = %w[Topic Event].sample
    id = type == 'Topic' ? rand(1..1) : rand(1..3)

      obj_data = {
        follower_type: type,
        follower_id: id,
        user_id: User.all.sample.id
      }
      # binding.pry
      following = FollowingItem.new(obj_data)
      following.save!

      puts "Following Item created: #{obj_data[:follower_type]}"
  end

#     ### Create user scores
puts "-------------------------------------------"
puts "Seeding USER SCORES"
puts ""

puts "Creating user scores"

  20.times do

      obj_data = {
        score: rand(-5..5),
        article_id: Article.all.sample.id,
        user_id: User.all.sample.id
      }

      score = UserScore.new(obj_data)
      score.save!

      puts "Score Item created: #{obj_data[:score]}"
  end


#     ### Create saved articles
puts "-------------------------------------------"
puts "Seeding SAVED ARTICLES"
puts ""

puts "Creating Save Articles"

  60.times do

      obj_data = {
        article_id: Article.all.sample.id,
        user_id: User.all.sample.id
      }

      saveArticle = SaveArticle.new(obj_data)
      saveArticle.save!

      puts "SaveArticle created"
  end


puts "-------------------------------------------"
puts "BOOM SEEDED"
puts ""


end