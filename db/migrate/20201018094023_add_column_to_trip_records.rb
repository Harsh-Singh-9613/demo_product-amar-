class AddColumnToTripRecords < ActiveRecord::Migration
  def change
    add_column :trip_records, :excavation_done, :boolean, default: true
    add_column :trip_records, :loading_and_trasportaion_done, :boolean, default: true
  end
end
