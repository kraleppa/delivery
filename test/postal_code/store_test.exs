defmodule Delivery.PostalCode.StoreTest do
  use ExUnit.Case
  alias Delivery.PostalCode.Store
  doctest Delivery

  test "get_coords" do
    Store.start_link()
    {lat, long} = Store.get_coords("32189")
    assert {lat, long} == {29.55014, -81.647738}
  end

end
