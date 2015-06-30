class Reaction < ActiveRecord::Base
  belongs_to :replier, class_name: "Micropost"
  belongs_to :replied, class_name: "Micropost"
  validates :from_micropost_id, presence: true
  validates :to_micropost_id,   presence: true
end
