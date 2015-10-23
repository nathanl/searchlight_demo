class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :category

  validates :title, :author, :category, presence: true
  validates_uniqueness_of :title, scope: [:author_id, :category_id]
  scope :title_like, -> (title) { where("books.title ILIKE ?", "%#{title}%") }
end
