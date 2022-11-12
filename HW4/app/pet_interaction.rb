require 'timeout'


class PetInteraction
  attr_reader :name, :life, :mood, :sleep_t, :hunger, :toilet, :smart ,:name_animal, :info, :info_pet,:is_pet_alive
  def initialize(name)
    @name = name
    @life = 10
    @mood = 10
    @sleep_t = 0
    @hunger = 0
    @toilet = 0
    @smart = 3
    @info = "все добре"
    @info_pet = "привіт"
    @is_pet_alive = true
  end
#-----------------------
  def stroll
    @info_pet = "ви гуляєте з #{@name}"   
    @mood = 10
    @hunger +=3
    @smart +=3
    @sleep_t +=3
    @toilet +=1      
    passage_of_time                
  end

  def feed
    @info_pet ="ви гудуєте #{@name}, їсть смаколики"
    @hunger = 0
    @toilet += 3
    passage_of_time
  end

  def dream
    @info_pet = "#{@name} іде спати"
    @toilet += 1
    @hunger += 1
    @sleep_t = 0
    @mood = 10
    passage_of_time
  end

  def study
    @info_pet = "#{name} навчається"
    @sleep_t += 3
    @hunger += 4
    @smart += 6
    @mood -= 2
    passage_of_time    
  end

  def cleaning
    @info_pet = "прибираєте в кимнаті #{name}"
    @life = 10
    @mood = 10
    @hunger += 2
    passage_of_time
  end

  def go_to_the_toilet
    @toilet = 0 if @toilet >= 5
    @info_pet = "сходити до туалету"
    passage_of_time    
  end
#-------------------------
  private

  def passage_of_time
    @life = valid_p(@life)
    @mood = valid_p(@mood)
    @sleep_t = valid_p(@sleep_t)
    @hunger = valid_p(@hunger)
    @toilet = valid_p(@toilet)
    @smart = valid_p(@smart)

    if @sleep_t >= 9
      @info = 'Я хочу спати'
    end
    if @hunger >= 5 &&  @hunger <= 7
      @info = 'урчит в животі'
    elsif @hunger > 7 && @hunger < 9
      @info = "я хочу їсти"
    elsif @hunger == 9
      @info = 'я дуже хочу їсти'
    elsif @hunger == 10
      @info = "#{@name} помер від голоду"
      @is_pet_alive = false
    elsif @life < 1
      @info = 'Помер від поганого життя'
      @is_pet_alive = false
    elsif @life <= 7
      @info = 'мені погано'
    elsif @life <= 5
      @info = 'захворів'
    else
      @info = 'все добре'
    end    
  end

  def valid_p(pet_points)
    if pet_points >= 10
      return 10
    elsif pet_points <= 0
      return 0
    else
      pet_points
    end
  end
end