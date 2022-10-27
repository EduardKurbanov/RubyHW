class Animal
    def initialize(name_animal)
        @name_animal = name_animal
    end

end

class Pet
    attr_reader :name, :life, :mood, :sleep_t, :hunger, :toilet, :smart
    def initialize(name,name_animal)
 #       super(name_animal)
        @name = name
        @life = 10
        @mood = 10
        @sleep_t = 0
        @hunger = 0
        @toilet = 0
        @smart = 0
    end

#-----------------------
    def stroll
        puts "ви гуляете з #{@name}"
        puts "він дуже веселий"        
        @mood = 10
        @hunger +=3
        @smart +=3
        @sleep_t +=3
        @toilet +=1      
        passage_of_time                
    end

    def dream
        puts "#{@name} іде спати"
        puts 'zzz-z-zzzzz--z-zz'
        @toilet +=1
        @hunger +=1

        if @sleep_t >= 10
            @sleep_t = 0
        end

        if @hunger >= 9
            puts "Прокинуся бо хочу їсти"
            puts "1 - нагодувати"
            puts "2 - відстань, іди спати"
            arg_t = STDIN.gets.chomp.to_i
            if arg_t == 1
                feed
            elsif arg_t == 2
                @mood -= 2
                puts "Образився і пішов спати"
            end
        end
    
        if @toilet >= 5
            puts "прокинувся бо хоче в туале и боїця темряви"
            puts "кличе вас !!! "
            puts "1 - ви допоможете."
            puts "2 - ви не допоможете"
            arg_t = STDIN.gets.chomp.to_i
            if arg_t == 1
                puts "ведемо до туалету"
                go_to_the_toilet
                puts "лягае далі спати"
            elsif arg_t == 2
                puts "іди сам"
                puts "я боюся темряви"
                puts "ой мени вже непотрибно "
                puts "НУ КАПЕЦ КАК ТАК ТО"
                cleaning
            end
        end    
        passage_of_time
    end

    def game
        puts "#{@name} граєця з м'ячем"
        puts "ганяє по полю"
        @life = 10
        @mood = 10
        passage_of_time
    end

    def study
        puts "#{name} навчаеться"
        puts "бла бла 2+2 = ?"
        @sleep_t += 5
        @hunger += 1
        @smart += 6
        @mood -= 2
        passage_of_time    
    end

    def cleaning
        puts "прибираете кимнаті #{name}"
        puts 'вже все прибрано'
        @life = 10
        @mood = 10
        passage_of_time
    end

    def go_to_the_toilet
        puts "сходити до туалету"
        if @toilet >= 5 
            @toilet = 0
        end
        passage_of_time    
    end

    def listen_to_music
        puts "#{name} слухае музику"
        puts <<-Music 
        |-----------------|
        | oooo AC/DC oooo |
        |-----------------|
        Music
        @mood = 10
        passage_of_time

    end

    def call_the_owner
        puts "#{name} вас кличе"
        a_1 = "я хочу їсти"
        a_2 = "я хочу в туалет"
        a_3 = "я хочу гулять"
        random_s = [a_1, a_2, a_3].sample
#        random_s = ["i want to eat", "I want to go to the toilet", "I want to go for a walk"].sample
        puts random_s

        if random_s.to_s == "я хочу їсти"
            feed
        elsif random_s.to_s == "я хочу в туалет"
            go_to_the_toilet

        elsif random_s.to_s == "я хочу гулять"
            stroll
        end
        passage_of_time
    end

    def feed
        puts "ви гудуете #{@name}"
        puts "їсть смаколики"
        @hunger = 0
        @toilet += 3
        passage_of_time
    end

    def play_with_the_owner
        puts "ви гуляєте з #{@name} в гральни кістку до 20"
        pl_count = 0
        p2_count = 0
        while true
            puts "#{@name} кидае гральну кистку"
            pl_count += rand(1..6)
            puts "#{@name} випало #{pl_count}"
            puts 'ваша черга кидать натисни кнопку (y)'
            ran_b = STDIN.gets.chomp.to_s
            if ran_b == "y".downcase
                p2_count += rand(1..6)
                puts "випало #{p2_count}"
            
                if pl_count >= 20
                    puts "#{p2_count}"
                    puts "---#{@name} виграв---"
                    @smart += 3
                    @mood = 10
                    break
                elsif p2_count >= 20
                    puts "#{p2_count}"
                    puts "---ви виграли---"
                    @mood -= 3
                    break
                end
            end
        passage_of_time
        end
    end
