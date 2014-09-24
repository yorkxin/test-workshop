class Post < ActiveRecord::Base
  before_create :generate_slug
  before_create :set_draft

  has_many :comments

  scope :published, -> { where(:state => "published") }
  scope :draft, -> { where(:state => "draft") }

  # Prettify URL
  def to_param
    "#{self.id}-#{self.slug}"
  end

  def publish!
    self.update(:state => "published")
  end

  def can_publish?
    # Use another method for future extension.
    # e.g. "a post cannot be published until it is reviewd by editor"
    self.draft?
  end

  def draft?
    self.state == "draft"
  end

  private
  def generate_slug
    self.slug = self.title.gsub(/[^A-Za-z0-9]+/, '-').downcase
  end

  def set_draft
    self.state = "draft"
  end
end
