class Post < ActiveRecord::Base
  before_create :generate_slug
  before_create :set_draft

  scope :published, -> { where(:state => "published") }
  scope :draft, -> { where(:state => "draft") }

  # Prettify URL
  def to_param
    "#{self.id}-#{self.slug}"
  end

  def publish!
    self.update(:state => "published")
  end

  private
  def generate_slug
    self.slug = self.title.gsub(/[^A-Za-z0-9]+/, '-').downcase
  end

  def set_draft
    self.state = "draft"
  end
end
