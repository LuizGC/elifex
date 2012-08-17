class Empresa < ActiveRecord::Base
  attr_accessible :cidade_id, :info, :nome, :setor_id
	
	validates_presence_of :cidade_id, :nome, :setor_id
	belongs_to :setor
	belongs_to :cidade
end
