# REQUIRED -----------------------------------------------------------

require 'json'
require 'date'
require 'pry'


# RANDOM LAT LONG ALL -----------------------------------------------------------


LAT = %w[-8.6594824 -8.678640 -8.649100 -8.697390]
LONG = %w[115.1301361 115.262720 115.137890 115.161940]



# USER -----------------------------------------------------------

FIRST_NAMES = %w[James Sally Claire Hennery Stine Barry Sophia Ava Jackson Olivia Aiden Lucas Liam]
LAST_NAMES = %w[Smith Johnson Williams Brown Davis Miller Wilson Thomas Hoilday Patterson Cox Simmons Bryant]

# TOPIC RELATED -----------------------------------------------------------

TOPIC_NAMES = [
  "Syrian Civil War",
  "Catalan Independence",
  "Woodburn Forest Oil Drill",
  "Brexit",
  "World War II"
]

TOPIC_IMAGES = {

  "Syrian Civil War": "http://mediad.publicbroadcasting.net/p/shared/npr/styles/x_large/nprshared/201805/145931894.jpg",
  "Catalan Independence":"https://upload.wikimedia.org/wikipedia/commons/b/b8/Carregues-Referendum-Barcelona-Escola-Ramon_EDIIMA20171002_0741_30.jpg",
  "Woodburn Forest Oil Drill": "https://i.ytimg.com/vi/IIXyTevovgQ/maxresdefault.jpg",
  "Brexit":"https://gdb.voanews.com/9273396B-129E-4820-B0AE-DA98443CA531_cx0_cy10_cw0_w1023_r1_s.jpg",
  "World War II": "https://nationalinterest.org/sites/default/files/styles/desktop__1486_x_614/public/main_images/image-2018-08-03%20%282%29.jpg?itok=A5yxqLOJ"

}

# EVENT RELATED -----------------------------------------------------------

EVENT_IMAGES = {
  "Syrian Civil War":[
    "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/RTSAK8X/lead_720_405.jpg?mod=1533691810",
    "http://syriauntold.com/wp-content/uploads/2013/08/400316_297144237056064_1491979536_n.jpg",
    "https://pbs.twimg.com/media/CrTU_9BWcAEEbFh.jpg"
  ],
  "Catalan Independence":[
    "https://s3.reutersmedia.net/resources/r/?m=02&d=20170906&t=2&i=1200283925&r=LYNXNPED8521P&w=1280",
    "https://cdn.theatlantic.com/assets/media/img/photo/2017/10/catalonia-tk/c01_AP17275433150843/main_900.jpg?1506971146",
    "https://cdn.cnn.com/cnnnext/dam/assets/171001210914-spain-catalonia-referendum-vote-riot-police-soares-00023209-full-169.jpg"
  ],
  "Woodburn Forest Oil Drill":[
    "https://cdn-04.belfasttelegraph.co.uk/news/northern-ireland/article34759250.ece/5bc58/AUTOCROP/w620h342/2016-05-31_new_21528170_I1.JPG",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-mKARRTy67rn8UGpRLL1Ol-kuunOICniF6YeifvVIeRb1tyE8",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4uEfBWP2fZXLnxrqEkw2NStqA49Rl4ek9Xz-emfy5dBPPmOiTwQ"
  ],
  "Brexit":[
    "https://cdn.newsapi.com.au/image/v1/944db993e767e5f692c418a11ffe6bc2",
    "https://cdn2.i-scmp.com/sites/default/files/styles/landscape/public/images/methode/2016/09/14/e5f952ec-799d-11e6-aba3-c12eb464ff87_1280x720.JPG?itok=uWtw4q87",
    "https://fm.cnbc.com/applications/cnbc.com/resources/img/editorial/2018/11/15/105575963-1542269439054gettyimages-1061486868.530x298.jpeg?v=1542269452"
  ],
  "World War II":[
    "https://bloximages.newyork1.vip.townnews.com/hickoryrecord.com/content/tncms/assets/v3/editorial/7/31/7312bc52-e393-11e8-adc1-6f492aca5b0d/5be49a127e60f.image.jpg",
    "https://www.culture24.org.uk/asset_arena/7/62/56/465267/v0_master.jpg",
    "https://www.readex.com/sites/default/files/Omaha%20World%20Herald%20%2005-07-1945.jpg"
  ]
}


