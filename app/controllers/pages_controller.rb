class PagesController < ApplicationController

  require 'open-uri'
  require 'nokogiri'

  def home
    @plants = Plant.all
    @symptoms = Symptom.all
    @tipos = Tipo.all
  end

  def contact
    @tel = "0635158132"
  end

  def about
    @text = "Este site foi inspirado da obra de Harri Lorenzi e F.J.
    Abreu Matos: 'Plantas Medicinais no Brasil, Nativas e Exóticas, 2nda edição.'
    Foi um privilegio de reunir todas as informações preciosas deste livro
    e uma trabalho feliz de criar este conteúdo a disposicao do grande publico.
    Agradeço ao conhecimento que me foi devolvido atraves deste livro e parabenizo a obra mais uma vez.
    Anthony, WebDesigner - Lite Services"
  end
end
