# defmodule DictionaryStruct do
#   defstruct name: "", value: ""
#
#   def populate(<<name::string, value::string>>) do
#     %__MODULE__{
#       name: name,
#       value: value
#     }
#   end
#
# end
#
# defmodule Maru.Types.Dictionary do
#   use Maru.Type
#
#   def parse("name", _) do: |> DictionaryStruct.populate
#   def parse("value", _) do: |> DictionaryStruct.populate
#
# end
