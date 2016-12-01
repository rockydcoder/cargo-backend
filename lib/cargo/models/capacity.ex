defmodule Maru.Types.Capacity do
  use Maru.Type

end

defmodule Volume do
  @derive [Poison.Encoder]
  defstruct [:length, :breadth, :height]
end
