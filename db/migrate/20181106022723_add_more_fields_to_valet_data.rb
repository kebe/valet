class AddMoreFieldsToValetData < ActiveRecord::Migration[5.1]
  def change
  	 add_column :valet_data, :number_of_cars_now, :integer
  	 add_column :valet_data, :month, :integer
  	 add_column :valet_data, :week, :integer
  	 add_column :valet_data, :hour, :integer
  	 add_column :valet_data, :time_timestamp, :timestamp
  end
end
