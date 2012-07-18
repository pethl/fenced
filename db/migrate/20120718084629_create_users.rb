class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email
      t.string :twittername
      t.string :yob

      t.timestamps
    end
  end
end
