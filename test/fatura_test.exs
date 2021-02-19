defmodule FaturaTest do
  use ExUnit.Case
  doctest Fatura

  test "deve criar uma lista de fatura estatica" do
    faturas = Fatura.criar_faturas(["Telefone", "Luz"], [5,9])
    assert faturas == [
      %Fatura.Conta{fatura: "Telefone", vencimento: 5},
      %Fatura.Conta{fatura: "Luz", vencimento: 5},
      %Fatura.Conta{fatura: "Telefone", vencimento: 9},
      %Fatura.Conta{fatura: "Luz", vencimento: 9},
      ]
  end

  test "deve criar uma lista de faturas dinamica" do
    faturas = Fatura.criar_faturas(["Telefone", "Luz"], [5,9])
    assert faturas == [
      %Fatura.Conta{fatura: "Telefone", vencimento: 5},
      %Fatura.Conta{fatura: "Luz", vencimento: 5},
      %Fatura.Conta{fatura: "Telefone", vencimento: 9},
      %Fatura.Conta{fatura: "Luz", vencimento: 9},
      ]


  end

  test "deve ordenar uma lista de faturas" do
    faturas = Fatura.sort_bill(["Telefone", "Luz", "Agua"])
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
