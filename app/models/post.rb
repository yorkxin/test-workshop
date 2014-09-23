class Post < ActiveRecord::Base
  before_create :generate_slug

  # Prettify URL
  def to_param
    "#{self.id}-#{self.slug}"
  end

  private
  def generate_slug
    self.slug = self.title.gsub(/[^A-Za-z0-9]+/, '-').downcase
  end
end
