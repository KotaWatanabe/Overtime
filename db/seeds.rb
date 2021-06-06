@user = User.create(email:'test@test.com', password:'123456', password_confirmation:'123456', first_name:'John', last_name:'Snow')
AdminUser.create(email:'admin@test.com', password:'123456', password_confirmation:'123456', first_name:'Admin', last_name:'Test')

100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content", user_id:@user.id )
end

puts "100 Posts have been created"
 