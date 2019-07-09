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
        iex> Fatura.criar_fatura()
        ["Telefone", "Luz", "Agua "]
  """
  def criar_fatura() do
    ["Telefone", "Luz", "Agua "]
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
end
