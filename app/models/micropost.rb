class Micropost < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, PictureUploader
  has_many :active_reply_reactions,
    class_name:  "Reaction",
    foreign_key: "from_micropost_id",
    dependent:   :destroy
  has_many :replying,
    through: :active_reply_reactions,
    source:  :to_micropost
  validates :user_id,
    presence: true
  validates :content,
    presence: true,
    length: { maximum: 140 }
  validate  :picture_size

  default_scope -> { order(created_at: :desc) }

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
