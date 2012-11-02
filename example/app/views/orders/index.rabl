collection @orders
extends "orders/full"
child :customer do
  extends "customers/full"
end
