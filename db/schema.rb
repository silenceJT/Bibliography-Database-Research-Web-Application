# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170906091325) do

  create_table "biblios", force: :cascade do |t|
    t.string "author"
    t.string "year"
    t.string "title"
    t.string "publication"
    t.string "publisher"
    t.string "biblio_name"
    t.string "language_published"
    t.string "language_researched"
    t.string "country_of_research"
    t.string "keywords"
    t.string "isbn"
    t.string "issn"
    t.string "url"
    t.string "date_of_entry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
