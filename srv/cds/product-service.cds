namespace com.sample.app.srv;

using {com.sample.app.dm as dm} from '../../db';

service ProductService {
  entity Products as projection on dm.Products;
}
