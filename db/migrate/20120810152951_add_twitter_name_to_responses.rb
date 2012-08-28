class AddTwitterNameToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :twitter_name, :string
  end
end
