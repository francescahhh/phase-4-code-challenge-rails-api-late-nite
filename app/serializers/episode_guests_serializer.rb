class EpisodeGuestsSerializer < ActiveModel::Serializer
    attributes :id, :date, :number
    has_many :guests
end

# generated with new file > episode_guests_serializer.rb