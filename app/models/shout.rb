class Shout < ApplicationRecord
  belongs_to :content, polymorphic: true
  belongs_to :user

  validates :user, presence: true

  default_scope { order(created_at: :desc) }

  delegate :username, to: :user
end
