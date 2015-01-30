class Mood < ActiveRecord::Base
  belongs_to :user, inverse_of: :moods

  validates(:top, presence: true)
  validates(:left, presence: true)
end
