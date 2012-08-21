class Premio < ActiveRecord::Base
  attr_accessible :info, :nome, :valor, :disponivel
	
	validates_presence_of :nome, :valor, :disponivel
	has_many :cupons, :dependent =>  :delete_all
	
	def image
		if(File.exist?("#{Rails.root}/app/assets/images/premio#{self.id}.jpg"))
			"premio#{self.id}.jpg"
			else
			"premio.jpg"
		end
	end

end
