class WelcomeController < ApplicationController
  def index
    @pictures = Picture.landscape.with_taken_at.order("RANDOM()").limit(15).sort_by(&:taken_at)
    @last_pictures = Picture.order("created_at DESC").first(18)
    @quote = [
      "Eixuga'm tiet!",
      "Vull un palito!",
      "Mami, vull besitos!",
      "Tieeeeet!",
      "Penja'm tiet!",
      "M'assec al pal del galliner",
      "Estic remenant la cueta",
      "Papi a que esperes per llençar-me la pilota?",
      "Puc dormir al llit?",
      "Persegueixo els ocells",
      "Soparet!",
      "Juguem?"
    ].sample
  end
end
