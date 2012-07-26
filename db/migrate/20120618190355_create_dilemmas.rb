class CreateDilemmas < ActiveRecord::Migration
  def change
    create_table :dilemmas do |t|
      t.integer :id
      t.string :uuid, :limit => 36
      t.string :title
      t.text :dilemma
      t.string :status
      t.string :ans_opt
      t.string :shorten_url
      t.datetime :close_timestamp
      
      t.references :user

      t.timestamps
    end
    add_index :dilemmas, [:user_id, :created_at]
  end
end
