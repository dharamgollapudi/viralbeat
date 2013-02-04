# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
users = (1..10).to_a.inject([]) do |users, i|
  user = User.create(
    :email => "user#{i}@viralbeat.com",
    :password => 'password',
    :password_confirmation => 'password'
  )
  users << user
  users
end

(1..10).to_a.inject([]) do |messages, i|
  message = users[Random.rand(1..10)].messages.create(
    :title => "Title #{i}",
    :body => <<-EOS
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tempor 
      faucibus feugiat. Sed quis eros nulla. Vestibulum dictum lobortis purus, 
      in blandit ipsum interdum a. Nulla porta viverra sem. Cum sociis natoque 
      penatibus et magnis dis parturient montes, nascetur ridiculus mus. 
      Maecenas in enim turpis. Sed mollis, eros nec eleifend sodales, quam 
      orci pellentesque massa, quis euismod ligula lorem eu justo. Aenean 
      condimentum, magna sit amet venenatis gravida, neque erat faucibus l
      ibero, ut volutpat enim arcu et felis. Maecenas at ipsum nisi. Nullam 
      pretium lorem non sem vestibulum egestas. Duis imperdiet pulvinar nisl, 
      nec auctor nulla feugiat vel. Donec lectus sapien, viverra a aliquam eu, 
      mollis sed nibh. Vestibulum ante ipsum primis in faucibus orci luctus et 
      ultrices posuere cubilia Curae; Curabitur tincidunt massa et purus 
      accumsan iaculis sit amet porttitor augue.

      Vestibulum fermentum, orci vitae commodo ultricies, purus metus tempor 
      est, ut cursus risus lacus nec tortor. Integer auctor placerat erat id 
      pellentesque. Aenean sit amet tempor elit. Pellentesque imperdiet ipsum 
      vel felis rhoncus eu posuere sapien rutrum. Cum sociis natoque penatibus 
      et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque 
      semper, neque quis condimentum lobortis, libero elit laoreet massa, 
      non mattis erat nulla id dolor. Etiam ullamcorper bibendum dignissim.

      Proin nunc nibh, imperdiet et facilisis ut, tincidunt in velit. Donec 
      auctor dignissim pretium. Donec mattis aliquet ullamcorper. Aliquam 
      tempus interdum enim eu laoreet. Duis sed sem ac mauris aliquet facilisis. 
      Vivamus est turpis, lacinia ac malesuada eu, imperdiet non justo. 
      Donec sagittis molestie feugiat. Aliquam mi risus, porta in feugiat 
      vitae, pulvinar vitae odio.
    EOS
  )
  messages << message
  messages
end
