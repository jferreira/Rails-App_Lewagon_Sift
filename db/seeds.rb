require 'json'
require 'date'
require 'pry'

ARTICLE_IMAGES =
{
  "Catalan Independence":[
    "https://images.ecosia.org/FY28O5m_ZcGa2lp9BQxtPIpwm5Y=/0x390/smart/http%3A%2F%2Fgocartours.com%2Fwp-content%2Fuploads%2F120912020406-spain-catalonia-protest-story-top.jpg",
    "https://images.ecosia.org/lw8E1aFKxsN_bxTwL5WXvTXKHn0=/0x390/smart/https%3A%2F%2Fcdn01.theintercept.com%2Fwp-uploads%2Fsites%2F1%2F2017%2F10%2Fcatalonia-referendum-spain-protests-aftermath-robert-mackey-1506976177-article-header.jpg",
    "https://images.ecosia.org/kM9sT7KDiR-vLDbjue3NoEKaLlg=/0x390/smart/http%3A%2F%2Fi.dailymail.co.uk%2F1%2F2018%2F03%2F25%2F17%2Fwire-2574640-1521996944-988_634x422.jpg"
  ],
  "Brexit":[
    "https://cdn.newsapi.com.au/image/v1/944db993e767e5f692c418a11ffe6bc2",
    "https://cdn2.i-scmp.com/sites/default/files/styles/landscape/public/images/methode/2016/09/14/e5f952ec-799d-11e6-aba3-c12eb464ff87_1280x720.JPG?itok=uWtw4q87",
    "https://fm.cnbc.com/applications/cnbc.com/resources/img/editorial/2018/11/15/105575963-1542269439054gettyimages-1061486868.530x298.jpeg?v=1542269452"
  ]
  "Syrian Civil War":[
    "-",
    "-",
    "-"
  ]
  "Woodburn Forest Oil Drill":[
    "-",
    "-",
    "-"
  ]
  "World War II":[
    "-",
    "-",
    "-"
  ]

}


LAT = %w[-8.6594824 -8.678640 -8.649100 -8.697390]
LONG = %w[115.1301361 115.262720 115.137890 115.161940]

FIRST_NAMES = %w[James Sally Claire Hennery Stine Barry Sophia Ava Jackson Olivia Aiden Lucas Liam]
LAST_NAMES = %w[Smith Johnson Williams Brown Davis Miller Wilson Thomas Gonzalez Patterson Cox Simmons Bryant]

TOPICS = [
  "Catalan Independence",
  "World War II",
  "Syrian Civil War",
  "Woodburn Forest Oil Drill",
  "Brexit"
]

TOPIC_IMAGES = {
  "Catalan Independence": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0Sh9wgqQ9pkZvMYFbo2YoDwp7unpK4lld5ergTX49wUBrkhUUnw",
  "Brexit":"https://gdb.voanews.com/9273396B-129E-4820-B0AE-DA98443CA531_cx0_cy10_cw0_w1023_r1_s.jpg"
}

  # "https://nationalinterest.org/sites/default/files/styles/desktop__1486_x_614/public/main_images/image-2018-08-03%20%282%29.jpg?itok=A5yxqLOJ",
  # "http://mediad.publicbroadcasting.net/p/shared/npr/styles/x_large/nprshared/201805/145931894.jpg",
  # "https://i.ytimg.com/vi/IIXyTevovgQ/maxresdefault.jpg https://scd.france24.com/en/files/imagecache/home_1024/article/image/brexit-drapeau-131118-m.jpg"


EVENTS = {
  "Syrian Civil War": [
    "Civil uprising in Syria - Mar 2011",
    "Russian intervention - Sep 2015",
    "Aleppo escalation and Euphrates Shield - Mar 2016"
  ],
  "Catalan Independence": [
    "Catalan parliament aproves referendum - 6 Sep 2017",
    "Independence referendum - 1 Oct 2017",
    "Post referendum fallout - 20 Oct 2017"
  ],
  "Woodburn Forest Oil Drill": [
    "Start drilling for oil - Mar 11 2016",
    "Company behind Woodburn Forest oil drill call off project - Jun 17 2016"
    "PSNI accused of squandering £1m on policing oil drill protest - 9 Jul 2016",
  ],
  "Brexit": [
    "European Union Referendum Act 2015 - 17 Dec 2015",
    "Hard or soft Brexit - 25 Jun 2018",
    "The Brexit deal - 19 Nov 2018"
  ],
  "World War II": [
    "War is Declared - 1 Sep 1939",
    "Battle of the Bulge - 16 Dec 1944",
    "Victory in Europe Day - 8 May 1945"
  ]
}

