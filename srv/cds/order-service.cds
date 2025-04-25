namespace com.sample.app.srv;

using {com.sample.app.dm as dm} from '../../db';

service OrderService {
  entity PurchaseOrders as projection on dm.PurchaseOrders;
  entity OrderItems as projection on dm.OrderItems;
  entity Products as projection on dm.Products;
  entity Customers as projection on dm.Customers;
  entity ProductTypes as projection on dm.ProductTypes;

  action approve() returns PurchaseOrders;

  function calcDiscount() returns Decimal(10,2);
}