EVENT_NAMES = {
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
    "Company behind Woodburn Forest oil drill call off project - Jun 17 2016",
    "PSNI accused of squandering £1m on policing oil drill protest - 9 Jul 2016"
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

EVENT_DESCRIPTIONS = {
  "Syrian Civil War":[
    "Description: The story of... Syrian Civil War: Event 1: Civil uprising in Syria - Mar 2011",
    "Description: The story of... Syrian Civil War: Event 34: Russian intervention - Sep 2015",
    "Description: The story of... Syrian Civil War: Event 204: Aleppo escalation and Euphrates Shield - Mar 2016"
  ],
  "Catalan Independence":[
    "Description: The story of... Catalan Independence: Event 1: Catalan parliament aproves referendum - 6 Sep 2017",
    "Description: The story of... Catalan Independence: Event 15: Independence referendum - 1 Oct 2017",
    "Description: The story of... Catalan Independence: Event 34: Fallout after referendum violence - 9 Jul 2016"
  ],
  "Woodburn Forest Oil Drill":[
    "Description: The story of... Woodburn Forest Oil Drill: Event 1: Start drilling for oil - Mar 11 2016",
    "Description: The story of... Woodburn Forest Oil Drill: Event 10: Company behind Woodburn Forest oil drill call off project - Jun 17 2016",
    "Description: The story of... PSNI accused of squandering £1m on policing oil drill protest - 9 Jul 2016"
  ],
  "Brexit":[
    "Description: The story of... Brexit: Event 1: Referendum Called",
    "Description: The story of... Brexit: Event 54: Hard or soft Brexit",
    "Description: The story of... Brexit: Event 86: The Brexit deal"
  ],
  "World War II":[
    "Description: The story of...World War II: Event 1: War is Declared",
    "Description: The story of...World War II: Event 450: Battle of the Bulge",
    "Description: The story of...World War II: Event 900: V-E Day"]
}

EVENT_DATES = {
  "Syrian Civil War": [
    [1945,9,2],
    [2012,2,22],
    [2012,10,1]
  ],
  "Catalan Independence": [
    [2017,9,22],
    [2017,10,1],
    [2018,10,5]
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
  ],
    "World War II": [
    [1917,4,6],
    [1939,9,1],
    [1944,12,16]
  ]
}

EVENT_LOCATIONS = {
  "Syrian Civil War": [
    "Damascus, Syria",
    "Homs, Syria",
    "Aleppo, Syria"
  ],
  "Catalan Independence": [
    "Catalonia Parliament, Spain",
    "Barcelona, Spain",
    "Spain"
  ],
  "Woodburn Forest Oil Drill": [
    "Woodburn Forest, Northern Ireland",
    "Woodburn Forest, Northern Ireland",
    "Woodburn Forest, Northern Ireland"
  ],
  "Brexit": [
    "London, UK",
    "London, UK",
    "London, UK"
  ],
  "World War II": [
    "London, England",
    "The Ardennes: Belgium, Luxembourg, Germany",
    "Berlin, Germany"
  ]
}

EVENT_LAT_LNG = {
  "Syrian Civil War": [
    [33.5138073, 36.27652790000002],
    [34.7324273, 36.71369589999995],
    [36.2021047, 37.13426030000005]
  ],
  "Catalan Independence": [
    [41.5911589, 1.5208623999999418],
    [41.5911589, 1.5208623999999418],
    [40.46366700000001, -3.7492200000000366]
  ],
  "Woodburn Forest Oil Drill": [
    [54.749865,-5.883748800000035],
    [54.749865,-5.883748800000035],
    [54.749865,-5.883748800000035]
  ],
  "Brexit": [
    [51.5073509,-0.12775829999998223],
    [51.5073509,-0.12775829999998223],
    [51.5073509,-0.12775829999998223],
  ],
  "World War II": [
    [51.5073509,-0.12775829999998223],
    [50.181616,5.575920799999949],
    [50.181616,50.181616,5.575920799999949]
  ]
}


# ARTICLE RELATED -----------------------------------------------------------

ARTICLE_IMAGES =
{
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
    "https://www.culture24.org.uk/asset_arena/7/62/56/465267/v0_master.jpg",
    "https://www.readex.com/sites/default/files/Omaha%20World%20Herald%20%2005-07-1945.jpg"
  ],
  "Woodburn Forest Oil Drill":[
    "https://cdn-04.belfasttelegraph.co.uk/news/northern-ireland/article34759250.ece/5bc58/AUTOCROP/w620h342/2016-05-31_new_21528170_I1.JPG",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-mKARRTy67rn8UGpRLL1Ol-kuunOICniF6YeifvVIeRb1tyE8",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4uEfBWP2fZXLnxrqEkw2NStqA49Rl4ek9Xz-emfy5dBPPmOiTwQ"
  ],
}



