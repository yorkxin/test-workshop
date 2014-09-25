Fabricator(:comment) do
  post

  author { Faker::Name.name }
  content { Faker::Lorem.paragraph(3) }
end
