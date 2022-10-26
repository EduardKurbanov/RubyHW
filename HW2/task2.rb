class Pet
	attr_reader :name, :life, :mood, :sleep_t, :hunger, :toilet, :score
	def initialize(name)
		@name = name
		@life = 10
		@mood = rand(3..10)
		@sleep_t = rand(3..10)
		@hunger = rand(3..10)
		@toilet = rand(3..10)
		@score = rand(3..10)
	end

#-----------------------
	def stroll
		puts "ви гуляете з #{@name}"
		puts "він дуже веселий"
		passage_of_time
        examination(@life, "показник здоров'я", 10)
		examination(@mood, "показник настрою", 10)
		examination(@sleep_t, "показник cну", 5)
		examination(@hunger, "показник голоду", -5)
		examination(@hunger, "показник втоми", 5)
						
	end

	def dream
		puts "#{@name} йде спати"
		puts 'zzz-z-zzzzz--z-zz'
		passage_of_time
		examination(@life,"показник здоров'я", 10)
		examination(@sleep_,"показник сну", -10 )
		examination(@score, "показник втома", -10 )		
	end

	def game
		puts "#{@name} граеця з м'ячем"
		puts "ганяе по полю"
		passage_of_time
		examination(@life, "показник здоров'я", 10)
		examination(@sleep_, "показник сну", 5 )
		examination(@hunger, "показник голоду", -5)
		examination(@score, "показник втома", 5 )		
	end

	def study
		puts "#{name} навчаеться"
		puts "бла бля 2+2 = ?"
		passage_of_time
		examination(@life, "показник здоров'я", -1)
		examination(@sleep_,"показник сну", 3 )
		examination(@score, "показник втома", 7 )
		examination(@toilet, "показник туалет", 5)		
	end

	def cleaning
		puts "прибирае в кимнаті #{name}"
		puts 'вже все прибрано'
		passage_of_time
		examination(@sleep_,"показник сну", 3 )
		examination(@score, "показник втома", 4 )
	end

	def go_to_the_toilet
		puts "сходити до туалету"
		passage_of_time
		examination(@mood, "показник настрою", 3)
		examination(@toilet, "показник туалет", -10)	
	end

	def listen_to_music
		puts "#{name} слухае музику"
		puts <<-Music 
		|-----------------|
		| oooo AC/DC oooo |
		|-----------------|
		Music
		passage_of_time
		examination(@mood, "показник настрою", 10 )		
	end

	def call_the_owner
		puts "#{name} вас кличе"
		random_s = ["я хочу їсти", "я хочу в туалет", "я хочу гулять"].sample
#		random_s = ["i want to eat", "I want to go to the toilet", "I want to go for a walk"].sample
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
		passage_of_time
        examination(@life, "показник здоров'я", 6)
		examination(@mood, "показник настрою", 10)
		examination(@sleep_t, "показник cну", 5)
		examination(@hunger, "показник голоду", -7)
		examination(@hunger, "показник втоми", -3)
	end

	def play_with_the_owner
		puts "ви гуляєте з #{name} в гральни кістки"
		passage_of_time
		examination(@mood, "показник настрою", 10)
	end
#-------------------------
	private
	def passage_of_time
		sleep(5)
	end

	def examination(arg, text, level)
		if (arg).abs == 10
			puts "#{text} #{arg}"
		elsif (arg).abs <= 10 or (arg).abs >= 1
			arg += level
			puts "#{text} + #{arg}"			
		end	
	end			

	
end

class Munu < Pet
end

def menu
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
	5 - тамагочі прибирае кімнату
	6 - тамагочі іде в туалет
	7 - тамагочі слухае музику
	8 - тамагочі кличе вас
	9 - нагодувати тамагочі
	10 - грати з тамагочі в гральні кості
	11 - вимкнути тамагочі (y / n)
	consol
	puts 'оберіть варіант: '
	while true
	puts 'оберіть варіант: '	
		var = STDIN.gets.chomp
		case var.to_i
		when 0 
			puts "life #{tam.life}"
			puts "mood #{tam.mood}"
			puts "sleep #{tam.sleep_t}"
			puts "hunger #{tam.hunger}" 
			puts "toilet #{tam.toilet}"
			puts "score #{tam.score}"

		when 1
			tam.stroll
			puts "#{tam.name} вже на грався"
			puts '*' * 50
			next

		when 2
			tam.dream
			puts "#{tam.name} вже прокынувся"
			puts '*' * 50 
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
			puts "#{tam.name} вже прибрав кімнату"
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
			puts 'ввели невірну соманду'
			next
		end
	end
end


if __FILE__ == $0
	menu  
end
