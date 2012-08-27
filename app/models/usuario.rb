class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :nome, :facebook_link, :aniversario, :escolaridade, :genero, :local, :permissao
  # attr_accessible :title, :body
	
	has_many :authentications, :dependent =>  :delete_all
	has_many :avaliacoes, :dependent =>  :delete_all
	has_many :cupons, :dependent =>  :delete_all
	validates_uniqueness_of :facebook_link, :email
	
	def facebook
		@facebook ||= FbGraph::User.me(self.authentications.first.token)
	end

	
	def apply_changes(auth)
		self.email = auth['info']['email']
		self.nome = auth['extra']['raw_info']['name']
		self.facebook_link = auth['extra']['raw_info']['link']
		
		unless auth['extra']['raw_info']['gender'].nil?
				self.genero = auth['extra']['raw_info']['gender']
		end
		
		unless auth['extra']['raw_info']['location'].nil?
			self.local = auth['extra']['raw_info']['location']['name']
		end
		
		unless auth['extra']['raw_info']['birthday'].nil?
			self.aniversario = Date.strptime(auth['extra']['raw_info']['birthday'].to_s, '%m/%d/%Y')
		end
		
		unless auth['extra']['raw_info']['education'].nil?
			auth['extra']['raw_info']['education'].each {|value| self.escolaridade = value[:type]}
		end
	end
	
	def apply_omniauth(auth)
		# In previous omniauth, 'user_info' was used in place of 'raw_info'
		self.apply_changes(auth)
		# Again, saving token is optional. If you haven't created the column in authentications table, this will fail
		authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
	end
	
	def has_cupom_of(premio)
		!self.cupons.find_by_premio_id(premio.id).nil?
	end
	
	def pontos
		pontos = self.avaliacoes.size*5;
		self.cupons.each do |cupom|
			pontos -= cupom.premio.valor
		end
		pontos
	end
end
