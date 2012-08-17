# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :inicio, 'Inicio', root_path
    primary.item :sobre, 'Sobre', page_path("sobre")
  end

end
