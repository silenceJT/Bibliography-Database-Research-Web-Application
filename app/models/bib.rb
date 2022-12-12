class Bib
  include Mongoid::Document
  include Mongoid::FullTextSearch
  #store_in collection: "testCollection", database: "test"
  #store_in collection: "biblio", database: "test"
  store_in collection: "biblio_200419", database: "test"
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
  field :source, type: String
  field :language_family, type: String


  Indo_European = "Spanish, English, Swedish, Hindustani, Portuguese, Bengali, Russian, Punjabi, German, French, Persian"

  Sino_Tibetan = "Chinese, Mandarin, Karen, Tibetan, Burmese"

  Afroasiatic = "Arabic, Hausa, Oromo, Amharic, Somali, Hebrew, Tigrinya, Kabyle"

  Nilo_Saharan = "Luo, Kanuri, Songhay, Teso, Nubian, Lugbara, Lango, Dinka, Acholi, Nuer, Maasai, Nhambay"

  Niger_Congo = "Kordofanian, Dogon, Mande, Atlantic, Kru, Senufo, Gur, Adamawa, Kwa, Volta, Bantu"

  Austronesian = "Cebuano, Tagalog, Ilocano, Hiligaynon, Bicol, Philippines, Malay, Javanese, Japanese, Ryujyuan"
  
  # search_form is filter which contains Any/Author/Title
  def self.search(search_form, search)
    if search
        if search_form.to_s == "Any".to_s
            Bib.any_of({author: /#{search}/i}, 
                       {title: /#{search}/i}, 
                       {publication: /#{search}/i})
        elsif search_form.to_s == "Author".to_s 
            Bib.any_of({author: /#{search}/i})
        elsif search_form.to_s == "Title".to_s
            Bib.any_of({title: /#{search}/i})
        end
    else
      all
    end
  end
    
  def self.to_csv(options = {})
      CSV.generate(options) do |csv|
          csv << column_names
          .each do |bib|
              csv << bib.attributes.values_at(*column_names)
          end
      end
  end

  def next
    self.class.where(:_id.gt => self._id).order_by([[:_id, :asc]]).limit(1).first
  end

  def previous
    self.class.where(:_id.lt => self._id).order_by([[:_id, :desc]]).limit(1).first
  end
  
  # def next
  #   self.class.where("id > ?", id).first
  # end

  # def previous
  #   self.class.where("id < ?", id).last
  # end

end
