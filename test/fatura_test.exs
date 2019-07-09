defmodule FaturaTest do
  use ExUnit.Case
  doctest Fatura

  test "deve criar uma lista de faturas" do
    faturas = Fatura.criar_fatura(["Telefone", "Luz", "Agua"])
    assert faturas == ["Telefone", "Luz", "Agua"]
  end

  test "dve ordenar uma lista de faturas" do
    faturas = Fatura.ordenar_fatura(["Telefone", "Luz", "Agua"])
    refute faturas == ["Telefone", "Luz", "Agua"]
  end



end
