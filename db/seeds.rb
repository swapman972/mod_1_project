    Pokemon.delete_all
    Trainer.delete_all
    TrainerPokemon.delete_all

charmander = Pokemon.create(species: "Charizard", element: "fire")
ninetales = Pokemon.create(species: "Ninetales", element: "fire")
arcanie = Pokemon.create(species: "Arcanine", element: "fire")
rapidash = Pokemon.create(species: "Rapidash", element: "fire")
magmar = Pokemon.create(species: "Magmar", element: "fire")

blastoise = Pokemon.create(species: "Blastoise", element: "water")
golduck = Pokemon.create(species: "Golduck", element: "water")
poliwarth = Pokemon.create(species: "Poliwarth", element: "water")
tentacruel = Pokemon.create(species: "Tentacruel", element: "water")
slowbro = Pokemon.create(species: "Slowbro", element: "water")

venusaur = Pokemon.create(species: "Venusaur", element: "grass")
vileplume = Pokemon.create(species: "Vileplume", element: "grass")
parasect = Pokemon.create(species: "Parasect", element: "grass")
victreebel = Pokemon.create(species: "Victreebel", element: "grass")
exeggutor = Pokemon.create(species: "Exeggutor", element: "grass")
