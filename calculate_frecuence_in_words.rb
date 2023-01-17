def check_if_array_string(value)
    if !value.all?{ |w| w.is_a? String }
        raise "#{value} is not an array of Strings"
    end
end
 
def pre_process_inputs(sentences, words_to_ignore)
value = [sentences, words_to_ignore]
value.each do |val|
    check_if_array_string(val)
end
words = sentences.join(" ").downcase.split(/\W+/)
ignored_words = words_to_ignore.map{|w| w.downcase}
return words, ignored_words
end

def calculate_frecuence_in_words_from_sentences(sentences, words_to_ignore)
    words_freqs = Hash.new(0)
    words, ignored_words = pre_process_inputs(sentences, words_to_ignore)
    words.each do |word|
        next if ignored_words.include?(word) || word.empty?
        words_freqs[word] +=1
    end
    return words_freqs.sort_by { |word, freq| -freq}.to_a
end


sentences = ["hola como estas estas tal", "HOLA", "hola, que tal tal"]
words_to_ignore = [1,2]
p calculate_frecuence_in_words_from_sentences(sentences, words_to_ignore)