# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :inicio, 'Inicio', empresas_path
    primary.item :sobre, 'Sobre', page_path("sobre")
		primary.item :logout, 'Sair',usuario_session_path, :method => :delete, :if => Proc.new { usuario_signed_in? }
  end

end
