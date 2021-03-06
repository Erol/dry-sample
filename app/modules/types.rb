module Types
  types = Dry::Types

  String = types['coercible.string']
  Number = types['strict.integer'] | types['strict.decimal'] | types['params.decimal'] | types['any']

  PayloadForCreateTransaction =
    Dry.Types().Instance(::PayloadForCreateTransaction) |
    Dry.Types().Constructor(::PayloadForCreateTransaction)
end
