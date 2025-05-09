package com.pashuna.cap_sample_project.handlers;


import cds.gen.orderservice.HelloContext;
import cds.gen.orderservice.OrderService_;
import cds.gen.orderservice.PurchaseOrders;
import cds.gen.orderservice.PurchaseOrdersApproveOrderContext;
import cds.gen.orderservice.PurchaseOrders_;
import com.sap.cds.Result;
import com.sap.cds.ql.Select;
import com.sap.cds.ql.Update;
import com.sap.cds.ql.cqn.CqnAnalyzer;
import com.sap.cds.ql.cqn.CqnSelect;
import com.sap.cds.reflect.CdsModel;
import com.sap.cds.services.cds.CdsReadEventContext;
import com.sap.cds.services.cds.CqnService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;
import java.math.BigDecimal;
import org.springframework.stereotype.Component;

@Component
@ServiceName(OrderService_.CDS_NAME)
public class PurchaseOrderHandler implements EventHandler {

  private final CqnAnalyzer cqnAnalyzer;

  private final PersistenceService persistenceService;

  public PurchaseOrderHandler(CdsModel model, PersistenceService persistenceService) {
    this.cqnAnalyzer = CqnAnalyzer.create(model);
    this.persistenceService = persistenceService;
  }

  @After(event = CqnService.EVENT_READ, entity = PurchaseOrders_.CDS_NAME)
  public void calcVirtualField(CdsReadEventContext context) {
    Result result = context.getResult();
    result.stream().forEach(row -> {
      row.put("taxAmount", BigDecimal.TEN);
    });
  }

  @On(event = HelloContext.CDS_NAME)
  public void sayHello(HelloContext context) {
    context.setResult("Hello, " + context.getTo() + "!");
  }

  @On(event = PurchaseOrdersApproveOrderContext.CDS_NAME)
  public void approveOrder(PurchaseOrdersApproveOrderContext context) {
    CqnSelect select = context.getCqn();
    String orderID = (String) cqnAnalyzer.analyze(select).rootKeys().get(PurchaseOrders.ID);
    Result order = persistenceService.run(Select.from(PurchaseOrders_.class).where(purchaseOrders -> purchaseOrders.ID().eq(orderID)));

    PurchaseOrders updatedOrder = order.single(PurchaseOrders.class);
    updatedOrder.setApproved(true);

    persistenceService.run(Update.entity(PurchaseOrders_.class).data(updatedOrder));
    context.setResult(updatedOrder);
  }
}

