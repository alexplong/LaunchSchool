def count_occurrences(vehicles)

  car_collection = {}
  vehicles.each do |vehicle|
    if car_collection.has_key?(vehicle)
      car_collection[vehicle] += 1
    else
      car_collection[vehicle] = 0    
    end
  end

  p car_collection
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)