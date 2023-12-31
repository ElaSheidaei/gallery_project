class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :gallery

  validates :user_id, uniqueness: { scope: :gallery_id }
  validates :reaction_type, inclusion: { in: %w[like dislike] }
end
