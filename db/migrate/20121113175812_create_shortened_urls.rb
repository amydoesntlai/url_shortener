class CreateShortenedUrls < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.string :original_url
      t.string :new_url
      t.integer :visit_count

      t.timestamps
    end
  end
end
