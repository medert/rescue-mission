class Question < ActiveRecord::Base

  has_many :answers

  validates :title, presence: true, length: { minimum: 40 }
  validates :description, presence: true, length: { minimum: 150 }
  validates :creator_id, numericality: { only_integer: true }, allow_blank: true


end
