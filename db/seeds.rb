# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Theme.create(
	name: 'Tech'
)

User.create(
    user_name: 'Hugo',
    password: 'bonjour',
    nb_skilly: 100,
    first_name: 'hugo',
    last_name: 'martinez',
    email: 'hugo@mail.com',
    location: 'Paris',
    age: 23,
    photo: 'http://images.google.fr/imgres?imgurl=http%3A%2F%2Fcdn.deguisetoi.fr%2Fimages%2Frep_art%2Fgra%2F174%2F7%2F174755%2Fsombrero-mexicain-adulte_4.jpg&imgrefurl=http%3A%2F%2Fwww.deguisetoi.fr%2Fp-174755-sombrero-mexicain-adulte.html%3Ftype%3Dproduct&h=2400&w=1744&tbnid=B_Is2M1ceYSe8M%3A&vet=1&docid=xbpKeSv419By6M&ei=oW1FWMO6IoG0aYGRm3g&tbm=isch&client=safari&iact=rc&uact=3&dur=191&page=0&start=0&ndsp=21&ved=0ahUKEwiDj9qglt3QAhUBWhoKHYHIBg8QMwgwKAAwAA&bih=800&biw=1280'
)

User.create(
	user_name: 'Thomas',
	password: 'hello',
	nb_skilly: 150,
	first_name: 'thomas',
	last_name: 'bessiere',
	email: 'thomas@mail.com',
	location: 'Toulouse',
	age: 23,
	photo: 'http://images.google.fr/imgres?imgurl=https%3A%2F%2Fmedia.licdn.com%2Fmpr%2Fmpr%2Fshrinknp_200_200%2FAAEAAQAAAAAAAAY6AAAAJDMwYWE1YzA4LTcwOTktNDAxMi1hZTMwLTMxZWYxMjQ3MDk1Ng.jpg&imgrefurl=https%3A%2F%2Ffr.linkedin.com%2Fin%2Fthomas-bessiere-952340a6&h=200&w=200&tbnid=Pxc20z7VbBFaAM%3A&vet=1&docid=UAHbr5NHdtBvOM&ei=VW5FWMDgO8e5asW3l5AB&tbm=isch&client=safari&iact=rc&uact=3&dur=238&page=0&start=0&ndsp=27&ved=0ahUKEwiA3932lt3QAhXHnBoKHcXbBRIQMwgeKAEwAQ&bih=800&biw=1280'
)

Course.create(
	user_id: 1,
	theme_id: 1,
	title: 'Vulgarisation Blockchain',
	description: 'Cours sur les fondamentaux de la Blockchain, cette nouvelle technologie qui vient disrupter l univers des banques et des assurances. Cours de vulgarisation, pour tous les niveaux.',
	cost: 110,
	location: 'Toulouse',
	photo: 'img/courses/blockchain.jpeg'
)

Course.create(
	user_id: 1,
	theme_id: 1,
	title: 'Sculpture pour débutants',
	description: "Session d'apprentissage de la sculpture pour les personnes n'ayant pas d'expérience.",
	cost: 60,
	location: 'Egypte',
	photo: 'img/courses/sculpture.jpg'
)

Course.create(
	user_id: 1,
	theme_id: 1,
	title: 'Sculpture avancée',
	description: "Sculpture pour ceux qui ont déjà de l'expérience dans le domaine.",
	cost: 90,
	location: 'Egypte',
	photo: 'img/courses/sculpture2.jpg'
)

Course.create(
	user_id: 1,
	theme_id: 1,
	title: 'Bricolage',
	description: "Cours de bricolage pour pouvoir prendre soin de votre maison/appartement.",
	cost: 70,
	location: 'Nice',
	photo: 'img/courses/tools.jpg'
)

Course.create(
	user_id: 1,
	theme_id: 1,
	title: 'Kamasutra',
	description: "Cours de kamasutra pour faire crier votre petit amie ou simplement prendre un peu de bon temps.",
	cost: 250,
	location: 'Bois de Boulogne',
	photo: 'img/courses/woods.jpg'
)

Course.create(
	user_id: 1,
	theme_id: 1,
	title: 'Échecs',
	description: "Cours d'échecs pour tous les niveaux.",
	cost: 90,
	location: 'Paris',
	photo: 'img/courses/chess.jpg'
)

Demand.create(
	user_id: 2,
	theme_id: 1,
	comment: 'Recherche d un cours de vulgarisation scientifique sur toutes les technologies innovantes tel que la blockchain, le deep-learning ou les IoT.'
)

Keyword.create(
	name: 'Blockchain'
)

Keyword.create(
	name: 'Vulgarisation'
)

Keyword.create(
	name: 'Deep-Learning'
)

Keyword.create(
	name: 'IoT'
)

KeywordCourse.create(
	course_id: 1,
	keyword_id: 1
)

KeywordCourse.create(
	course_id: 1,
	keyword_id: 2
)

KeywordDem.create(
	dem_id: 1,
	keyword_id: 2
)

KeywordDem.create(
	dem_id: 1,
	keyword_id: 1
)

KeywordDem.create(
	dem_id: 1,
	keyword_id: 3
)

KeywordDem.create(
	dem_id: 1,
	keyword_id: 4
)
