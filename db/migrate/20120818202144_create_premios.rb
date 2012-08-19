class CreatePremios < ActiveRecord::Migration
  def change
    create_table :premios do |t|
      t.string :nome
      t.integer :valor
      t.text :info

      t.timestamps
    end
  end
end
