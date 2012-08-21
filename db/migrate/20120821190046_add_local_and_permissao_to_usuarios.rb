class AddLocalAndPermissaoToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :local, :string
    add_column :usuarios, :permissao, :boolean
  end
end
