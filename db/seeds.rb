posts = [
  { title: 'test_1', body: 'body_test_1', username: 'vasya' },
  { title: 'test_2', body: 'body_test_2', username: 'petya' },
  { title: 'test_3', body: 'body_test_3', username: 'kolya' }
]

posts.each do |post|
  Post.create(post)
end
