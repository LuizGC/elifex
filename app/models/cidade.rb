class Cidade < ActiveRecord::Base
  attr_accessible :estado, :nome
	
	validates_uniqueness_of :nome
	validates_presence_of :nome, :estado
	has_many :empresas

end