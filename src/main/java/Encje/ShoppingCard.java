package Encje;

import javax.persistence.*;
import java.util.List;

@Entity
public class ShoppingCard {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @OneToOne
    private Client client;
    @OneToMany(mappedBy = "shoppingCard",fetch = FetchType.EAGER)
    private List<Book> books;

    public ShoppingCard() {
    }

    public ShoppingCard(Client client, List<Book> books) {
        this.client = client;
        this.books = books;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }
}
