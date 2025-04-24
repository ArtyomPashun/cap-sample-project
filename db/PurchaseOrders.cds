namespace com.sample.app;

using {cuid, managed} from '@sap/cds/common';
using {com.sample.app.Customers} from './Customers';
using {com.sample.app.OrderItems} from './OrderItems';

entity PurchaseOrders : cuid, managed {
    createdAt    : DateTime;
    status       : String(20);
    totalAmount  : Decimal(10,2);
    customer: Association to Customers;
    items : Composition of many OrderItems on items.order = $self;
}