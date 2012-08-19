class AddDisponivelToPremios < ActiveRecord::Migration
  def change
    add_column :premios, :disponivel, :boolean
  end
end
