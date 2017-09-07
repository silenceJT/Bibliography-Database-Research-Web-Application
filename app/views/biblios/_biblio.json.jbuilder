json.extract! biblio, :id, :author, :year, :title, :publication, :publisher, :biblio_name, :language_published, :language_researched, :country_of_research, :keywords, :isbn, :issn, :url, :date_of_entry, :created_at, :updated_at
json.url biblio_url(biblio, format: :json)
