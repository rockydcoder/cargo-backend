defmodule Maru.Types.Capacity do
  use Maru.Type
  use Ecto.Schema

end

defmodule Volume do
  @derive [Poison.Encoder]
  defstruct [:length, :breadth, :height]
end
