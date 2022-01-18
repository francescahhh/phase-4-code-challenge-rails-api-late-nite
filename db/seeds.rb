require 'csv'

puts '🌙 Seeding data...'

# Don't worry too much about what's going on in this file. We are reading from a
# CSV file and using this to populate the database. Your main areas of
# interest in this file are the ActiveRecord methods, labeled with a ⭐️ - but
# as long as you follow the instructions in the readme and the tests for setting
# up your database, this should all work just fine!

# The data for this lives in db/seed_data/1999_daily_show_guests.csv
csv_path = Rails.root.join('db', 'seed_data', '1999_daily_show_guests.csv')

# This method reads the CSV
csv = CSV.parse(File.read(csv_path), headers: true, encoding: 'ISO-8859-1')

csv.each_with_index do |row, number|
  # ⭐️ Create one episode for each row of data
  episode = Episode.create(date: row['Show'], number: number + 1)

  # Each row has one or more guest names, split by ', '
  guest_names = row['Raw_Guest_List'].split(', ')

  guest_names.each do |name|
    # ⭐️ Find or create one or more guest(s) per row of data
    guest = Guest.find_or_create_by(name: name)
    guest.update(occupation: row['GoogleKnowlege_Occupation'])

    # ⭐️ Create one or more appearance(s) per row of data
    Appearance.create(
      guest_id: guest.id,
      episode_id: episode.id,
      rating: rand(1..5),
    )
  end
end

puts '🌙 Done seeding!'

# puts '🌙 Seeding data...'

# e1 = Episode.create(date: "Dec. 3", number: 5)
# e2 = Episode.create(date: "Jan. 5", number: 1)
# e3 = Episode.create(date: "Oct. 11", number: 4)
# e4 = Episode.create(date: "Feb. 14", number: 2)
# e5 = Episode.create(date: "May 15", number: 3)

# g1 = Guest.create(name: "Owen Wilson", occupation: "wow")
# g2 = Guest.create(name: "Arnold Schwarzenegger", occupation: "terminator")
# g3 = Guest.create(name: "Elmo", occupation: "puppet")
# g4 = Guest.create(name: "Edgar Allen Poe", occupation: "author")
# g5 = Guest.create(name: "Britney Spears", occupation: "singer")


# Appearance.create(episode_id: e1.id, guest_id: g1.id, rating: 1)
# Appearance.create(episode_id: e2.id, guest_id: g2.id, rating: 2)
# Appearance.create(episode_id: e3.id, guest_id: g3.id, rating: 3)
# Appearance.create(episode_id: e4.id, guest_id: g4.id, rating: 4)
# Appearance.create(episode_id: e5.id, guest_id: g5.id, rating: 5)

# puts '🌙 Done seeding!'
