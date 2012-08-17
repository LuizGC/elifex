class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nome
      t.text :info
      t.integer :setor_id
      t.integer :cidade_id

      t.timestamps
    end
		add_index(:empresas, :setor_id)
		add_index(:empresas, :cidade_id)
  end
end
