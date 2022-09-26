require_relative "../config/environment"

# Production.destroy_all
# CrewMember.destroy_all


puts "Seeding"
5.times do 
    Production.create(
        title: Faker::Game.title,
        genre: Faker::Game.genre,
        budget: rand(10-90)*10000,
        image: Faker::LoremFlickr.image,
        director: Faker::Name.name,
        ongoing:[true,false][rand(2)],

    )
end

puts "Done seeding #{Production.count} productions"
# byebug

30.times do |x|
    CrewMember.create(
        name: Faker::Name.name,
        job_title: Faker::Job.title,
        production_id:Production.all[rand(Production.count)].id
    )
end
puts "Done"