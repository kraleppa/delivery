defmodule PostalCode.DataParserTest do
  use ExUnit.Case
  alias PostalCode.DataParser
  doctest Delivery

  test "parse_data" do
    {lat, long} = DataParser.parse_data |> Map.get("32189")
    assert {lat, long} == {29.55014, -81.647738}
  end

end
