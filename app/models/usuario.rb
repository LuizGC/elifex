class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :nome, :facebook_link
  # attr_accessible :title, :body
	
	has_many :authentications, :dependent =>  :delete_all
	validates_uniqueness_of :facebook_link, :email
	
	def facebook
		@facebook ||= FbGraph::User.me(self.authentications.first.token)
	end
	
	def apply_changes(auth)
		self.email = auth['info']['email']
		self.nome = auth['extra']['raw_info']['name']
		self.facebook_link = auth['extra']['raw_info']['link']
	end
	
	def apply_omniauth(auth)
		# In previous omniauth, 'user_info' was used in place of 'raw_info'
		self.apply_changes(auth)
		# Again, saving token is optional. If you haven't created the column in authentications table, this will fail
		authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
	end
end
