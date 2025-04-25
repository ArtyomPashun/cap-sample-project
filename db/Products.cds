namespace com.sample.app.dm;

using {cuid, managed} from '@sap/cds/common';
using {com.sample.app.dm.ProductTypes} from './ProductTypes';

entity Products: cuid, managed {
    name : String(100);
    description : String(500);
    price : Decimal(10,2);
    ProductType : Association to ProductTypes;
}