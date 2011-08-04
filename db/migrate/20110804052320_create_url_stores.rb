class CreateUrlStores < ActiveRecord::Migration
  def self.up
    create_table :url_stores do |t|
      t.column :replace_string, :string
      t.column :replace_url, :string
    end
  end

  def self.down
    drop_table :url_stores
  end
end
