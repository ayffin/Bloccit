require "random_data"

post = Post.find_or_create_by!(title: 'Unique post') do |post|
  post.body = 'This is the first Unique Post.'
end
post.comments.find_or_create_by!(body: "This is the first comment for unique post.")

50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seeds finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
