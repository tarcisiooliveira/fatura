defmodule FaturaTest do
  use ExUnit.Case
  doctest Fatura

  test "deve criar uma lista de faturas" do
    faturas = Fatura.criar_fatura(["Telefone", "Luz", "Agua"])
    assert faturas == ["Telefone", "Luz", "Agua"]
  end

  test "deve ordenar uma lista de faturas" do
    faturas = Fatura.ordenar_fatura(["Telefone", "Luz", "Agua"])
    refute faturas == ["Telefone", "Luz", "Agua"]
  end

  test "fatura_existe? ira verificar se existe uma fatura em uma lista de fatura" do
    faturas = Fatura.fatura_existe?(["Telefone", "Luz", "Agua"], "Agua")
    assert faturas == true

  end

  test "other test to fatura_existe to see whats is different " do
    fatura = Fatura.fatura_existe?(["Telefone", "Luz", "Agua"], "Agua")
    refute fatura == false
  end
 
end