puts "---------------------------------------------------------------------------------------------------------"
puts "---------------------------------------------------------------------------------------------------------"
puts "Removing all old data"
puts ""

      Article.destroy_all
      Event.destroy_all
      Topic.destroy_all

      Author.destroy_all
      Publisher.destroy_all

      SaveArticle.destroy_all
      UserScore.destroy_all
      FollowingItem.destroy_all

      User.destroy_all

puts "-------------------------------------------"
puts ""
puts "             Seeding started"
puts ""
puts "-------------------------------------------"





puts "---------------- [ A.1 ] -------------------"
puts ""
puts "        ## Starting to seed TOPICS"
puts ""
puts "-------------------------------------------"




TOPIC_NAMES.each_with_index do |topic_name, topic_idx|

    topic_key = topic_name.to_sym

    obj_data = {
        name: topic_name,
        image_url: TOPIC_IMAGES[topic_key]
    }

    topic_instance = Topic.new(obj_data)
    topic_instance.save!

    puts "Topic num: ##{topic_idx + 1}"
    puts "Topic name: #{topic_instance.name}"
    puts "Topic image url: #{topic_instance.image_url}"






    puts "------------- [ A.2 ]------------------"
    puts ""
    puts "  # seeding Its EVENTS below:"
    puts ""
    puts "------ ##{topic_idx + 1} --------------"



    EVENT_NAMES[topic_key].each_with_index do |event, event_idx|
    topic_name = TOPIC_NAMES[topic_idx]

      event_articles_raw = File.read(File.expand_path("db/event_articles_#{(event_idx + 1)}.json"))
      event_articles_parsed = JSON.parse(event_articles_raw)
      event_articles_file = event_articles_parsed["articles"]["results"]

      event_key = topic_name.to_sym

      # EVENT DESCRIPTION
      event_description_key = EVENT_DESCRIPTIONS[event_key]
      event_description = event_description_key[event_idx]

      # EVENT IMAGE
      event_image_key = EVENT_IMAGES[event_key]
      event_image = event_image_key[event_idx]

      # EVENT DATE
      date_array = EVENT_DATES[event_key]
          event_year = date_array[event_idx][0]
          event_month = date_array[event_idx][1]
          event_day = date_array[event_idx][2]
      event_date = Date.new(event_year, event_month, event_day)

      # EVENT LOCATION
      event_location_array = EVENT_LOCATIONS[event_key]
      event_location = event_location_array[event_idx]
          lat_lng_array = EVENT_LAT_LNG[event_key]
              event_lat = lat_lng_array[event_idx][0]
              event_lng = lat_lng_array[event_idx][1]

      # EVENT LOADED OBJECT
      obj_data = {
          topic_id: topic_idx + 1,
          name: event,
          description: event_description,
          image_url: event_image,
          date_time: event_date,
          location: event_location,
          lat: event_lat,
          lng: event_lng
      }

      event_instance = Event.new(obj_data)
      event_instance.save!


      puts "------- ##{topic_idx + 1}.#{event_idx + 1} ----------"
      puts ""
      puts ""
      puts "Event Number: ##{topic_idx + 1}.#{event_idx + 1}"
      puts "Event Topic: #{topic_instance.name}"
      puts "Event: #{event_instance.name}"
      puts "Event description: #{event_instance.description}"
      puts "Event image: #{event_instance.image_url}"
      puts "Event date: #{event_instance.date_time}"
      puts "Event location: #{event_instance.location}"
      puts "Event Lat: #{event_instance.lat}"
      puts "Event Lng: #{event_instance.lng}"
      puts ""



      puts ""
      puts "     All EVENTS added to this TOPIC"
      puts ""
      puts "-------------------------------------------"
      puts "-------------------------------------------"





      puts "---------------- [ A.3 ] -------------------"
      puts ""
      puts "           Seeding PUBLISHERS"
      puts ""
      puts "-------------------------------------------"

      event_articles_file.each do |article_publisher|

          # SOURCE
          publisher = article_publisher["source"]

          # DETAILS
          publisher_name = publisher["title"]
            publisher_description = publisher["title"]
            publisher_image = 'https://upload.wikimedia.org/wikipedia/en/thumb/f/ff/BBC_News.svg/1280px-BBC_News.svg.png',
            publisher_website = publisher["uri"]

          # LOCATION
          publisher_location = EVENT_LOCATIONS[topic_instance.name.to_sym][rand(0..2)]
              publisher_lat = LAT.sample.to_i
              publisher_lng = LONG.sample.to_i

          obj_data = {
              name: publisher_name,
              description: publisher_description,
              image_url: publisher_image,
              web_url: publisher_website,
              location: publisher_location,
              lat: publisher_lat,
              lng: publisher_lng
          }

          publisher = Publisher.new(obj_data)
          publisher.save!

          puts "Name: #{publisher_name}"
          puts "Description: #{publisher_description}"
          puts "Image: #{publisher_image}"
          puts "Website: #{publisher_website}"
          puts "Location: #{publisher_location}"
          puts "lat: #{publisher_lat}"
          puts "lng: #{publisher_lng}"

      end
      # PUBLISHERS END


      puts ""
      puts "            Publishers done"
      puts ""
      puts "-------------------------------------------"
      puts "-------------------------------------------"


      puts "--------------- [ A.4 ] --------------------"
      puts ""
      puts "           Seeding AUTHORS"
      puts ""
      puts "-------------------------------------------"

      event_articles_file.each do |article_author|

        article_author["authors"].each do |author|

          # SCRAPE
          # author_first_name = author["name"].split[0]
          # author_last_name = author["name"].split[1]

          # RANDOM
          author_first_name = FIRST_NAMES[rand(0..12)]
          author_last_name = LAST_NAMES[rand(0..12)]

          author_twitter = "@#{author_first_name}#{author_last_name}"
          author_location_array = EVENT_LOCATIONS[topic_instance.name.to_sym]
          author_location = author_location_array[rand(0..2)]

          author_lat = LAT.sample
          author_lng = LONG.sample

          obj_data = {
              first_name: author_first_name,
              last_name: author_last_name,
              twitter_handle: author_twitter,
              location: author_location,
              lat: author_lat,
              lng: author_lng
          }

          author = Author.new(obj_data)
          author.save!

          puts "author first name: #{author_first_name}"
          puts "author last name: #{author_last_name}"
          puts "author twitter: #{author_twitter}"
          puts "author location: #{author_location}"
          puts "author lat: #{author_lat}"
          puts "author lng: #{author_lng}"


        end
      end

        puts "--------------- [ A.4 ] -------------------"
        puts ""
        puts "       Seeding ARTICLES of the EVENT"
        puts ""
        puts "-------------------------------------------"


        event_articles_file.each_with_index do |article, article_idx|

            # ARTICLE DETAILS
              article_title = article["title"]
              article_text = article["body"]
              article_description = event_description
              article_array = ARTICLE_IMAGES[topic_key]
              article_image = article_array[event_idx]
              article_url = article["url"]
              article_date_time = article["dateTime"]
              article_type = article["dataType"]
              article_lang = article["lang"]

            # LOCATION
              article_location = event_location
              article_lat = event_lat
              article_lng = event_lng

            # AUTHOR PUBLISHER
              article_publisher = article["title"]
              article_author = article["title"]

            obj_data = {
                title: article_title,
                description: article_description,
                body_text: article_text,
                image_url: article_image,
                source_url: article_url,
                date_time_published: article_date_time,
                publishing_type: article_type,
                language: article_lang,
                published: true,
                count_views: rand(0..2000),
                average_user_score:rand(-5..5),
                event_id: event_instance.id,
                location: article_location,
                lat: article_lat,
                lng: article_lng,

                # count_views: (200..5000).to_a.sample,
                # average_user_score: (-5..5).to_a.sample,

                author_id: Author.all.sample.id,
                publisher_id: Publisher.all.sample.id

            }

            publisher = Article.new(obj_data)
            publisher.save!

            puts "-------------------------------------------"
            puts ""
            puts "---##{topic_idx + 1}.#{event_idx + 1}.#{article_idx + 1} ------"
            puts ""
            puts "Article Number: #{event_idx + 1}"
            puts ""
            puts "Topic: #{topic_instance.name}"
            puts "Event:#{event_instance.name}"
            puts ""
            puts "Article Title: #{article_title}"
            puts "Article Description: #{article_description}"
            puts "Article Image: #{article_image}"
            puts "Article Url: #{article_url}"
            puts "Article Date: #{article_date_time}"
            puts "Article Type: #{article_type}"
            puts "Article Lang: #{article_lang}"
            puts ""

        puts ""
        puts "       ARTICLES Seeded of that EVENT "
        puts ""
        puts "-------------------------------------------"
        puts "-------------------------------------------"

    end # ARTICLES END
  end # EVENT_NAMES END
