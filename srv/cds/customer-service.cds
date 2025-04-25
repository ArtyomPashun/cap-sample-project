namespace com.sample.app.srv;

using {com.sample.app.dm as dm} from '../../db';

service CustomerService {
  entity Customers as projection on dm.Customers;
}
