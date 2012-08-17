class Setor < ActiveRecord::Base
  attr_accessible :nome
	
	validates_uniqueness_of :nome
	validates_presence_of :nome
	has_many :empresas
	
end
