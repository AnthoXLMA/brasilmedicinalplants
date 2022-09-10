# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "cleaning DB..."
Tratamento.delete_all
Symptom.delete_all
Plantcard.delete_all
Plant.delete_all
Tipo.delete_all

puts 'Creating Especies...'
@tipospath = "./db/fixtures/especie.json"
@serialized_tipos = File.read(@tipospath)
@tipos = JSON.parse(@serialized_tipos)
@tipos.each do |e|
  Tipo.create(especie: e['especie'])
end

puts 'Creating Plants...'
@filepath = "./db/fixtures/plant.json"
@serialized_plants = File.read(@filepath)
@plants = JSON.parse(@serialized_plants)
@plantes = []
@plants.each do |row|
  @plantes << Plant.create!(number: row['number'],
    nom_scientifique: row['nom_scientifique'],
    noms_populaires: row['noms_populaires'],
    tipo_id: row['tipo_id']
    )
end

puts 'Creating PlantCards...'
@cardspath = "./db/fixtures/plantcard.json"
@serialized_cards = File.read(@cardspath)
@cards = JSON.parse(@serialized_cards)
@cards.each do |c|
  Plantcard.create(title: c['title'], plant_id: c['plant_id'])
end

puts 'Creating Symptoms...'
@symptomspath = "./db/fixtures/symptoms.json"
@serialized_symptoms = File.read(@symptomspath)
@symptoms = JSON.parse(@serialized_symptoms)
@symptoms.each do |k|
  Symptom.create(nom: k['nom'], plants: k['plants'])
end

puts 'Creating Tratamentos...'
@tratamentospath = "./db/fixtures/types.json"
@serialized_tratamentos = File.read(@tratamentospath)
@tratamentos = JSON.parse(@serialized_tratamentos)
@tratamentos.each do |t|
  Tratamento.create(nom: t['nom'], description: t['description'],)
end

puts 'Finished!'
