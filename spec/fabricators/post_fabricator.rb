Fabricator(:post) do
  title { Faker::Lorem.sentence }
  body { Faker::Lorem.paragraph(3) }
end

Fabricator(:published_post, :from => :post) do
  after_create { |post| post.publish! }
end
