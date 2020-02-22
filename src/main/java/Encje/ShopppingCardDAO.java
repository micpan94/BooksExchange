package Encje;


import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class ShopppingCardDAO extends EntityDao<ShoppingCard>{
    public ShopppingCardDAO() {
        super(ShoppingCard.class);
    }
}
