class Mood < ActiveRecord::Base
  belongs_to :user, inverse_of: :moods

  validates(:top, presence: true)
  validates(:left, presence: true)

  def color
    return 'green' if created_at > 2.hours.ago
    return 'orange' if created_at > 6.hours.ago
    'red'
  end
end
