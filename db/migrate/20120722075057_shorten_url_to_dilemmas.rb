class ShortenUrlToDilemmas < ActiveRecord::Migration
  def change
      add_column :dilemmas, :shorten_url, :string
    end
end
