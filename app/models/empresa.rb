class Empresa < ActiveRecord::Base
  attr_accessible :cidade_id, :info, :nome, :setor_id
	
	validates_presence_of :cidade_id, :nome, :setor_id
	belongs_to :setor
	belongs_to :cidade
	has_many :avaliacoes, :dependent =>  :delete_all
	
	def quant_avaliacao_is(opcao)
		self.avaliacoes.find_all_by_status(opcao).size
	end
	
	def image
		if(File.exist?("#{Rails.root}/app/assets/images/empresa#{self.id}.jpg"))
			"empresa#{self.id}.jpg"
		else
			"anuncie_aqui.jpg"
		end
	end
end
