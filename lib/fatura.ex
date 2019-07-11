defmodule Fatura do
  @moduledoc """
    Este móduco executamos funcoes de fatura.
  """

  @doc """
    Retorna a frase de boas vindas para o usuário
      ## Examples
        iex> Fatura.hello()
        "Bem Vindo Usuario"
  """
  def hello() do
    "Bem Vindo Usuario"
  end

  @doc """
    Ao receber `fatura` retorna um array de faturas
      ## Examples
        iex> Fatura.criar_fatura(["Telefone", "Luz", "Agua"])
        ["Telefone", "Luz", "Agua"]

        iex> Fatura.criar_fatura("bola")
        "bola"  
  """
  def criar_fatura(fatura) do
    fatura
  end

  @doc """
    A função `criar_faturas` recebe duas listas de faturas e vencimentos e retorna 
    uma estrutura de Fatura.Conta
      ## Examples
         
  """
  def criar_faturas(faturas, vencimentos) do
    for vencimento <- vencimentos, fatura <- faturas do
      %Fatura.Conta{vencimento: vencimento, fatura: fatura }
    end
  end

  @doc """
    Ao receber uma lista de faturas, entrega ordenada.
      ## Examples
        iex> Fatura.ordenar_fatura(["Telefone", "Luz", "Agua"])
        ["Agua", "Luz", "Telefone"]
  """
  def ordenar_fatura(faturas) do
    Enum.sort(faturas)
  end

  @doc """
    Procura sem existe uma `fatura` em uma lista de `faturas`

      ## Examples
        iex> Fatura.fatura_existe?(["Telefone", "Luz", "Agua"],"Luz")
        true

        iex> Fatura.fatura_existe?(["Telefone", "Luz", "Agua"],"internet")
        false

  """
  def fatura_existe?(faturas, fatura) do
    # question symbol means how will return a boolena value
    Enum.member?(faturas, fatura)
  end

  @doc """
    Exemplo de criação de arquivo com uma lista dentro
      ## Examples
        iex> arquivo=Fatura.criar_fatura(["Telefone", "Luz", "Agua"])
        iex> Fatura.save("bill_to_pay",arquivo)
        :ok
  """
  def save(filename, faturas) do
    binary = :erlang.term_to_binary(faturas)
    File.write(filename, binary)
  end

  @doc """
      Quando encontrar uma fatura
        ## Examples
          iex>  arquivo=Fatura.criar_fatura(["Telefone", "Luz", "Agua"])
          iex>  Fatura.save("bill_to_pay",arquivo)
          :ok
          iex>  Fatura.loadfile("bill_to_pay")
          ["Telefone", "Luz", "Agua"]
          
          iex>  arquivo=Fatura.criar_fatura(["Telefone", "Luz", "Agua"])
          iex>  Fatura.save("bill_to_pay",arquivo)
          :ok
          iex>  Fatura.loadfile("filenotexist")
          "File no found"
  """
  def loadfile(filename) do
    {status, binary} = File.read(filename)

    case status do
      :ok -> printbinaryfile(binary)
      :error -> "File no found"
    end
  end

  defp printbinaryfile(file) do
    :erlang.binary_to_term(file)
  end
end
