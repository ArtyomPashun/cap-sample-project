using {com.sample.app.dm as dm} from '../../db';

@path : 'order'
service OrderService {
  entity PurchaseOrders as projection on dm.PurchaseOrders
    actions {
      action approveOrder() returns PurchaseOrders;
    };
  entity OrderItems as projection on dm.OrderItems;
  entity Products as projection on dm.Products;
  entity Customers as projection on dm.Customers;
  entity ProductTypes as projection on dm.ProductTypes;

  function hello (to:String) returns String;
}