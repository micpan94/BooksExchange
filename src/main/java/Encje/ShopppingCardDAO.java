package Encje;


import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@ApplicationScoped
public class ShopppingCardDAO extends EntityDao<ShoppingCard> {


    public ShopppingCardDAO() {
        super(ShoppingCard.class);
    }

    public Integer getTotalPriceByClientId(Integer id) {
        Collection<ShoppingCard> all = findAll();
        ShoppingCard shoppingCard = null;
        for (ShoppingCard element : all) {
            if (element.getClient().getId() == id) {
                shoppingCard = element;
            }
        }
        List<Book> books = shoppingCard.getBooks();
        Integer result = 0;

        for (Book element : books) {
            result += element.getPrice();
        }
        return result;

    }
    public ShoppingCard getClientCard(Client client){
        Collection<ShoppingCard> all = findAll();
        ShoppingCard result = null;
        for (ShoppingCard element : all){
            if (element.getClient().getId() == client.getId()){
                result = element;
            }
        }
        return result;
    }

    public ShoppingCard deleteFromCArd (Book element, Client client){
        ShoppingCard clientCard = getClientCard(client);
        List<Book> books = clientCard.getBooks();
        books.remove(element);
        ShoppingCard result = new ShoppingCard();
        result.setBooks(books);
        return result;
    }
}
