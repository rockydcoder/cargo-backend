defmodule PriceChart do
  @derive [Poison.Encoder]
  defstruct [:vehicleName, :vehicleType, :length, :height, :breadth]
end