namespace com.sample.app.srv;

using {com.sample.app.dm as dm} from '../../db';

service OrdersService {
    entity PurchaseOrders as projection on dm.PurchaseOrders;
    entity OrderItems as projection on dm.OrderItems;
}