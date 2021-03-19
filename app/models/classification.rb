class Classification < ApplicationRecord
  belongs_to :movie
  belongs_to :genre
end
