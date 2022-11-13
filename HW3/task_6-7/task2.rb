require 'timeout'
require "creates_html_file_test"


class ElectronicAnimal
  def animals_types(animal_choice)
    case animal_choice
    when 'dog'
      puts 'гав гав'
    when 'cat'
      puts 'м\'яу м\'яу'
    when 'parrot'
      puts 'чик чирик'
    else
      puts'невірний вибір'                               
    end
  end
end


class Pet < ElectronicAnimal
  RANDOM_S = ['я хочу їсти', 'я хочу в туалет', 'я хочу гулять']
  ANIMAL_CHOICE_ARG = ['dog', 'cat', 'parrot']
  attr_reader :name, :life, :mood, :sleep_t, :hunger, :toilet, :smart ,:name_animal
  def initialize(name, name_animal)
    animals_types(name_animal)
    @name = name
    @life = 10
    @mood = 10
    @sleep_t = 0
    @hunger = 0
    @toilet = 0
    @smart = 3
  end
#-----------------------
  def stroll
    puts "ви гуляєте з #{name}"
    puts 'він дуже веселий'        
    @mood = 10
    @hunger +=3
    @smart +=3
    @sleep_t +=3
    @toilet +=1      
    passage_of_time                
  end

  def dream
    puts "#{name} іде спати"
    puts 'zzz-z-zzzzz--z-zz'
    @toilet +=1
    @hunger +=1
    @sleep_t = 0 if @sleep_t >= 10
    if @hunger >= 9
      choice_hunger = true
      while choice_hunger
        puts 'Прокинувся бо хоче їсти'
        puts '1 - нагодувати'
        puts '2 - відстань, іди спати'
        selection_command = STDIN.gets.chomp.to_i
        if selection_command == 1
          feed
          choice_hunger = false
        elsif selection_command == 2
          @mood -= 2
          puts 'Образився і пішов спати'
          choice_hunger = false
        else
          next
        end
      end
    end 
    if @toilet >= 5
      choice_toilet = true
      while choice_toilet
        puts 'прокинувся бо хоче в туале і боїця темряви'
        puts 'кличе вас !!! '
        puts '1 - ви допоможете.'
        puts '2 - ви не допоможете'
        selection_command = STDIN.gets.chomp.to_i
        if selection_command == 1
          puts 'ведемо до туалету'
          go_to_the_toilet
          puts 'лягае далі спати'
          choice_toilet = false
        elsif selection_command == 2
          puts 'іди сам'
          puts 'я боюся темряви'
          puts 'ой мени вже непотрибно '
          puts 'НУ КАПЕЦЬ ЯК ТАК ТО'
          cleaning
          choice_toilet = false
        else
          next
        end
      end
    end    
    passage_of_time
  end

  def game
    puts "#{name} граєця з м'ячем"
    puts 'ганяє по полю'
    @life = 10
    @mood = 10
    passage_of_time
  end

  def study
    puts "#{name} навчається"
    puts 'бла бла 2+2 = ?'
    @sleep_t += 5
    @hunger += 4
    @smart += 6
    @mood -= 2
    passage_of_time    
  end

  def cleaning
    puts "прибираєте в кимнаті #{name}"
    puts 'вже все прибрано'
    @life = 10
    @mood = 10
    @hunger +=3
    passage_of_time
  end

  def go_to_the_toilet
    puts 'сходити до туалету'
    @toilet = 0 if @toilet >= 5 
    passage_of_time    
  end

  def listen_to_music
    puts "#{name} слухає музику"
    puts <<-Music 
    |-----------------|
    | oooo AC/DC oooo |
    |-----------------|
    Music
    @mood = 10
    passage_of_time
  end

  def call_the_owner
    puts "#{name} кличе вас"
    random_s = RANDOM_S.sample
    puts random_s
    if random_s == 'я хочу їсти'
      feed
    elsif random_s == 'я хочу в туалет'
      go_to_the_toilet
    elsif random_s == 'я хочу гуляти'
      stroll
    end
    passage_of_time
  end

  def feed
    puts "ви гудуєте #{name}"
    puts 'їсть смаколики'
    @hunger = 0
    @toilet += 3
    passage_of_time
  end

  def play_with_the_owner
    puts "ви граєте з #{name} в Гральні кісточки до 20"
    user_points_1 = 0
    user_points_2 = 0
    stop_game = true
    while stop_game
      puts "#{@name} кидає гральні кистки"
      user_points_1 += rand(1..6)
      puts "#{@name} випало #{user_points_1}"
      while true
        puts 'ваша черга кидати натисни кнопку (y)'
        random_bone = STDIN.gets.chomp.to_s.downcase
        if random_bone == "y"
          user_points_2 += rand(1..6)
          puts "випало #{user_points_2}"
          if user_points_1 >= 20
            puts "#{user_points_1}"
            puts "---#{@name} виграв---"
            @smart += 3
            @mood = 10
            stop_game = false
          elsif user_points_2 >= 20
            puts "#{user_points_2}"
            puts "---ви виграли---"
            @mood -= 3
            stop_game = false
          end
          break
        else
          next
        end
      end      
    end
    passage_of_time
  end

  def reseler(arg_1 = "*", arg_2 = 50)
    puts arg_1 * arg_2
  end

  def random_intelligence
    reseler
    puts "#{name} займаеться своїми справами"
    arg_random = nil
    arr = [method(:game), method(:listen_to_music), method(:call_the_owner),method(:study)].sample
    arg_random = arr.call
    reseler
  end

  def vital_statistics
    emoji_array = ["&#x1F480", "&#x1F621", "&#x1F614", "&#x1F62B", "&#x1F62E", "&#x1F627", "&#x1F615", "&#x1F614", "&#x1F642", "&#x1F603"]
     
    life_t = emoji_array[valid_p(@life)]
    mood_t = emoji_array[valid_p(@mood)]
    sleep_t = emoji_array.reverse[valid_p(@sleep_t)]
    hunger_t = emoji_array.reverse[valid_p(@hunger)]
    toilet_t = emoji_array.reverse[valid_p(@toilet)]
    smart_t = emoji_array[valid_p(@smart)]

    if life_t == "&#x1F480" || mood_t == "&#x1F480" || sleep_t == "&#x1F480" || hunger_t == "&#x1F480" || toilet_t == "&#x1F480" || smart_t == "&#x1F480"
      return %[
                <table>
                <h1>&#x1F480 тамагочи помер &#x1F480</h1>
                <table>
              ] 
    else
      return %[
                <table>
                  <tr>
                    <td>animal: </td>
                    <td>   -- #{name_animal}</td>
                  </tr>
                  <tr>
                    <td>name: </td>
                    <td>   -- #{@name}</td>
                  </tr>
                  <tr>
                    <td>life: </td>
                    <td>   -- #{life_t}</td>
                  </tr>
                  <tr>
                    <td>mood: </td>
                    <td>   -- #{mood_t}</td>
                  </tr>
                  <tr>
                    <td>sleep: </td>
                    <td>   -- #{sleep_t}</td>
                  </tr>
                  <tr>
                    <td>hunger: </td>
                    <td>   -- #{hunger_t}</td>
                  </tr>
                  <tr>
                    <td>toilet: </td>
                    <td>   -- #{toilet_t}</td>
                  </tr>
                  <tr>
                    <td>smart: </td>
                    <td>   -- #{smart_t}</td>
                  </tr>
                </table>
              ]
    end
  end
