def pre_process_inputs(sentences, words_to_ignore)
  if !words_to_ignore.all?{ |w| w.is_a? String }
      raise "words_to_ignore only can strings array"
  end
  
  if !sentences.all?{ |s| s.is_a? String }
      raise "words_to_ignore only can strings array"
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
words_to_ignore = ["que","como","rails"]
p calculate_frecuence_in_words_from_sentences(sentences, words_to_ignore)