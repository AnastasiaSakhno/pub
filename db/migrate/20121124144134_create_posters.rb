class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.string :url
      t.string :title
      t.text :context
      t.datetime :approximate_date

      t.timestamps
    end
  end
end