#-------------------------
  private

  def passage_of_time
    sleep(3)
    if @sleep_t > 10
      puts 'Я хочу спати'
    end
    if @hunger >= 5 &&  @hunger <= 7
      puts 'урчит в животі'
    elsif @hunger >= 7 && @hunger <= 9
      puts "я хочу їсти"
    elsif @hunger == 10
      puts 'я дуже хочу їсти'
    elsif @hunger >= 10
      abort "#{@name} помер від голоду"
    end
    if @life < 1
      abort 'Помер від поганого життя'
    elsif @life <= 7
      puts 'мені погано'
    elsif @life <= 5
      puts 'захворів'
    end    
  end

  def valid_p(pet_points)
    if pet_points >= 10
      return 9
    elsif pet_points <= 0
      return 0
    else
      pet_points
    end
  end
end


def menu
  menu_exit = true
  while menu_exit
    puts '<<вас вітає тамгочі>>'
    puts '<<дайте ім\'я тамагочі:>>'
    name_t = STDIN.gets.chomp.to_s.downcase.capitalize
    puts "<<оберіть тварину із #{Pet::ANIMAL_CHOICE_ARG}>>"
    el_animal = STDIN.gets.chomp.to_s.downcase
    animal_choice_arg = Pet::ANIMAL_CHOICE_ARG
    if animal_choice_arg.include?(el_animal)
      puts "ви обрали #{el_animal}"
    else
      puts 'введена невірна тварина'
      next
    end
    tam = Pet.new(name_t, el_animal)   
    while true
      begin
        time_sec = 20  #секунди до приняття рішення, а потім тамогочі буде вирішувати сам.   
        puts '
        0 - життеві показники
        1 - тамагочі гуляє
        2 - тамагочі іде спати
        3 - тамагочі грає
        4 - тамагочі вчиться
        5 - прибираєте в кімнаті
        6 - тамагочі іде в туалет
        7 - тамагочі слухае музику
        8 - тамагочі кличе вас
        9 - нагодувати тамагочі
        10 - грати з тамагочі в Гральні кісточки
        11 - вимкнути тамагочі (y / n)
        12 - зберегти показники тамагочи в html'
        puts 'оберіть варіант: '
        var = Timeout::timeout(time_sec) {
          STDIN.gets.chomp.to_i
        }
        CreatesHtmlFileTest.creates_html_file_test(tam.vital_statistics, bypass_html: true)
        case var.to_i
        when 0 
          puts "name #{tam.name}"
          puts "life #{tam.life}"
          puts "mood #{tam.mood}"
          puts "sleep #{tam.sleep_t}"
          puts "hunger #{tam.hunger}" 
          puts "toilet #{tam.toilet}"
          puts "smart #{tam.smart}"
        when 1
          tam.stroll
          puts "#{tam.name} вже награвся"
          tam.reseler
          next
        when 2
          if tam.sleep_t != 0
            tam.dream
            puts "#{tam.name} вже прокинувся"
            tam.reseler 
          else
            puts 'Я не хочу спати'
          end
          next
        when 3
          tam.game
          puts "#{tam.name} вже награвся"
          tam.reseler 
          next
        when 4
          tam.study
          puts "#{tam.name} вже зробив уроки"
          tam.reseler 
          next
        when 5
          tam.cleaning
          puts "#{tam.name} вже прибрано у кімнаті"
          tam.reseler 
          next
        when 6
          tam.go_to_the_toilet
          puts "#{tam.name} вже сходив до туалет"
          tam.reseler 
          next
        when 7
          tam.listen_to_music
          puts "#{tam.name} вже послухав музику"
          tam.reseler 
          next
        when 8
          tam.call_the_owner
          puts "#{tam.name} дуже веселий"
          tam.reseler 
          next
        when 9
          tam.feed
          puts "#{tam.name} вже наївся"
          tam.reseler 
          next
        when 10
          tam.play_with_the_owner
          puts "#{tam.name} дуже радий що ми пограли разом"
          tam.reseler 
          next
        when 11
          puts 'натисніть y / n для виходу:'
          ex_t = STDIN.gets.chomp.to_s.downcase
          if ex_t.to_s == 'yes' || ex_t.to_s == 'y'
            puts 'вимкнули тамагочі.'
            menu_exit = false
            break
          elsif ex_t.to_s == 'no' || ex_t.to_s == 'n'
            next
          else
            puts 'ведена невірна команда.'
            next
          end
        when 12
          puts 'створюеться html file'
          CreatesHtmlFileTest.creates_html_file_test(tam.vital_statistics, bypass_html: true)
          puts 'створився html file'
        else
          puts 'ввели невірну команду'
          next
        end    
      rescue Timeout::Error
        var = nil
      end
      tam.random_intelligence
      CreatesHtmlFileTest.creates_html_file_test(tam.vital_statistics, bypass_html: true)
    end
  end
end


if __FILE__ == $0
  menu  
end