end # TOPIC_NAMES END




puts "--------------- [ B.1 ] ---------------------"
puts ""
puts "        Starting to seed USERS"
puts ""
puts "-------------------------------------------"

FIRST_NAMES.each_with_index do |name, user_idx|

    first_name = name
    last_name = LAST_NAMES[user_idx]

    obj_data = {
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name}#{last_name}@user.com",
        password: 123456,
        photo: "https://randomuser.me/api/portraits/women/#{user_idx}.jpg"
    }

    user_instance = User.new(obj_data)
    user_instance.save!

    puts "User ##{user_idx} Name: #{user_instance.first_name} #{user_instance.last_name} created"
    puts "email: #{user_instance.email}"
    puts "photo: #{user_instance.photo}"
    puts ""
end

def john
    obj_data = {
        first_name: "John",
        last_name: "Ferreira",
        email: "johnferreira@gmail.com",
        password: "123456",
        photo: "https://scontent.fjog1-1.fna.fbcdn.net/v/t1.0-9/s851x315/13939328_10153672228506587_8994048246363071984_n.jpg?_nc_cat=104&_nc_ht=scontent.fjog1-1.fna&oh=627f02b87d09389c5393dfe075cd3914&oe=5C6CAEF0"
    }
    user = User.new(obj_data)
    user.save!
    puts "User #{user.first_name} created"
