package Encje;


import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class OrderDAO  extends EntityDao<Orders>{
    public OrderDAO() {
        super(Orders.class);
    }
}
