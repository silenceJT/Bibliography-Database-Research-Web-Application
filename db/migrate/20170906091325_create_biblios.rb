class CreateBiblios < ActiveRecord::Migration[5.1]
  def change
    create_table :biblios do |t|
      t.string :author
      t.string :year
      t.string :title
      t.string :publication
      t.string :publisher
      t.string :biblio_name
      t.string :language_published
      t.string :language_researched
      t.string :country_of_research
      t.string :keywords
      t.string :isbn
      t.string :issn
      t.string :url
      t.string :date_of_entry

      t.timestamps
    end
  end
end
