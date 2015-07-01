class Micropost < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, PictureUploader
  has_many :reply_to_reactions,
    class_name:  "Reaction",
    foreign_key: "from_micropost_id",
    dependent:   :destroy
  has_many :replied_from_reactions,
    class_name:  "Reaction",
    foreign_key: "to_micropost_id",
    dependent:   :destroy
  has_many :replied_to,
    through: :reply_to_reactions,
    source:  :to_micropost
  has_many :replied_from,
    through: :replied_from_reactions,
    source:  :from_micropost

  validates :user_id,
    presence: true
  validates :content,
    presence: true,
    length: { maximum: 140 }
  validate  :picture_size

  default_scope -> { order(created_at: :desc) }

  def reply_to(other_post)
    reply_to_reactions.create(to_micropost_id: other_post.id)
  end

  def replied_to?(other_post)
    replied_to.include?(other_post)
  end

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