end
john


def roger
  obj_data = {
      first_name: "Rodger",
      last_name: "Garcia",
      email: "rodger@gmail.com",
      password: "123456",
      photo: "https://avatars0.githubusercontent.com/u/23165579?v=4"
  }
  user = User.new(obj_data)
  user.save!
  puts "User #{user.first_name} created"
end
roger


puts ""
puts "              USERS DONE"
puts ""
puts "-------------------------------------------"




puts "--------------- [ B.2 ] ---------------------"
puts ""
puts "         Seeding FOLLOWED ITEMS"
puts ""
puts "-------------------------------------------"

        i = 1
        50.times do

          type = %w[Topic Event].sample
          id = type == 'Topic' ? rand(1..1) : rand(1..3)

            obj_data = {
              follower_type: type,
              follower_id: id,
              user_id: User.all.sample.id
            }
            # binding.pry
            following_instance = FollowingItem.new(obj_data)
            following_instance.save!

            type_followed = following_instance.follower_type
            item_name = following_instance.follower
            user_name = following_instance.user

            puts "-----------[ ##{i} ]----------------"
            puts ""
            puts "type_followed: #{type_followed}"
            puts "item_name: #{item_name.name}"
            puts "user_name: #{user_name.email}"
            puts ""

          i  = i + 1
        end

  puts ""
  puts "         FOLLOWED ITEMS Seeded"
  puts ""
  puts "-------------------------------------------"
  puts "-------------------------------------------"



  puts "--------------- [ B.3 ] ---------------------"
  puts ""
  puts "           Seeding USER SCORES"
  puts ""
  puts "-------------------------------------------"

    i = 1
    50.times do

        obj_data = {
          score: rand(-5..5),
          article_id: Article.all.sample.id,
          user_id: User.all.sample.id,
        }

        score_instance = UserScore.new(obj_data)
        score_instance.save!

        puts "-----------[ ##{i} ]----------------"
        puts ""
        puts "Score: [ #{score_instance.score} ]"
        puts "Scored article ID: #{score_instance.article.id}"
        puts "Scored article Title: #{score_instance.article.title}"
        puts "User Email: #{score_instance.user.email}"
        puts ""

        i  = i + 1
    end

    puts ""
    puts "         USER SCORES Seeded"
    puts ""
    puts "-------------------------------------------"
    puts "-------------------------------------------"


    puts "--------------- [ B.4 ] ---------------------"
    puts ""
    puts "         Seeding SAVED ARTICLES"
    puts ""
    puts "-------------------------------------------"

    i = 1
    60.times do

          obj_data = {
            article_id: Article.all.sample.id,
            user_id: User.all.sample.id
          }

          save_article_instance = SaveArticle.new(obj_data)
          save_article_instance.save!

        puts "-----------[ ##{i} ]----------------"
        puts ""
        puts "Saved article ID: #{save_article_instance.article.id}"
        puts "Saved article Title: #{save_article_instance.article.title}"
        puts "User Email: #{save_article_instance.user.email}"
        puts ""

      i  = i + 1
    end

    puts ""
    puts "         SAVED ARTICLES Seeded"
    puts ""
    puts "-------------------------------------------"
    puts "-------------------------------------------"
    #

puts "-------------------------------------------"
puts ""
puts "               BOOM SEEDED"
puts ""
puts "-------------------------------------------"


# end # TOPIC_NAMES END
