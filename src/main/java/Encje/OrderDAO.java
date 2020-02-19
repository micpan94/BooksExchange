package Encje;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.ws.rs.client.Entity;
import java.util.Collection;
import java.util.HashSet;

@ApplicationScoped
public class OrderDAO extends EntityDao<ClientOrder> {
    public OrderDAO(){
        super(ClientOrder.class);
    }
    @Inject
    private ClientDao clientDao;

    public Collection<ClientOrder> getAllOrdersByClientID(Integer id){
        Collection<ClientOrder> orders = new HashSet<>();
        Collection<ClientOrder> allOrders = findAll();
        Client clientId = clientDao.findById(id);

        for (ClientOrder element : allOrders){
            if (element.getClient() == clientId){
                orders.add(element);
            }
        }
        return orders;
    }
}
