class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :full_name, use: [:slugged]

  has_many :moods, inverse_of: :user, dependent: :delete_all

  validates(:email, presence: true)

  scope :users_with_moods, -> { includes(:moods).where.not(moods: { id: nil }) }

  def image_url
    Gravatar.new(email).image_url
  end

  def current_mood
    moods.order('created_at').last
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
