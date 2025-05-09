namespace com.sample.app.dm;

using {cuid, managed} from '@sap/cds/common';
using {com.sample.app.dm.Customers} from './Customers';
using {com.sample.app.dm.OrderItems} from './OrderItems';

entity PurchaseOrders : cuid, managed {
    createdAt : DateTime;
    status : String(20);
    totalAmount : Decimal(10,2);
    approved: Boolean default false;
    Customer : Association to Customers;
    OrderItems : Composition of many OrderItems on OrderItems.PurchaseOrders = $self;
    virtual taxAmount : Decimal(10,2);
}