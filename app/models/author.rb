class Author < ActiveRecord::Base

  has_many :books

  validates :first_name, :last_name, presence: true
  validates_uniqueness_of :last_name, scope: :first_name

  scope :name_like, -> name { where("concat(first_name, ' ', last_name) ILIKE ?", "%#{name}%") }

end
