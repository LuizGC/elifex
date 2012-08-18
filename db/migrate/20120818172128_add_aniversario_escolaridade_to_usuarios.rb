class AddAniversarioEscolaridadeToUsuarios < ActiveRecord::Migration
  def change
		add_column :usuarios, :aniversario, :date
		add_column :usuarios, :escolaridade, :string
  end
end
