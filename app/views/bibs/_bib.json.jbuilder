json.extract! bib, :id, :author, :year, :title, :publication, :publisher, :biblio_name, :language_published, :language_researched, :country_of_research, :keywords, :isbn, :issn, :url, :date_of_entry, :created_at, :updated_at
json.url bib_url(bib, format: :json)
