package Encje;


import org.hibernate.criterion.Order;

import javax.enterprise.context.ApplicationScoped;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

@ApplicationScoped
public class OrderDAO  extends EntityDao<Orders>{
    public OrderDAO() {
        super(Orders.class);
    }



    public Set<Orders> getAllOrdersByClientID(Integer id){
        Collection<Orders> all = findAll();
        Set<Orders> result = new HashSet<>();

        for (Orders element : all){
            if (element.getClient().getId() == id){
                result.add(element);
            }
        }
        return result;
    }
}
