class Biblio < ApplicationRecord
  validates :author, presence: true
  validates :year, presence: true
  validates :title, presence: true
  validates :publication, presence: true
  
  VALID_URL_REGEX = /\Ahttps?:\/\/[\S]+\Z/
  validates :url, format: { with: VALID_URL_REGEX }
  VALID_DATE_REGEX = /\A(?<month>\d{1,2})\/(?<day>\d{1,2})\/(?<year>\d{2,4})\Z/
  validates :date_of_entry, format: { with: VALID_DATE_REGEX }
  
  
  searchable do
    text :author
    text :title
    text :publication
    text :publisher
  end
end
