# FAO_item_group_mapper.R
library(dplyr)


cereals = data.frame(
  model_group = c("cereal"), 
  Item.Supergroup = c("crop_product"), 
  Item.Group.Code = c(2905), 
  Item.Group = c("Cereals - Excluding Beer"), 
  Item.Code = c(2511, 2513, 2514, 2517, 2515, 2516, 2518, 2520, 2805), 
  Item = c("Wheat and products", "Barley and products", "Maize and products", "Millet and products", "Rye and products", "Oats", "Sorghum and products", "Cereals, Other", "Rice (Milled Equivalent)")
)

pulses = data.frame(
  model_group = c("pulse"), 
  Item.Supergroup = c("crop_product"), 
  Item.Group.Code = c(2911),
  Item.Group = c("Pulses"), 
  Item.Code = c(2546, 2549, 2555, 2547, 2556), 
  Item = c("Beans", "Pulses, Other and products", "Soyabeans", "Peas", "Groundnuts (Shelled Eq)")
)

vegetable_oils = data.frame(
  model_group = c("oilcrop"), 
  Item.Supergroup = c("crop_product"), 
  Item.Group.Code = c(2914),
  Item.Group = c("Vegetable Oils"), 
  Item.Code = c(2581, 2573, 2575, 2579, 2580, 2586, 2571, 2572, 2574, 2576, 2577, 2582, 2578), 
  Item = c("Ricebran Oil", "Sunflowerseed Oil", "Cottonseed Oil", "Sesameseed Oil", "Olive Oil", "Oilcrops Oil, Other", "Soyabean Oil", "Groundnut Oil", "Rape and Mustard Oil", "Palmkernel Oil", "Palm Oil", "Maize Germ Oil", "Coconut Oil")
)

oilcrops = data.frame(
  model_group = c("oilcrop"), 
  Item.Supergroup = c("crop_product"), 
  Item.Group.Code = c(2913),
  Item.Group = c("Oilcrops"), 
  Item.Code = c(2557, 2559, 2561, 2563, 2570, 2558, 2562, 2560), 
  Item = c("Sunflower seed", "Cottonseed", "Sesame seed", "Olives (including preserved)", "Oilcrops, Other", "Rape and Mustardseed", "Palm kernels", "Coconuts - Incl Copra")
)

rootstubers = data.frame(
  model_group = c("rootstubers"), 
  Item.Supergroup = c("crop_product"), 
  Item.Group.Code = c(2907),
  Item.Group = c("Starchy Roots"), 
  Item.Code = c(2532, 2533, 2534, 2535, 2531), 
  Item = c("Cassava and products", "Sweet potatoes", "Roots, Other", "Yams", "Potatoes and products")
)

citrus = data.frame(
  model_group = c("citrus"), 
  Item.Supergroup = c("crop_product"), 
  Item.Group.Code = c(2919),
  Item.Group = c("Fruits - Excluding Wine"), 
  Item.Code = c(2611, 2612, 2613, 2614), 
  Item = c("Oranges, Mandarines", "Lemons, Limes and products", "Grapefruit and products", "Citrus, Other")
)

fruits = data.frame(
  model_group = c("fruit"), 
  Item.Supergroup = c("crop_product"), 
  Item.Group.Code = c(2919),
  Item.Group = c("Fruits - Excluding Wine"), 
  Item.Code = c(2615, 2616, 2617, 2618, 2620, 2625), 
  Item = c("Bananas", "Plantains", "Apples and products", "Pineapples and products", "Grapes and products (excl wine)", "Fruits, Other")
)

vegetables = data.frame(
  model_group = c("vegetable"), 
  Item.Group.Code = c(2918), 
  Item.Supergroup = c("crop_product"),
  Item.Group = c("Vegetables"),
  Item.Code = c(2601, 2602, 2605), 
  Item = c("Tomatoes and products", "Onions", "Vegetables, Other")
)

treenuts = data.frame(
  model_group = c("treenut"), 
  Item.Group.Code = c(2912), 
  Item.Supergroup = c("crop_product"),
  Item.Group = c("Treenuts"), 
  Item.Code = c(2551), 
  Item = c("Nuts and products")
)

