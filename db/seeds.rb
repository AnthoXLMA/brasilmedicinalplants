# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating Plants...'

@filepath = "./db/fixtures/plant.json"
@serialized_plants = File.read(@filepath)
@plants = JSON.parse(@serialized_plants)
@plantes = []
@plants.each do |row|
  @plantes << Plant.create!(number: row['number'], nom_scientifique: row['nom_scientifique'])
end

puts 'Creating Symptoms...'

@symptomspath = "./db/fixtures/symptoms.json"
@serialized_symptoms = File.read(@symptomspath)
@symptoms = JSON.parse(@serialized_symptoms)
# @plantes = []
@symptoms.each do |k|
  Symptom.create(nom: k['nom'], plants: k['plants'])
end

puts 'Finished!'
