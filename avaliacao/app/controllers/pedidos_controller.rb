class PedidosController < ApplicationController

  def index
    @pedido = Pedido.new
  end
  
  def index_do
    # Metodo de classe para gravar conteudo do formulário
    Pedido.inserir_pedidos(params[:pedido])
    @pedidos = Pedido.all
    @valor_total_pedidos = @pedidos.inject(0){|total, pedido| total = total + pedido.valor_total}
  end
end