sugarcrops = data.frame(
  model_group = c("sugarcrop"), 
  Item.Supergroup = c("crop_product"), 
  Item.Group.Code = c(2908),
  Item.Group = c("Sugar Crops"), 
  Item.Code = c(2536, 2537, 2619), 
  Item = c("Sugar cane", "Sugar beet", "Dates")
)

sweeteners = data.frame(
  model_group = c("sugarcrop"), 
  Item.Supergroup = c("crop_product"), 
  Item.Group.Code = c(2909),
  Item.Group = c("Sugar & Sweeteners"), 
  Item.Code = c(2541, 2542, 2543), 
  Item = c("Sugar non-centrifugal", "Sugar (Raw Equivalent)", "Sweeteners, Other")
)

beehive = data.frame(
  model_group = c("beehive"), 
  Item.Supergroup = c("bee_honey"), 
  Item.Group.Code = c(2909),
  Item.Group = c("Sugar & Sweeteners"), 
  Item.Code = c(2745), 
  Item = c("Honey")
)

#fats are presently classified under meats
#assume most fats come from pigs
sus_fat = data.frame(
  model_group = c("sus_meat"), 
  Item.Supergroup = c("sus_meat"), 
  Item.Group.Code = c(2946),
  Item.Group = c("Animal fats"), 
  Item.Code = c(2737), 
  Item = c("Fats, Animals, Raw")
)
  
fish_oil = data.frame(
  model_group = c("fish_other"), 
  Item.Supergroup = c("fish_other"), 
  Item.Group.Code = c(2946),
  Item.Group = c("Animal fats"), 
  Item.Code = c(2781, 2782), 
  Item = c("Fish, Body Oil", "Fish, Liver Oil")
)

eggs = data.frame(
  model_group = c("aves_dairy"), 
  Item.Supergroup = c("aves_dairy"), 
  Item.Group.Code = c(2949),
  Item.Group = c("Eggs"), 
  Item.Code = c(2744), 
  Item = c("Eggs")
)

dairy_fats = data.frame(
  model_group = c("bovine_dairy"), 
  Item.Supergroup = c("bovine_dairy"), 
  Item.Group.Code = c(2946),
  Item.Group = c("Animal fats"), 
  Item.Code = c(2740), 
  Item = c("Butter, Ghee")
)

dairy_milk = data.frame(
  model_group = c("bovine_dairy"), 
  Item.Supergroup = c("bovine_dairy"), 
  Item.Group.Code = c(2948),
  Item.Group = c("Milk - Excluding Butter"), 
  Item.Code = c(2743, 2848), 
  Item = c("Cream", "Milk - Excluding Butter")
)

# ruminant_animals = data.frame(
#   model_group = c("ruminant_meat"), 
#   Item.Supergroup = c("ruminant_livestock_product"), 
#   Item.Group.Code = c(2943),
#   Item.Group = c("Meat"), 
#   Item.Code = c(2731, 2732), 
#   Item = c("Bovine Meat", "Mutton & Goat Meat")
# )

bovine_meat = data.frame(
  model_group = c("bovine_meat"), 
  Item.Supergroup = c("bovine_meat"), 
  Item.Group.Code = c(2943),
  Item.Group = c("Meat"), 
  Item.Code = c(2731), 
  Item = c("Bovine Meat")
)

caprine_meat = data.frame(
  model_group = c("caprine_meat"), 
  Item.Supergroup = c("caprine_meat"), 
  Item.Group.Code = c(2943),
  Item.Group = c("Meat"), 
  Item.Code = c(2732), 
  Item = c("Mutton & Goat Meat")
)

# nonruminant_animals = data.frame(
#   model_group = c("monogastric_meat"), 
#   Item.Supergroup = c("livestock_product"), 
#   Item.Group.Code = c(2943),
#   Item.Group = c("Meat"), 
#   Item.Code = c(2734, 2733, 2735), 
#   Item = c("Poultry Meat", "Pigmeat", "Meat, Other")
# )

sus_meat = data.frame(
  model_group = c("sus_meat"), 
  Item.Supergroup = c("sus_meat"), 
  Item.Group.Code = c(2943),
  Item.Group = c("Meat"), 
  Item.Code = c(2733, 2735), 
  Item = c("Pigmeat", "Meat, Other")
)

