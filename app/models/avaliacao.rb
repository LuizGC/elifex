class Avaliacao < ActiveRecord::Base
  attr_accessible :empresa_id, :status, :usuario_id
	
	belongs_to :usuario
	belongs_to :empresa
	
	validates_uniqueness_of :usuario_id, :scope => :empresa_id
end
