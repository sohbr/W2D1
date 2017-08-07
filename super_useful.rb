# PHASE 2

class StringLengthError < StandardError

end

def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    return nil
  end


end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  puts "Feed me a fruit! (Enter the name of a fruit:)"

    maybe_fruit = gets.chomp

    reaction(maybe_fruit)
  rescue
    retry if maybe_fruit == "coffee"
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    begin
      raise ArgumentError if yrs_known < 5
      raise StringLengthError if name.length == 0 || fav_pastime.length == 0
      rescue ArgumentError
        puts 'You need to have known person for at least 5 years'
        return nil

      rescue StringLengthError
        puts 'Name or Favorite Pastime cannot be blank'
        return nil

    end
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
