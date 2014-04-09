class OnlyUsingMorphScrapers < ActiveRecord::Migration
  def up
    remove_column :authorities, :feed_url
    remove_column :authorities, :scraperwiki_name
  end

  def down
    add_column :authorities, :feed_url, :string
    add_column :authorities, :scraperwiki_name, :string
  end
end