aves_meat = data.frame(
  model_group = c("aves_meat"), 
  Item.Supergroup = c("aves_meat"), 
  Item.Group.Code = c(2943),
  Item.Group = c("Meat"), 
  Item.Code = c(2734), 
  Item = c("Poultry Meat")
)

#Will need a better way to distinguish offals from different livestock animals
#For now, assume offals go to livestock feed
offals = data.frame(
  model_group = c("bovine_meat"), 
  Item.Supergroup = c("bovine_meat"), 
  Item.Group.Code = c(2945), 
  Item.Group = c("Offals"), 
  Item.Code = c(2736), 
  Item = c("Offals, Edible")
)

fishseafood = data.frame(
  model_group = c("fish_meat"), 
  Item.Supergroup = c("fish_meat"), 
  Item.Group.Code = c(2960),
  Item.Group = c("Fish, Seafood"), 
  Item.Code = c(2761, 2762, 2763, 2764, 2765, 2766, 2767), 
  Item = c("Freshwater Fish", "Demersal Fish", "Pelagic Fish", "Marine Fish, Other", "Crustaceans", "Cephalopods", "Molluscs, Other")
)

aquatic_products = data.frame(
  model_group = c("aquaticmarine_product"), 
  Item.Supergroup = c("aquaticmarine_product"), 
  Item.Group.Code = c(2961),
  Item.Group = c("Aquatic Products, Other"), 
  Item.Code = c(2775, 2769, 2768), 
  Item = c("Aquatic Plants", "Aquatic Animals, Others", "Meat, Aquatic Mammals")
)

alcoholic_beverages = data.frame(
  model_group = c("alcohol"), 
  Item.Supergroup = c("crop_product"), 
  Item.Group.Code = c(2924),
  Item.Group = c("Alcoholic Beverages"), 
  Item.Code = c(2655, 2656, 2657, 2658, 2659), 
  Item = c("Wine", "Beer", "Beverages, Fermented", "Beverages, Alcoholic", "Alcohol, Non-Food")
)

spices = data.frame(
  model_group = c("spices"), 
  Item.Supergroup = c("crop_product"), 
  Item.Group.Code = c(2923),
  Item.Group = c("Spices"), 
  Item.Code = c(2640, 2641, 2642, 2645), 
  Item = c("Pepper", "Pimento", "Cloves", "Spices, Other")
)

stimulants = data.frame(
  model_group = c("stimulants"), 
  Item.Supergroup = c("crop_product"), 
  Item.Group.Code = c(2922, 2922, 2928),
  Item.Group = c("Stimulants", "Stimulants", "Miscellaneous"), 
  Item.Code = c(2630, 2635, 2633), 
  Item = c("Coffee and products", "Tea (including mate)", "Cocoa Beans and products")
)
            
# misc = data.frame(
#   model_group = c("stims"), 
#   Item.Supergroup = c("crop_product"), 
#   Item.Group.Code = c(2928),
#   Item.Group = c("Miscellaneous"), 
#   Item.Code = c(2633), 
#   Item = c("Cocoa Beans and products")
# )


combined_item_group_mapper <- cereals %>% 
  bind_rows(pulses) %>% 
  bind_rows(vegetable_oils) %>% 
  bind_rows(oilcrops) %>% 
  bind_rows(rootstubers) %>% 
  bind_rows(citrus) %>% 
  bind_rows(fruits) %>% 
  bind_rows(vegetables) %>% 
  bind_rows(treenuts) %>% 
  bind_rows(sugarcrops) %>% 
  bind_rows(sweeteners) %>% 
  bind_rows(beehive) %>% 
  bind_rows(sus_fat) %>% 
  bind_rows(fish_oil) %>% 
  bind_rows(eggs) %>% 
  bind_rows(dairy_fats) %>% 
  bind_rows(dairy_milk) %>% 
  bind_rows(bovine_meat) %>% 
  bind_rows(caprine_meat) %>% 
  bind_rows(sus_meat) %>% 
  bind_rows(aves_meat) %>% 
  bind_rows(offals) %>% 
  bind_rows(fishseafood) %>% 
  bind_rows(aquatic_products) %>% 
  bind_rows(alcoholic_beverages) %>% 
  bind_rows(spices) %>% 
  bind_rows(stimulants) %>% 
  arrange(Item)


  