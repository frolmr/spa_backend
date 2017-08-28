(1..60).each do |i|
  Post.create(title: "title_#{i}", body: "##{i} blank test body for post!", username: "test_user_#{i}")
end

