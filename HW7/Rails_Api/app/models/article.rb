class Article < ApplicationRecord
  has_many :comment, dependent: :destroy
  has_and_belongs_to_many :tags
  belongs_to :author
  has_many :likes, as: :likeable
  
  
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 5 }

  enum :status, { unpublished: 0, published: 1 }, default: :unpublished

  scope :get_articles_all, -> { order('created_at DESC') }

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(title: name.strip).first_or_create!
    end
  end
  
  def all_tags
    self.tags.map(&:title).join(", ")
  end
end