#-------------------------
    private
    def passage_of_time
        sleep(3)
        if @sleep_t > 10
          puts "Я хочу спати"
        end  
    
        if @hunger >= 5 &&  @hunger <= 6
            puts 'урчит в животі'
        elsif @hunger >= 7 && @hunger <= 9
            puts "я хочу їсти"
        elsif @hunger == 10
            puts 'я дуже хочу їсти'
        elsif @hunger > 10
            abort "#{@name} помер від голоду"
        end
        

        if @life < 1
            abort "Помер від поганого життя"
        elsif @life <= 7
            puts 'мені погано'
        elsif @life <= 5
            puts 'захворів'
        end    
    end
    public
    def random_intelligence
        p "1"
        arg_r = nil
        arr = [method(:game), method(:listen_to_music), method(:call_the_owner),method(:study)].sample
        arg_r = arr.call
        p "2"
    end
end


def menu
    while true
        puts 'вас вітае тамгочі'
        puts 'дайте им\'я тамагочи'
        name_t = STDIN.gets.chomp
        tam = Pet.new(name_t)
        puts <<-consol
        0 - життеві показники
        1 - тамагочі гуляе
        2 - тамагочі іде спати
        3 - тамагочі играе
        4 - тамагочі вчиться
        5 - прибираете в кімнаті
        6 - тамагочі іде в туалет
        7 - тамагочі слухае музику
        8 - тамагочі кличе вас
        9 - нагодувати тамагочі
        10 - грати з тамагочі в гральні кості
        11 - вимкнути тамагочі (y / n)
        consol
        while true
            begin
                
            rescue StandardError => e
                
            end
            puts 'оберіть варіант: '
            var = STDIN.gets.chomp
            case var.to_i
            when 0 
                puts "life #{tam.life}"
                puts "mood #{tam.mood}"
                puts "sleep #{tam.sleep_t}"
                puts "hunger #{tam.hunger}" 
                puts "toilet #{tam.toilet}"
                puts "smart #{tam.smart}"

            when 1
                tam.stroll
                puts "#{tam.name} вже награвся"
                puts '*' * 50
                next

            when 2
                if tam.sleep_t != 0
                  tam.dream
                  puts "#{tam.name} вже прокынувся"
                  puts '*' * 50 
                else
                  puts "Я не хочу спати"
                end
                next

            when 3
                tam.game
                puts "#{tam.name} вже награвся"
                puts '*' * 50 
                next

            when 4
                tam.study
                puts "#{tam.name} вже зробыв уроки"
                puts '*' * 50 
                next

            when 5
                tam.cleaning
                puts "#{tam.name} вже прибрано у кімнаті"
                puts '*' * 50 
                next

            when 6
                tam.go_to_the_toilet
                puts "#{tam.name} вже сходив в туалет"
                puts '*' * 50 
                next

            when 7
                tam.listen_to_music
                puts "#{tam.name} вже послухав музику"
                puts '*' * 50 
                next
            when 8
                tam.call_the_owner
                puts "#{tam.name} дуже веселий"
                puts '*' * 50 
                next
            when 9
                tam.feed
                puts "#{tam.name} вже наївся"
                puts '*' * 50 
                next

            when 10
                tam.play_with_the_owner
                puts "#{tam.name} дуже радий що ми пограли разом"
                puts '*' * 50 
                next

            when 11
                puts 'натисніть y / n для виходу:'
                ex_t = STDIN.gets.chomp.to_s

                if ex_t.to_s == "yes".upcase || "y".upcase
                    puts 'вимкнули тамагочи.'
                    break
                elsif ex_t.to_s == "no".upcase || "n".upcase
                    next
                else
                    puts 'ведена невірна команда.'
                    next
                end
            else
                puts 'ввели невірну Команду'
                next
            end
        end
    end
end


if __FILE__ == $0
    menu  
end
