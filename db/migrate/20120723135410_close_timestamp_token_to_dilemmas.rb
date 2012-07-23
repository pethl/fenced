class CloseTimestampTokenToDilemmas < ActiveRecord::Migration
  def change
      add_column :dilemmas, :close_timestamp, :datetime
    end
end
