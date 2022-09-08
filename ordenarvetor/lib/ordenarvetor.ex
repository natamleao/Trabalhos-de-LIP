defmodule Ordenarvetor do
  def ordenar(vetor) when is_list(vetor) do
    passar(classificar(vetor, []), vetor)
  end
  def passar(vetorBolhas, vetorAntigo) when vetorBolhas != vetorAntigo do
    classificar(vetorBolhas, []) |> passar(vetorBolhas)
  end
  def passar(vetorBolhas, vetorAntigo) when vetorBolhas == vetorAntigo do
    vetorBolhas
  end
  def classificar(_lista = [], _acumulador) do
    []
  end
  def classificar([primeiro|[]], acumulador) do
    acumulador ++ [primeiro]
  end
  def classificar([primeiro|[segundo|rabo]], acumulador) do
    [novoPrimeiro, novoSegundo] = troca(primeiro, segundo)
    classificar([novoSegundo|rabo], acumulador ++ [novoPrimeiro])
  end
  defp troca(valor1, valor2) do
    if valor1 <= valor2 do [valor1, valor2] else [valor2, valor1] end
  end
end
IO.inspect Ordenarvetor.ordenar([1, 2, 100, 3, 4, 1, 200, 45, 6, 10])
IO.inspect Ordenarvetor.ordenar([25, 12, 1, 0, 35, 48, 27, 20])
