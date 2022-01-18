class Episode < ApplicationRecord
    has_many :appearances, dependent: :destroy
    # anything dependent on this class will also destroy
    has_many :guests, through: :appearances
end


# created using rails g resource episode --no-test-framework