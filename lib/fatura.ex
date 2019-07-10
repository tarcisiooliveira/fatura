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
    Ao receber `criar_faturas` retorna um array de faturas
      ## Examples
         
  """
  def criar_faturas(faturas, vencimentos) do
    for vencimento <- vencimentos, fatura <- faturas  do
      "Fatura #{fatura} com vencimento no dia: #{vencimento}"
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
    #question symbol means how will return a boolena value
    Enum.member?(faturas, fatura)
  end





end