EVENTS_DESCRIPTIONS = {
  "Syrian Civil War":
    ["Description: The story of... Syrian Civil War: Event 1: Civil uprising in Syria - Mar 2011",
    "Description: The story of... Syrian Civil War: Event 34: Russian intervention - Sep 2015",
    "Description: The story of... Syrian Civil War: Event 204: Aleppo escalation and Euphrates Shield - Mar 2016"
  ],
  "Catalan Independence":
    ["Description: The story of... Catalan Independence: Event 1: Catalan parliament aproves referendum - 6 Sep 2017",
    "Description: The story of... Catalan Independence: Event 15: Independence referendum - 1 Oct 2017",
    "Description: The story of... Catalan Independence: Event 34: PSNI accused of squandering £1m on policing oil drill protest - 9 Jul 2016"
  ],
  "Woodburn Forest Oil Drill":
   ["Description: The story of... Woodburn Forest Oil Drill: Event 1: Start drilling for oil - Mar 11 2016",
    "Description: The story of... Woodburn Forest Oil Drill: Event 10: Company behind Woodburn Forest oil drill call off project - Jun 17 2016",
    "Description: The story of... PSNI accused of squandering £1m on policing oil drill protest - 9 Jul 2016"
  ],
  "Brexit":
    ["Description: The story of... Brexit: Event 1: Referendum Called",
    "Description: The story of... Brexit: Event 54: Hard or soft Brexit",
    "Description: The story of... Brexit: Event 86: The Brexit deal"
  ],
  "World War II":
    ["Description: The story of...World War II: Event 1: War is Declared",
    "Description: The story of...World War II: Event 450: Battle of the Bulge",
    "Description: The story of...World War II: Event 900: V-E Day"]
}

EVENTS_DESCRIPTION = [
"Summary: The story of the controversial test oil drill site in Woodburn Forest in Northern Ireland, UK choosing to cease operations",
"Summary: The story of the controversial test oil drill site in Woodburn Forest in Northern Ireland, UK choosing to cease operations",
"Summary: The story of the controversial test oil drill site in Woodburn Forest in Northern Ireland, UK choosing to cease operations",
"Summary: The story of the controversial test oil drill site in Woodburn Forest in Northern Ireland, UK choosing to cease operations",
"Summary: The story of the controversial test oil drill site in Woodburn Forest in Northern Ireland, UK choosing to cease operations",
"Summary: The story of the controversial test oil drill site in Woodburn Forest in Northern Ireland, UK choosing to cease operations",
"Summary: The story of the controversial test oil drill site in Woodburn Forest in Northern Ireland, UK choosing to cease operations",
"Summary: The story of the controversial test oil drill site in Woodburn Forest in Northern Ireland, UK choosing to cease operations",
"Summary: The story of the controversial test oil drill site in Woodburn Forest in Northern Ireland, UK choosing to cease operations",
"Summary: The story of the controversial test oil drill site in Woodburn Forest in Northern Ireland, UK choosing to cease operations",
"Summary: The story of the controversial test oil drill site in Woodburn Forest in Northern Ireland, UK choosing to cease operations",
"Summary: The story of the controversial test oil drill site in Woodburn Forest in Northern Ireland, UK choosing to cease operations",
"Summary: The story of the controversial test oil drill site in Woodburn Forest in Northern Ireland, UK choosing to cease operations",
"Summary: The story of the controversial test oil drill site in Woodburn Forest in Northern Ireland, UK choosing to cease operations",
"Summary: The story of the controversial test oil drill site in Woodburn Forest in Northern Ireland, UK choosing to cease operations"
]

