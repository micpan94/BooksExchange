package Encje;

import javax.enterprise.context.ApplicationScoped;
import javax.swing.text.html.parser.Entity;

@ApplicationScoped
public class OrderDAO extends EntityDao<Order> {
    public OrderDAO(){
        super(Order.class);
    }
}
