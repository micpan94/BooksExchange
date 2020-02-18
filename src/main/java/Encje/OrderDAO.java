package Encje;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.ws.rs.client.Entity;
import java.util.Collection;
import java.util.HashSet;

@ApplicationScoped
public class OrderDAO extends EntityDao<Order> {
    public OrderDAO(){
        super(Order.class);
    }
    @Inject
    private ClientDao clientDao;

    public Collection<Order> getAllOrdersByClientID(Integer id){
        Collection<Order> orders = new HashSet<>();
        Collection<Order> allOrders = findAll();
        Client clientId = clientDao.findById(id);

        for (Order element : allOrders){
            if (element.getClient() == clientId){
                orders.add(element);
            }
        }
        return orders;
    }
}
