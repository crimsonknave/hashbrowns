object @order
extends "orders/full"
child :customer do
  extends "customers/full"
end
child :destinations do
  extends "destinations/full"
end
