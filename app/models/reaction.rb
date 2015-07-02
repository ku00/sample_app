class Reaction < ActiveRecord::Base
  belongs_to :from_micropost, class_name: "Micropost"
  belongs_to :to_micropost, class_name: "Micropost"
  validates :from_micropost_id, presence: true
  validates :to_micropost_id,   presence: true
end
