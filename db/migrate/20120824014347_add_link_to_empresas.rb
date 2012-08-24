class AddLinkToEmpresas < ActiveRecord::Migration
  def change
    add_column :empresas, :link, :string, :null => false, :default => 'javascript:avoid(0);'
  end
end
