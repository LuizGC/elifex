class Cupom < ActiveRecord::Base
  attr_accessible :premio_id, :usuario_id
	
	belongs_to :usuario
	belongs_to :premio
	
	validates_uniqueness_of :usuario_id, :scope => :premio_id
end
