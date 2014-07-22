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
	email: 'juancito@gmail.com',
	password: 'pass',
	image_url: 'profile-pic' # Agregarle el png a todas las profile pics
},{
	name: 'Juan',
	username: 'juan1',
	email: 'juancito@gmail.com',
	password: 'pass',
	image_url: 'profile-pic'
},{
	name: 'Juan',
	username: 'juan1',
	email: 'juancito@gmail.com',
	password: 'pass',
	image_url: 'profile-pic'
},{
	name: 'Juan',
	username: 'juan1',
	email: 'juancito@gmail.com',
	password: 'pass',
	image_url: 'profile-pic'
},{
	name: 'Juan',
	username: 'juan1',
	email: 'juancito@gmail.com',
	password: 'pass',
	image_url: 'profile-pic'
},{
	name: 'Juan',
	username: 'juan1',
	email: 'juancito@gmail.com',
	password: 'pass',
	image_url: 'profile-pic'
},{
	name: 'Juan',
	username: 'juan1',
	email: 'juancito@gmail.com',
	password: 'pass',
	image_url: 'profile-pic'
},{
	name: 'Juan',
	username: 'juan1',
	email: 'juancito@gmail.com',
	password: 'pass',
	image_url: 'profile-pic'
},{
	name: 'Juan',
	username: 'juan1',
	email: 'juancito@gmail.com',
	password: 'pass',
	image_url: 'profile-pic'
}]

users.each do |user|
  user = User.create(user)
  if user.save
  	puts "Saved user #{user.username}"
  else
  	puts "#{user.errors}"
  end
end