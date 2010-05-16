require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  
  test "polymorphic association works" do
    article = Article.new(:content=>'This is my new article')
    catalog_entry = CatalogEntry.new(:name=>'Article One', :acquired_at=>Time.now)
    catalog_entry.resource = article
    catalog_entry.save!
    
    c = CatalogEntry.find(catalog_entry.id)
    assert_equal(article.id, c.article.id)
  end
end
