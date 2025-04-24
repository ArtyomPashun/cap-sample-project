namespace com.sample.app;

using {cuid, managed} from '@sap/cds/common';

entity Products: cuid, managed {
    name : String(100);
    description : String(500);
    price : Decimal(10,2);
}