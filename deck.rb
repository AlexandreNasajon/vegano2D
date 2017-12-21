# encoding: UTF-8
require 'squib'
version  = 'v0.2'
Squib::Deck.new(cards: 20, layout: ['layout.yml']) do
  background color: :white
  rect layout: 'cut'
  rect layout: 'safe'
  data = csv file: 'Veganismo - Animais.csv'
  text str: data['Nome'].map!{|x| x.force_encoding(::Encoding::UTF_8)}, layout: 'title', font:'Arial 60'
  text str: data['Ambiente'].map!{|x| x.force_encoding(::Encoding::UTF_8)}, layout: 'description', font:'Arial 50'
  text str: data['Valor'], layout: 'bonus1', font:'Arial bold 96'
  text str: data['Desc'].map!{|x| x.force_encoding(::Encoding::UTF_8)}, layout: 'snark', font:'Arial italic 24'

  #png layout: 
  png file:data['Espiral'].map!{|x| if x!=nil then 'imagens/icones/'+x end}, layout: 'bonus2'
  png file:data['Nome'].map!{|x| 'imagens/animais/'+x +'.png'}, layout: 'art'
  text str:version, layout: 'bonus5', font:'Arial 24'

  save_pdf file:'animais.pdf',width:'8.3 in',height: '11.7 in', margin: 0

end

Squib::Deck.new(cards: 29, layout: ['layout.yml']) do
  background color: :white
  rect layout: 'cut'
  rect layout: 'safe'
  data = csv file: 'Veganismo - Impactos.csv'
  text str: data['Nome'].map!{|x| x.force_encoding(::Encoding::UTF_8)}, layout: 'name', font:'Arial 60'
  text str: data['Tipo'].map!{|x| x.force_encoding(::Encoding::UTF_8)}, layout: 'subtype', font:'Arial 50'
  #text str: data['Valor'], layout: 'bonus1', font:'Arial bold 96'
  text str: data['Desc'].map!{|x| x.force_encoding(::Encoding::UTF_8)}, layout: 'description', font:'Arial 24'

  #png layout: 
  rect layout: 'bonus1'
  rect layout: 'bonus2'
  rect layout: 'bonus3'
  text str:version, layout: 'bonus5', font:'Arial 24'
  png file:data['Estrela'].map!{|x| if x!=nil then 'imagens/icones/'+x end}, layout: 'bonus1'
  png file:data['Espiral'].map!{|x| if x!=nil then 'imagens/icones/'+x end}, layout: 'bonus2'
  png file:data['Equip'].map!{|x| if x!=nil then 'imagens/icones/'+x end}, layout: 'bonus3'
  png file:data['Img'].map!{|x| 'imagens/impactos/'+x.force_encoding(::Encoding::UTF_8) +'.png'}, layout: 'art'


  save_pdf file:'impactos.pdf',width:'8.3 in',height: '11.7 in', margin: 0

end

