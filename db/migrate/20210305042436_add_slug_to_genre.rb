class AddSlugToGenre < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :slug, :string
  end
end
