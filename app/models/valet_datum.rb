class ValetDatum < ApplicationRecord

	def duration
		(completed - assigned) / 60
	end

	def current_number_of_cars
		ValetDatum.where("requested <= '#{requested}' and completed >=  '#{requested}'").count
	end


	def update_valet_fields
		ValetDatum.all.each do |data|
			data.day_of_week = data.requested.strftime("%A")
			data.time_of_service = data.requested.strftime("%I:%M%p")
			data.time_timestamp = data.requested.to_time.to_i
			data.month = data.requested.month
			data.week = data.requested.strftime('%W')
			data.hour = data.requested.strftime('%H')
			data.number_of_cars_now = data.current_number_of_cars
			data.save
		end
	end

  
	def self.average_number_of_cars(date, *days_of_week, start_time, end_time)
		days_of_week = ['Tuesday', 'Thursday', 'Saturday']
		start_time = "8"
		end_time =  "11"
		#date = DateTime.now - 79

		result = ValetDatum.all
		result = result.where('requested BETWEEN ? AND ?', date.beginning_of_day, date.end_of_day) unless date.nil?

		result = result.where(day_of_week: days_of_week) unless days_of_week.blank?

		result = result.where("hour >= #{start_time} and hour < #{end_time}") unless start_time.blank? or end_time.blank?

		result.average(:number_of_cars_now)
		
	end


	def self.specific_timeframe(num)
		day_specified = DateTime.now.beginning_of_year + num

		data = ValetDatum.where('requested BETWEEN ? AND ?', day_specified.beginning_of_day, day_specified.end_of_day)
		arr = []
		data.each do |datum|
			count = ValetDatum.where("requested <= '#{datum.requested}' and completed >=  '#{datum.requested}'").count
			arr << [datum.requested.strftime("%I:%M%p"), count]
		end
		arr
	end

	def self.import(file)
	  spreadsheet = Roo::Spreadsheet.open(file.path)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header.map(&:downcase), spreadsheet.row(i)].transpose]
	    valet_datum =  new
	    valet_datum.attributes = row.to_hash
	    valet_datum.save!
	  end
	end 
end
