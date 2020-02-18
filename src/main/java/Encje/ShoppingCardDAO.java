package Encje;

import javax.enterprise.context.ApplicationScoped;
import java.util.*;

@ApplicationScoped
public class ShoppingCardDAO extends EntityDao<ShoppingCard> {
    public ShoppingCardDAO() {
        super(ShoppingCard.class);
    }

    Set<ShoppingCard> getCardByUserId(Integer userId){
        Set<ShoppingCard> cards = new HashSet<>();
        Collection<ShoppingCard> cardCollection = findAll();

        for (ShoppingCard card : cardCollection){
            if (card.getClient().getId() == userId){
                cards.add(card);
            }
        }

        return cards;
    }

}
