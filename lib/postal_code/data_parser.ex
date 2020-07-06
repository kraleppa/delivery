defmodule PostalCode.DataParser do
  @data_file "data/data.txt"

  def parse_data do
    [_ | data] = File.read!(@data_file) |> String.split("\n")
    data
  end
end
