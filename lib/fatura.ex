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
    A função `criar_faturas` recebe duas listas de faturas e vencimentos e retorna uma estrutura de `Fatura.Conta`
      ## Examples
        iex>Fatura.criar_faturas(["Telefone", "Luz", "Agua"], [5,9])
        [
        %Fatura.Conta{fatura: "Telefone", vencimento: 5},
        %Fatura.Conta{fatura: "Luz", vencimento: 5},
        %Fatura.Conta{fatura: "Agua", vencimento: 5},
        %Fatura.Conta{fatura: "Telefone", vencimento: 9},
        %Fatura.Conta{fatura: "Luz", vencimento: 9},
        %Fatura.Conta{fatura: "Agua", vencimento: 9}
        ]
  """

  def criar_faturas(faturas, vencimentos) do
    for vencimento <- vencimentos, fatura <- faturas do
      %Fatura.Conta{vencimento: vencimento, fatura: fatura}
    end
  end

  def inicio() do
    lista_faturas = Fatura.criar_faturas(["Telefone", "Luz", "Agua"], [5, 9])
    nova_lista = lista_faturas ++ [%Fatura.Conta{fatura: "Celular", vencimento: 3}]
    Enum.filter(nova_lista, &(&1.fatura == "Luz"))
  end

  @doc """
    Ao receber uma lista de faturas, entrega ordenada.
        ## Examples
          iex> listbill = Fatura.criar_faturas(["Telefone", "Luz", "Agua"], [5,9])
          iex> Fatura.sort_bill(listbill)
          [
            %Fatura.Conta{fatura: "Agua", vencimento: 5},
            %Fatura.Conta{fatura: "Agua", vencimento: 9},
            %Fatura.Conta{fatura: "Luz", vencimento: 5},
            %Fatura.Conta{fatura: "Luz", vencimento: 9},
            %Fatura.Conta{fatura: "Telefone", vencimento: 5},
            %Fatura.Conta{fatura: "Telefone", vencimento: 9}
          ]
  """
  def sort_bill(bill) do
    Enum.sort(bill)
  end

  @doc """
    Procura sem existe uma `fatura` em uma lista de `faturas`

      ## Examples
        iex> Fatura.criar_faturas(["Telefone", "Luz", "Agua"], [5,9]) |> Fatura.fatura_existe?(%Fatura.Conta{fatura: "Agua", vencimento: 9})
        true
        iex> fatura = Fatura.criar_faturas(["Telefone", "Luz", "Agua"], [5,9])
        iex> Fatura.fatura_existe?(fatura, %Fatura.Conta{fatura: "Telefone", vencimento: 5} )
        true
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
    Remove a `fatura` passada no `index`
    Remove `bill` past in `index`
      ## Exemples
        iex>Enum.split([1,2,3,4,5],1)
        {[1], [2, 3, 4, 5]}
  """
  def pay_bill(bill, index) do
    Enum.split(bill, index)
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

  @doc """
      Receive `file_name` and print all data.
        ## Exemples


  """
  def printbinaryfile(file) do
    :erlang.binary_to_term(file)
  end

  @doc """
    Access list bills by index
      ##Example
        iex> Fatura.acess_bill_by_index(Fatura.criar_faturas(["Telefone", "Luz", "Agua"], [5,9]),3)
        {%Fatura.Conta{fatura: "Telefone", vencimento: 9}, 3}
        iex> Fatura.acess_bill_by_index(Fatura.criar_faturas(["Telefone", "Luz", "Agua"], [5,9]),2)
        {%Fatura.Conta{fatura: "Agua", vencimento: 5}, 2}
  """
  def acess_bill_by_index(bills, index) do
    Enum.with_index(bills)
    |> Enum.at(index)
  end
end
