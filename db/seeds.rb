# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ======== Teodoro mirame ================= #
# Se necesita lo siguiente:
# 	- Varios usuarios(como los de abajo)
#   - Varios tutorials
#   - Que hayan varios usuarios con el mismo tutorial
#   - Badges con todos sus atributos(consiguete las imagenes por ahi, cuales sean,
#	descargalas y las pones en el folder images, lo que tienes que guardar en la bd es el nombre de la imagen)

users = [{
	name: 'Juan',
	username: 'juan1',
	email: 'juancito@gmail.com',
	password: 'pass',
	image_url: 'profile-pic.png'
},{
	name: 'pedro',
	username: 'pedro1',
	email: 'pedro1@gmail.com',
	password: 'pass',
	image_url: 'profile-pic.png' # Agregarle el png a todas las profile pics
},{
	name: 'Juana',
	username: 'juana1',
	email: 'juana@gmail.com',
	password: 'pass',
	image_url: 'profile-pic.png'
},{
	name: 'Obi-Wan',
	username: 'Obi-wan1',
	email: 'Obi-wan@gmail.com',
	password: 'pass',
	image_url: 'profile-pic.png'
},{
	name: 'Riyo',
	username: 'riyo1',
	email: 'riyo@gmail.com',
	password: 'pass',
	image_url: 'profile-pic.png'
},{
	name: 'Yoda',
	username: 'yoda1',
	email: 'yoda@gmail.com',
	password: 'pass',
	image_url: 'profile-pic.png'
},{
	name: 'Luke',
	username: 'luke1',
	email: 'luke@gmail.com',
	password: 'pass',
	image_url: 'profile-pic.png'
},{
	name: 'Padme',
	username: 'padme1',
	email: 'padme@gmail.com',
	password: 'pass',
	image_url: 'profile-pic.png'
},{
	name: 'Laila',
	username: 'laila1',
	email: 'laila@gmail.com',
	password: 'pass',
	image_url: 'profile-pic.png'
},{
	name: 'Erica',
	username: 'erica11',
	email: 'erica@gmail.com',
	password: 'pass',
	image_url: 'profile-pic.png'
}]

users.each do |user|
  user = User.create(user)
  if user.save
  	puts "Saved user #{user.username}"
  else
  	puts "#{user.errors}"
  end
end

tutorials = [{
	content: '<h1> El primero </h1>',
	title: 'el primerisimo',
	difficulty: 'easy'
	
},{
	content: '<h1> El segundo </h1>',
	title: 'el segundisimo',
	difficulty: 'hard'
},{
	content: '<h1> El tercero </h1>',
	title: 'el tercerisimo',
	difficulty: 'middle'
},{
	content: '<h1> El cuarto </h1>',
	title: 'el cuartisimo',
	difficulty: 'easy'
},{
	content: '<h1> El quinto </h1>',
	title: 'el quintisimo',
	difficulty: 'easy'
},{
	content: '<h1> El sexto </h1>',
	title: 'el sextisimo',
	difficulty: 'easy'
},{
	content: '<h1> El septimo </h1>',
	title: 'el septisimo',
	difficulty: 'middle'
},{
	content: '<h1> El octavo </h1>',
	title: 'el octavisimo',
	difficulty: 'easy'
},{
	content: '<h1> El noveno </h1>',
	title: 'el novenisimo',
	difficulty: 'hard'
},{
	content: '<h1> El decimo </h1>',
	title: 'el decisimo',
	difficulty: 'easy'
}]

tutorials.each do |tutorial|
  tutorial = Tutorial.create(tutorial)
  if tutorial.save
  	puts "Saved user #{tutorial.title}"
  else
  	puts "#{tutorial.errors}"
  end
end

tutorialsusers = [{
	user_id: 2,
	tutorial_id: 3
	
},{
	user_id: 1,
	tutorial_id: 4
},{
	user_id: 3,
	tutorial_id: 7
},{
	user_id: 8,
	tutorial_id: 3
},{
	user_id: 5,
	tutorial_id: 1
},{
	user_id: 9,
	tutorial_id: 3
},{
	user_id: 6,
	tutorial_id: 2
},{
	user_id: 4,
	tutorial_id: 3
},{
	user_id: 5,
	tutorial_id: 6
},{
	user_id: 6,
	tutorial_id: 10

},{	user_id: 2,
	tutorial_id: 3
	
},{
	user_id: 1,
	tutorial_id: 9
},{
	user_id: 3,
	tutorial_id: 6
},{
	user_id: 8,
	tutorial_id: 2
},{
	user_id: 5,
	tutorial_id: 4
},{
	user_id: 9,
	tutorial_id: 6
},{
	user_id: 6,
	tutorial_id: 5
},{
	user_id: 4,
	tutorial_id: 2
},{
	user_id: 5,
	tutorial_id: 10
},{
	user_id: 6,
	tutorial_id: 7
}]

tutorialsusers.each do |tu|
  tu = TutorialsUsers.create(tu)
  if tu.save
  	puts "Saved user #{tu.user_id}"
  else
  	puts "#{tu.errors}"
  end
end

badges = [{
	name: 'geek',
	topic: 'programming',
	image_url: 'med.png'
	
},{
	name: 'library-rat',
	topic: 'programming',
	image_url: 'med.png'
},{
	name: 'lab-rat',
	topic: 'programming',
	image_url: 'med.png'
}]

badges.each do |bad|
  bad = Badge.create(bad)
  if bad.save
  	puts "Saved user #{bad.name}"
  else
  	puts "#{bad.errors}"
  end
end

badusers = [{
	user_id: 2,
	badge_id: 3
	
},{
	user_id: 1,
	badge_id: 1
},{
	user_id: 3,
	badge_id: 3
},{
	user_id: 8,
	badge_id: 2
},{
	user_id: 5,
	badge_id: 1
},{
	user_id: 9,
	badge_id: 1
},{
	user_id: 6,
	badge_id: 2
},{
	user_id: 4,
	badge_id: 3
},{
	user_id: 5,
	badge_id: 1
},{
	user_id: 6,
	badge_id: 2

},{	user_id: 2,
	badge_id: 3
	
},{
	user_id: 1,
	badge_id: 2
},{
	user_id: 3,
	badge_id: 1
},{
	user_id: 8,
	badge_id: 3
},{
	user_id: 5,
	badge_id: 1
},{
	user_id: 9,
	badge_id: 2
},{
	user_id: 6,
	badge_id: 3
},{
	user_id: 4,
	badge_id: 1
},{
	user_id: 5,
	badge_id: 2
},{
	user_id: 6,
	badge_id: 3
}]

badusers.each do |bu|
  bu = BadgesUsers.create(bu)
  if bu.save
  	puts "Saved user #{bu.user_id}"
  else
  	puts "#{bu.errors}"
  end
end

