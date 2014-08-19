class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :list
      t.string :name
      
      
      t.timestamps
    end
  end
end
