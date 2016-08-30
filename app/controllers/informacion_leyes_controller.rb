class InformacionLeyesController < ApplicationController
require "http"
require 'nokogiri'
require 'open-uri'
require 'rexml/document'
require 'net/http'
include REXML
#ley facil
#boton de peticion de ley facil, conforme a la demanda.
#http://www.leychile.cl/Consulta/obtxml?opt=7&idNorma=&idLey=20066

def index
    
    
 @ley= "Esperando busqueda"
    @paisLey="Chile"
     #Persona.where("persona_rut= ?", @prestamo.persona_id)
 #!Infoley.where("numero_ley= ?",  params[:numley])  
 
 
 
 
@ley_buscada = Infoley.find_by(numero_ley:  params[:numley])
if  !@ley_buscada.present?

    #@infoleys = Infoley.all
    @numley= params[:numley].to_s
     
  if @numley.blank?
      @numley="20830"
  end
  
    xml = Net::HTTP.get(URI.parse('http://www.leychile.cl/Consulta/obtxml?opt=7&idNorma=&idLey=' + @numley )) #20066 18290ley existe
    data = Hash.from_xml(xml)
   
   
   

  
  
  xmldoc = Document.new(xml)
  XPath.each(xmldoc, "//Texto") { |e| 
  #puts e.text
  #@ley= "#{e.text}"
  @ley = "#{@ley} : #{e.text}"
  }

    @fecha=data["Norma"]["Identificador"]["fechaPromulgacion"]
    @numero=data["Norma"]["Identificador"]["TiposNumeros"]["TipoNumero"]["Numero"]
    @tipo=data["Norma"]["Identificador"]["TiposNumeros"]["TipoNumero"]["Tipo"]
    @info = data["Norma"]["Identificador"]["fechaPromulgacion"]
    @expl_simp= "Explicacion simplificada leyfacil"
    @proy_ley="proyecto de ley"
    
    Infoley.create(numero_ley:@numero, fecha:@fecha, tipo:@tipo, exp_simpl:@expl_simp, cont_ley:@ley, proy_ley:@proy_ley, pais:@paisLey)

else
    
    if @ley_buscada.pais == "Brazil"
        print "entramos·····#######################################"
       numley = "20660"
        @ley_buscada = Infoley.find_by(numero_ley:  "20660")
       
    end
     @fecha= @ley_buscada.fecha
     @numero= @ley_buscada.numero_ley
     @tipo= @ley_buscada.tipo
     @expl_simp= @ley_buscada.exp_simpl
     @ley= @ley_buscada.cont_ley
  
end  
end





def brazil
    @paisLey="Brazil" 
    
     
@ley_buscada = Infoley.find_by(numero_ley:  params[:numley2])
#if  !@ley_buscada.present?

    #@infoleys = Infoley.all
    @numley= params[:numley2].to_s
     
  if @numley.blank?
      @numley="11652"
  end
  @ano = "2008"
  
    xml = Net::HTTP.get(URI.parse('http://legis.senado.leg.br/dadosabertos/legislacao/lei/' + @numley + "/" + @ano)) #20066 18290ley existe
    data = Hash.from_xml(xml)
   
   
   

  
  
  xmldoc = Document.new(xml)

#tomamos la pagina en bruto
#file = Net::HTTP.get(URI.parse("http://legis.senado.leg.br/legislacao/ListaTextoIntegral.action?id=236051&ampnorma=256999")).to_s
file = Nokogiri::HTML(open 'http://legis.senado.leg.br/legislacao/ListaTextoIntegral.action?id=236051&ampnorma=256999')
@contents = file.to_s






  XPath.each(xmldoc, "//LinkTexto") { 
    |e| 
  #puts e.text
  #@ley= "#{e.text}"
 @ley2 = "#{@ley2} #{e.text}"
 }

    @fecha=data["DetalheNorma"]["Normas"]["Norma"]["DataAssinatura"]
    @numero=data["DetalheNorma"]["Normas"]["Norma"]["Numero"]
    #@tipo=data["Norma"]["Identificador"]["TiposNumeros"]["TipoNumero"]["Tipo"]
    #@info = data["Norma"]["Identificador"]["fechaPromulgacion"]
    @expl_simp= "Explicacion simplificada leyfacil"
    @proy_ley="proyecto de ley"
    
    Infoley.create(numero_ley:@numero, fecha:@fecha, tipo:@tipo, exp_simpl:@expl_simp, cont_ley:@ley, proy_ley:@proy_ley, pais:@paisLey)

#else
    
 #    @fecha= @ley_buscada.fecha
  #   @numero= @ley_buscada.numero_ley
   #  @tipo= @ley_buscada.tipo
    # @expl_simp= @ley_buscada.exp_simpl
     #@ley= @ley_buscada.cont_ley
  
#end  



end



 






end
