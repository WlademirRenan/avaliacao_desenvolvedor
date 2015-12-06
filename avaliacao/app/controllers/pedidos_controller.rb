class PedidosController < ApplicationController

  def index
    @pedido = Pedido.new
  end
  
  def index_do
    @pedidos = Pedido.all
  end
end
