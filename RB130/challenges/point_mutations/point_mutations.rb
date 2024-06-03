class DNA
  attr_reader :template

  def initialize(template)
    @template = template
  end

  def hamming_distance(query)
    hamming_distance_count = 0
    test_query, test_template = condition_sequences(query)
    iterations = test_template.size

    iterations.times do |idx|
      hamming_distance_count += 1 unless test_query[idx] == test_template[idx]
    end

    hamming_distance_count
  end

  private

  def condition_sequences(query)
    shortest_string_length = template.size > query.size ? query.size : template.size
    new_query = query[0, shortest_string_length]
    new_template = template[0, shortest_string_length]
    [new_query, new_template]
  end
end