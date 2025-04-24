namespace com.sample.app.dm;

using {cuid, managed} from '@sap/cds/common';
using {com.sample.app.dm.PurchaseOrders} from './PurchaseOrders';

entity Customers: cuid, managed {
      name : String(100);
      email : String(100);
      phone : String(20);
      address : String(200);
      orders  : Association to many PurchaseOrders on orders.customer = $self;
}