## Create Images
index = 3
33.times do
  image = Image.create(url: "image_#{index}.png", description: "image of jewelry item")
  index = index + 1
end
