class CreateDilemmas < ActiveRecord::Migration
  def change
    create_table :dilemmas do |t|
      t.integer :id
      t.string :uuid, :limit => 36
      t.string :title
      t.text :dilemma
      t.string :status
      t.string :ans_opt

      t.timestamps
    end
  end
end
