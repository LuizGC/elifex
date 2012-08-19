class Premio < ActiveRecord::Base
  attr_accessible :info, :nome, :valor, :disponivel
	
	validates_presence_of :nome, :valor, :disponivel
	has_many :cupons, :dependent =>  :delete_all
end
