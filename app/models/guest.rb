class Guest < ApplicationRecord
    has_many :appearances
    has_many :episodes, through: :appearances
end

# generate using rails g resource guest --no-test-framework