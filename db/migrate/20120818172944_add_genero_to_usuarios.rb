class AddGeneroToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :genero, :string
  end
end
