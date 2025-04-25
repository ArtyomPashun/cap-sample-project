namespace com.sample.app.dm;

using {cuid, managed} from '@sap/cds/common';
using {com.sample.app.dm.Products} from './Products';
using {com.sample.app.dm.PurchaseOrders} from './PurchaseOrders';

entity OrderItems : cuid, managed {
    quantity : Integer;
    unitPrice : Decimal(10,2);
    product : Association to Products;
    order : Association to PurchaseOrders;
}