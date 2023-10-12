class Gallery < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :reactions, dependent: :destroy
    has_many :reactioners, through: :reactions, source: :user

    has_one_attached :image

    def like_count
        reactions.where(reaction_type: 'like').count
    end
      
    def dislike_count
        reactions.where(reaction_type: 'dislike').count
    end

    def created_by
        @user = User.find(user_id)
        @user.username
    end
end
