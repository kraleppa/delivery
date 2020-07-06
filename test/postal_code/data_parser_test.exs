defmodule PostalCode.DataParserTest do
  use ExUnit.Case
  alias PostalCode.DataParser
  doctest Delivery

  test "parse_data" do
    data_rows = DataParser.parse_data()
    IO.inspect(length(data_rows))
  end

end
