class Mood < ActiveRecord::Base
  belongs_to :user, inverse_of: :moods

  validates(:top, presence: true)
  validates(:left, presence: true)

  def color
    return 'green' if created_at > ENV['fresh'].to_i.hours.ago
    return 'orange' if created_at > ENV['old'].to_i.hours.ago
    'red'
  end
end
