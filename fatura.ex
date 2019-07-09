defmodule Fatura do
  @moduledoc """
  Documentation for Fatura.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Fatura.hello()
      :world

  """
  def hello do
    "asdasd"
  end

  def criar_fatura() do
    ["Telefone","Luz", "Agua"]
  end

  def ordenar_fatura(faturas) do
    Enum.sort(faturas)
  end
end
