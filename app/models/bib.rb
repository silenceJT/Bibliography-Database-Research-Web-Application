class Bib
  include Mongoid::Document
  include Mongoid::FullTextSearch
  store_in collection: "testCollection", database: "test"
  field :author, type: String
  field :year, type: String
  field :title, type: String
  field :publication, type: String
  field :publisher, type: String
  field :biblio_name, type: String
  field :language_published, type: String
  field :language_researched, type: String
  field :country_of_research, type: String
  field :keywords, type: String
  field :isbn, type: String
  field :issn, type: String
  field :url, type: String
  field :date_of_entry, type: String

  fulltext_search_in :author, :year, :title, :publication,                              :publisher, :biblio_name, :language_published,                      :language_researched, :country_of_research,                        :keywords, :isbn, :issn, :url, :date_of_entry

  def any
      [author, year, title, publication, publisher, biblio_name, language_published, language_researched, country_of_research, keywords, isbn, issn, url, date_of_entry].join(' ')
  end
  
  fulltext_search_in :name
    
  def self.search(search_form, search)
    if search
        if search_form.to_s == "Any".to_s
            Bib.any_of({author: /#{search}/}, 
                       {title: /#{search}/}, 
                       {publication: /#{search}/})
        elsif search_form.to_s == "Author".to_s 
            #all.select {|b| b.author.include?(search)}
            Bib.where(author: /#{search}/)
        elsif search_form.to_s == "Title".to_s
            #all.select {|b| b.title.include?(search)}
            Bib.where(title: /#{search}/)
        elsif search_form.to_s == "Publication".to_s
            #all.select {|b| b.publication.include?(search)}
            Bib.where(publication: /#{search}/)
        end
    else
        all
    end
  end
    
      
end
