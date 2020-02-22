package Encje;


import javax.enterprise.context.ApplicationScoped;
import java.util.Collection;

@ApplicationScoped
public class ShopppingCardDAO extends EntityDao<ShoppingCard>{
    public ShopppingCardDAO() {
        super(ShoppingCard.class);
    }


}
