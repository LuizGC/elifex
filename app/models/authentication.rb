class Authentication < ActiveRecord::Base
  attr_accessible :provider, :token, :uid, :usuario_id
	belongs_to :usuario
	validates_uniqueness_of :token, :uid
end
