# Hangman!  Rails Girls Wellington March 2014.

guesses = []
guesses_left = 8

# select a random word
target_word = File.read("words.txt").split.sample

Kernel.loop do
  # for each letter, display an underscore
  target_word.chars.each do |letter|
    if guesses.member?(letter)
      Kernel.print(letter)
    else
      Kernel.print("_")
    end
  end

  # guess a letter
  Kernel.print("Guess a letter: ")

  # get input from user
  guess = Kernel.gets.strip

  # TODO : validate user input

  # check whether letter is in word
  if target_word.index(guess) != nil
    # if it is, display the letter the next time around
    guesses.push(guess)
  else
    # if it's not, they get one less guess
    guesses_left = guesses_left - 1
  end

  # if run out of guesses, say bad luck + exit
  if guesses_left == 0
    Kernel.puts("Sorry you ran out of guesses.")
    break
  end

  # if they get all the letters, say you win + exit
  letters_found = target_word.chars.select do |guess|
    guesses.index(guess) != nil
  end

  if letters_found.length == target_word.length
    Kernel.puts("Yay you won!")
    break
  end

  # repeat
end
