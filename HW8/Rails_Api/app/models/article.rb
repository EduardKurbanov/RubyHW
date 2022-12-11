class Article < ApplicationRecord
  serialize :tags
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  belongs_to :author
  has_many :likes, as: :likeable
  
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 5 }

  enum :status, { unpublished: 0, published: 1 }, default: :unpublished

  scope :get_article_all, -> { order('created_at DESC') }
  scope :status_position_article, ->(status_ps) { where(status: status_ps) }
  scope :filter_by_author, ->(author_name) { joins(:author).where("lower(name) LIKE ?", "%#{author_name.downcase}%")}
  #scope :search_for_a_phrase_in_an_article, ->(search_ph) { where("lower(title) || lower(body) LIKE ?", "%#{search_ph.downcase}%") }
  #scope :search_tag, -> (keywords) {includes(:tags).where("lower(tags.title) LIKE :value", value: "%#{keywords.downcase}%" ).references(:tags)}
  scope :search_phrase, -> (search_ph) { 
    includes(:tags).where("lower(articles.title) ILIKE :value OR 
                           lower(articles.body) ILIKE :value OR 
                           lower(tags.title) LIKE :value", value: "%#{search_ph.downcase}%").references(:tags)
  }
  scope :sort_the_list_of_articles_by_title, ->(order = 'asc') { order(title: order.downcase) }
end
