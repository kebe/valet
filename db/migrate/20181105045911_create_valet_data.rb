class CreateValetData < ActiveRecord::Migration[5.1]
  def change
    create_table :valet_data do |t|
      t.string :ticket
      t.datetime :requested
      t.datetime :accepted
      t.datetime :assigned
      t.datetime :completed
      t.string :description

      t.timestamps
    end
  end
end
