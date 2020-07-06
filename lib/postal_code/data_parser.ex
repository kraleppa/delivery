defmodule PostalCode.DataParser do
  @data_file "data/data.txt"

  def parse_data do
    [_ | data] = File.read!(@data_file) |> String.split("\n")
    data
    |> Stream.map(&(String.split(&1, "\t")))
    |> Stream.filter(&(length(&1) == 7))
    |> Stream.map(&(column_parse(&1)))
    |> Stream.map(&(coords_parse(&1)))
    |> Enum.into(%{})
  end

  defp column_parse [postal_code, _, _, _, _, lat, long] do
    [postal_code, lat, long]
  end

  defp coords_parse [postal_code, lat, long] do
    float_lat = String.replace(lat, " ", "") |> String.to_float
    float_long = String.replace(long, " ", "") |> String.to_float
    {postal_code, {float_lat, float_long}}
  end
end
