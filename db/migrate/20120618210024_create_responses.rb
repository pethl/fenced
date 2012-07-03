class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :option
      t.string :yes
      t.string :no
      t.string :user
      t.references :dilemma

      t.timestamps
    end
    add_index :responses, :dilemma_id
  end
end
