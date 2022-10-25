class Label < ApplicationRecord
    validates_uniqueness_of :name
end
