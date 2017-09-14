require 'test_helper'

class BibsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bib = bibs(:one)
  end

  test "should get index" do
    get bibs_url
    assert_response :success
  end

  test "should get new" do
    get new_bib_url
    assert_response :success
  end

  test "should create bib" do
    assert_difference('Bib.count') do
      post bibs_url, params: { bib: { author: @bib.author, biblio_name: @bib.biblio_name, country_of_research: @bib.country_of_research, date_of_entry: @bib.date_of_entry, isbn: @bib.isbn, issn: @bib.issn, keywords: @bib.keywords, language_published: @bib.language_published, language_researched: @bib.language_researched, publication: @bib.publication, publisher: @bib.publisher, title: @bib.title, url: @bib.url, year: @bib.year } }
    end

    assert_redirected_to bib_url(Bib.last)
  end

  test "should show bib" do
    get bib_url(@bib)
    assert_response :success
  end

  test "should get edit" do
    get edit_bib_url(@bib)
    assert_response :success
  end

  test "should update bib" do
    patch bib_url(@bib), params: { bib: { author: @bib.author, biblio_name: @bib.biblio_name, country_of_research: @bib.country_of_research, date_of_entry: @bib.date_of_entry, isbn: @bib.isbn, issn: @bib.issn, keywords: @bib.keywords, language_published: @bib.language_published, language_researched: @bib.language_researched, publication: @bib.publication, publisher: @bib.publisher, title: @bib.title, url: @bib.url, year: @bib.year } }
    assert_redirected_to bib_url(@bib)
  end

  test "should destroy bib" do
    assert_difference('Bib.count', -1) do
      delete bib_url(@bib)
    end

    assert_redirected_to bibs_url
  end
end
