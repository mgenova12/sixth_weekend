# Create a thesaurus program. To create it, you will create two classes, Thesaurus and Entry.
# A Thesaurus will contain many Entries. An Entry contains three primary attributes:
# word, synonyms, and antonyms. Your application should contain the following features:
# 1. The ability to add new words to a Thesaurus.
# 2. The ability to delete a word from a Thesaurus. 
# 3. The ability to look up a word's synonyms.
# 4. The ability to look up a word's antonyms.
# 5. The ability to add a synonym to a word.
# 6. The ability to add an antonym to a word.
#
# Part of the challenge is to determine which functionality belongs in the Thesaurus class,
# and which belongs in the Entry class.

class Entry
  attr_accessor :words, :synonyms, :antonyms
  def initialize(input)
    @words = input[:words]
    @synonyms = input[:synonyms]
    @antonyms = input[:antonyms]
  end
end 

class Thesaurus 
  def initialize(entry)
    @entry = entry
  end

  def add(word, synonym, antonym)
    @entry.words << [word] 
    @entry.synonyms << [synonym]
    @entry.antonyms << [antonym]
  end 

  def delete(word)
    if @entry.words.include?([word])
      idx = @entry.words.index([word])
      @entry.words.delete_at(idx)
      @entry.synonyms.delete_at(idx)
      @entry.antonyms.delete_at(idx)
    else 
      p "That word doesn't exit"
    end
  end

  def look_up_synonyms(word)
    idx = @entry.words.index([word])
    @entry.synonyms[idx]

  end

  def look_up_antonyms(word)
    idx = @entry.words.index([word])
    @entry.antonyms[idx]
  end

  def add_synonym(word, synonym)
    idx = @entry.words.index([word])
    @entry.synonyms[idx] << synonym
  end

  def add_antonym(word, antonym)
    idx = @entry.words.index([word])
    @entry.antonyms[idx] << antonym    
  end

end

entry = Entry.new({words: [['like']], synonyms: [['related']], antonyms: [['different']]})

thesaurus = Thesaurus.new(entry)

p 'Testing add method'
p '-------------------------'
thesaurus.add('bye', 'so long', 'hello')
p entry.words
p entry.synonyms
p entry.antonyms

puts 
p 'Testing add_synonym method'
thesaurus.add_synonym('like','equal')
p '-------------------------'

puts 
p 'Testing add_antonym method'
thesaurus.add_antonym('like','unlike')
p '-------------------------'

puts 
p 'Testing look_up_synonym method'
p '-------------------------'
p thesaurus.look_up_synonyms('like')
p thesaurus.look_up_synonyms('bye')

puts 
p 'Testing look_up_antonym method'
p '-------------------------'
p thesaurus.look_up_antonyms('like')
p thesaurus.look_up_antonyms('bye')

puts
p 'Testing delete method'
p '-------------------------'
thesaurus.delete('like')
p entry.words
p entry.synonyms
p entry.antonyms






