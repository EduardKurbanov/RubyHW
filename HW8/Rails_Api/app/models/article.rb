class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  belongs_to :author
  has_many :likes, as: :likeable
  
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 5 }

  enum :status, { unpublished: 0, published: 1 }, default: :unpublished

  #scope :get_article_all, -> { order('created_at DESC') }
  scope :search_by_status, ->(status) { where(status: status) }
  scope :filter_by_author, ->(author_name) { joins(:author).where("name ILIKE ?", "%#{author_name}%") }
  #-scope :search_for_a_phrase_in_an_article, ->(search_ph) { where("title || body ILIKE ?", "%#{search_ph}%") }
  scope :search_tag, ->(tags) { joins(:tags).where(tags: { title: tags.split(',').collect { |tag| tag.strip.downcase } }) }
  #scope :sort_the_list_of_articles_by_title, ->(order = 'asc') { order(title: order.downcase) }

  def self.search_ph(search)
    where("title || body ILIKE ?", "%#{search}%")
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(title: name.strip).first_or_create!
    end
  end
  
  def all_tags
    self.tags.map(&:title).join(", ")
  end
end
