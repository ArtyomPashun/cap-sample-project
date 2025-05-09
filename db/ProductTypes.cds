namespace com.sample.app.dm;

using { cuid, managed } from '@sap/cds/common';
using {com.sample.app.dm.Products} from './Products';

entity ProductTypes : cuid, managed {
    name        : String(100);
    description : String(500);
    Products    : Composition of many Products on Products.ProductType = $self;
}
