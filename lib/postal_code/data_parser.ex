defmodule PostalCode.DataParser do
  @data_file "data/data.txt"

  def parse_data do
    [_ | data] = File.read!(@data_file) |> String.split("\n")
    data
    |> Enum.map(fn (row) -> String.split(row, "\t") end)
    |> Enum.filter(fn (row) -> length(row) == 7 end)
    |> Enum.map(fn ([postal_code, _, _, _, _, lat, long]) -> [postal_code, lat, long] end)
    |> Enum.map(fn ([postal_code, lat, long]) ->
      float_lat = String.replace(lat, " ", "") |> String.to_float
      float_long = String.replace(long, " ", "") |> String.to_float
      {postal_code, {float_lat, float_long}} end)
    |> Enum.into(%{})
  end
end
