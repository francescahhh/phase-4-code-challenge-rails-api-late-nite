class Appearance < ApplicationRecord
    belongs_to :episode
    belongs_to :guest

    validates :rating, inclusion: 1..5
end


# generate using rails g resource appearance --no-test-framework

# added validation