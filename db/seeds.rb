puts "Creating User"
User.create_with(password: 'asdqwe123', password_confirmation: 'asdqwe123')
         .find_or_create_by(email: 'user@example.com')