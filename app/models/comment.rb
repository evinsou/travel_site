class Comment < ActiveRecord::Base
  attr_accessible :body, :name
  validates :body, :name, presence: true

  belongs_to :commentable, polymorphic: true
end
