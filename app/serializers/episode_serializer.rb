class EpisodeSerializer < ActiveModel::Serializer
  attributes :id, :date, :number
end

# rails g serializer episode --no-test-framework