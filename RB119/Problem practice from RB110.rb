require "pry"
# Create a method to return minimum age from Munster family hash

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# def find_min_age(hash)
#   hash.values.min
# end

# # Find index of name that starts with "Be"
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# def find_index(arr, prefix="Be")
#   arr.index do |name|
#     name.start_with?(prefix)
#   end
# end


def product_except_self(nums)
    n = nums.length
    prefix, postfix = [1, 1]
    products = [1] * n

    nums.each_with_index do |n, i|
        prefix = prefix * n
        products[i] *= prefix
    end

    binding.pry

    1.upto(n) do |j|
        products[-j] = products[-(j + 1)] * postfix
        postfix = postfix * nums[-j]

    end
    products
end


p product_except_self([1,2,3,4])