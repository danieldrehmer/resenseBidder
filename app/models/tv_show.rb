class TvShow < ApplicationRecord
	serialize :airtime, Hash

	@@discount_factor = 2


	def name
		self[:name].titleize
	end


	def self.setTimes
		# Use essa função pra ajudar a preencher os horarios dos programas no console. 
		# Uma vez que você rodar ela, vai ter que preencher todos, de um a um, até o final.


		TvShow.all.each do |s|

			template = {:start => [0,0], :end => [0,0]}

			print "Que horas começa o programa #{s.name}? Ex: 23:00 -> " 

			input = gets.strip.split(":")

			template[:start][0] = input[0].to_i
			template[:start][1] = input[1].to_i

			print "Que horas termina o programa #{s.name}? Ex: 8:59 -> " 

			input2 = gets.strip.split(":")

			template[:end][0] = input2[0].to_i
			template[:end][1] = input2[1].to_i

			s.airtime = template
			s.save

		end

	end

	def self.chrorder

		dataset = []

		iter = 0

		24.times do 
			TvShow.all.each do |s|
				if s.airtime[:start][0] == iter
					dataset << s
				end
			end
			iter = iter + 1
		end

		return dataset
	end

	def self.chrorderHash

		dataset = {}

		iter = 0

		24.times do 
			TvShow.all.each do |s|
				if s.airtime[:start][0] == iter
					dataset[s.id] = s
				end
			end
			iter = iter + 1
		end

		return dataset
	end

	def self.reset_all
		TvShow.all.each do |s|
			cpm = s.cpm


			s.winning_bid1 = s.cpm/@@discount_factor
			s.winning_bid2 = s.cpm/@@discount_factor

			s.winner1 = nil
			s.winner2 = nil

			s.bids_counter = 0

			s.save
		end

		
	end





end
