    Pokemon.delete_all
    Trainer.delete_all
    TrainerPokemon.delete_all


charmander = Pokemon.create(species: "Charizard", element: "fire")
ninetales = Pokemon.create(species: "Ninetales", element: "fire")
arcanie = Pokemon.create(species: "Arcanine", element: "fire")
rapidash = Pokemon.create(species: "Rapidash", element: "fire")
magmar = Pokemon.create(species: "Magmar", element: "fire")

blatoise = Pokemon.create(species: "Blatoise", element: "water")
golduck = Pokemon.create(species: "Golduck", element: "water")
poliwarth = Pokemon.create(species: "Poliwarth", element: "water")
tentacruel = Pokemon.create(species: "Tentacruel", element: "water")
slowbro = Pokemon.create(species: "Slowbro", element: "water")

venusaur = Pokemon.create(species: "Venusaur", element: "grass")
vileplume = Pokemon.create(species: "Vileplume", element: "grass")
parasect = Pokemon.create(species: "Parasect", element: "grass")
victreebel = Pokemon.create(species: "Victreebel", element: "grass")
exeggutor = Pokemon.create(species: "Exeggutor", element: "grass")

# you can add the pokemon that you want by using the following line as an example 
# edgar.pokemons << blatoise and then it will up on in the trainer_pokemons table
# and edgar.pokemon

jordan =Trainer.create(name:"Jordan")
elias =Trainer.create(name:"Elias")
edgar =Trainer.create(name:"Edgar")
edgar.pokemons << blatoise
edgar.pokemons << slowbro