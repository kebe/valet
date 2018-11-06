class AddFieldsToValetData < ActiveRecord::Migration[5.1]
  def change
  	add_column :valet_data, :day_of_week, :string
  	add_column :valet_data, :time_of_service, :time
  end
end
