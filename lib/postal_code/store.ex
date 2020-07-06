defmodule Delivery.PostalCode.Store do
  use GenServer
  alias Delivery.PostalCode.DataParser

  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: :postal_code_store)
  end

  def init(_) do
    {:ok, DataParser.parse_data}
  end

  def get_coords(postal_code) do
    GenServer.call(:postal_code_store, {:get_coords, postal_code})
  end

  def handle_call({:get_coords, postal_code}, _from, data) do
    {:reply, Map.get(data, postal_code), data}
  end

end