EVENTS_IMAGES = {
  "Syrian Civil War":[
    "http://www.irishnews.com/picturesarchive/irishnews/irishnews/2016/05/17/172606801-83dc0b18-72cb-4002-82d7-703142bf54ca.jpg",
    "https://cdn-01.belfasttelegraph.co.uk/news/northern-ireland/article34847449.ece/ed28c/AUTOCROP/w620h342/2016-07-01_new_22448590_I1.jpg",
    "http://www.irishnews.com/picturesarchive/irishnews/irishnews/2016/06/16/190106194-34f2c7b8-d29f-458d-8ad1-d69524b8dc1f.jpg"
  ],
  "Catalan Independence":[
    "https://images.indianexpress.com/2017/10/mariano-rajoy.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUUWO3Fd22RhWF6FyxCh7hFzB8puX4lBZ16AotKJQLQuAXvrVwRg",
    "https://images.indianexpress.com/2017/10/catalonia-7591.jpg"
  ],
  "Brexit":[
    "https://cdn.newsapi.com.au/image/v1/944db993e767e5f692c418a11ffe6bc2",
    "https://cdn2.i-scmp.com/sites/default/files/styles/landscape/public/images/methode/2016/09/14/e5f952ec-799d-11e6-aba3-c12eb464ff87_1280x720.JPG?itok=uWtw4q87",
    "https://fm.cnbc.com/applications/cnbc.com/resources/img/editorial/2018/11/15/105575963-1542269439054gettyimages-1061486868.530x298.jpeg?v=1542269452"
  ],
  "World War II":[
    "https://bloximages.newyork1.vip.townnews.com/hickoryrecord.com/content/tncms/assets/v3/editorial/7/31/7312bc52-e393-11e8-adc1-6f492aca5b0d/5be49a127e60f.image.jpg",
    "https://news.wttw.com/sites/default/files/field/image/1_1.jpg",
    "https://www.readex.com/sites/default/files/Omaha%20World%20Herald%20%2005-07-1945.jpg"
  ],
  "Syrian Civil War":[
    "http://www.irishnews.com/picturesarchive/irishnews/irishnews/2016/05/17/172606801-83dc0b18-72cb-4002-82d7-703142bf54ca.jpg",
    "https://cdn-01.belfasttelegraph.co.uk/news/northern-ireland/article34847449.ece/ed28c/AUTOCROP/w620h342/2016-07-01_new_22448590_I1.jpg",
    "http://www.irishnews.com/picturesarchive/irishnews/irishnews/2016/06/16/190106194-34f2c7b8-d29f-458d-8ad1-d69524b8dc1f.jpg"
  ],
  "Woodburn Forest Oil Drill":[
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6FbPGh6Y9CHp5ezoiVXI45-ycLnwAgVsCD7utOJ82awNeIhtZaA",
    "https://hannahwoodwardwrites.files.wordpress.com/2016/10/hard-or-soft-brexit.jpg",
    "https://img.rasset.ie/0010ff9e-500.jpg"
  ]
}

EVENTS_DATES = {
  "Catalan Independence": [
    [2017,9,22],
    [2017,10,1],
    [2018,10,5]
  ],
  "World War II": [
    [1917,4,6],
    [1939,9,1],
    [1944,12,16]
  ],
  "Syrian Civil War": [
    [1945,9,2],
    [2012,2,22],
    [2012,10,1]
  ],
  "Woodburn Forest Oil Drill": [
    [2016,5,18],
    [2016,6,17],
    [2016,7,9]
  ],
  "Brexit": [
    [2016,1,12],
    [2016,6,17],
    [2018,11,14]
  ]
}

EVENTS_LOCATIONS = {
  "Catalan Independence": "Barcelona,Spain",
  "World War II": "Aleppo,Syria",
  "Syrian Civil War": "Berlin,Germany",
  "Woodburn Forest Oil Drill": "Woodburn,NorthernIreland",
  "Brexit": "London,UK"
}

puts "---------------------------------------------------------------------------------------------------------"
puts "---------------------------------------------------------------------------------------------------------"
puts "Removing all old data"
puts ""

# Article.destroy_all
# Event.destroy_all
# Topic.destroy_all

# Author.destroy_all
# Publisher.destroy_all

# SaveArticle.destroy_all
# UserScore.destroy_all
# FollowingItem.destroy_all

# User.destroy_all

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
