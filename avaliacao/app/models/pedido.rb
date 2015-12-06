class Pedido < ActiveRecord::Base

  def self.inserir_pedidos(params)
    #lendo arquivo
    file = params[:arquivo].read
    # Separando por linhas e forcando a codificao utf-8
    file.force_encoding('utf-8').split("\n").each_with_index do |linha, index|
      # pulando primeira linha que é o cabeçalho
      next if index.eql? 0
      # separando por tabulação
      pedido = linha.split("\t")
      # criando pedido
      novo_pedido = Pedido.new(comprador: pedido[0], descricao: pedido[1], preco_unitario: pedido[2],
      quantidade: pedido[3], endereco: pedido[4], fornecedor: pedido[5], valor_total: (pedido[2].to_f * pedido[3].to_i))
      # gravando novo pedido
      novo_pedido.save
    end
  end
end