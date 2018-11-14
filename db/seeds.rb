require 'json'
require 'open-uri'

response_raw = File.read('catalan_articles.json')
response = JSON.parse(response_raw)


ARTICLE_IMAGES = [
    "https://images.ecosia.org/FY28O5m_ZcGa2lp9BQxtPIpwm5Y=/0x390/smart/http%3A%2F%2Fgocartours.com%2Fwp-content%2Fuploads%2F120912020406-spain-catalonia-protest-story-top.jpg",
    "https://images.ecosia.org/lw8E1aFKxsN_bxTwL5WXvTXKHn0=/0x390/smart/https%3A%2F%2Fcdn01.theintercept.com%2Fwp-uploads%2Fsites%2F1%2F2017%2F10%2Fcatalonia-referendum-spain-protests-aftermath-robert-mackey-1506976177-article-header.jpg",
    "https://images.ecosia.org/Oz4wI71ex9ilPFHRtENVEIzBfZ4=/0x390/smart/http%3A%2F%2Fwww.xpats.com%2Fsites%2Fdefault%2Ffiles%2Fstyles%2Fbig_article%2Fpublic%2Fcatl_0.png",
    "https://images.ecosia.org/kM9sT7KDiR-vLDbjue3NoEKaLlg=/0x390/smart/http%3A%2F%2Fi.dailymail.co.uk%2F1%2F2018%2F03%2F25%2F17%2Fwire-2574640-1521996944-988_634x422.jpg",
    "https://images.ecosia.org/kvzmtUcWSfnCDyhlJ7PhjqOz3Wo=/0x390/smart/http%3A%2F%2Fwww.politico.eu%2Fwp-content%2Fuploads%2F2017%2F09%2FGettyImages-492471246-1200x628.jpg"
]

LAT = %w[-8.6594824 -8.678640 -8.649100 -8.697390]
LONG = %w[115.1301361 115.262720 115.137890 115.161940]

LOCATIONS = ["Batu Bolong Beach, Canggu, Bali, Indonesia", "Old Man's Beach, Canggu, Bali, Indonesia", "Batu Bolong Beach, Canggu, Bali, Indonesia", "Double Six Beach, Canggu, Bali, Indonesia"]

FIRST_NAMES = %w[James Sally Claire Hennery Stine Barry Sophia Ava Jackson Olivia Aiden Lucas Liam]
LAST_NAMES = %w[Smith Johnson Williams Brown Davis Miller Wilson Thomas Gonzalez Patterson Cox Simmons Bryant]


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

### Create new publisher using article source ####

articles.results.each do |article|

    src = article.source

    publisher_data = {
        image_url: 'https://upload.wikimedia.org/wikipedia/en/thumb/f/ff/BBC_News.svg/1280px-BBC_News.svg.png',
        web_url: src.uri,
        name: src.title,
        location: LOCATIONS.sample,
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
            location: LOCATIONS.sample,
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

