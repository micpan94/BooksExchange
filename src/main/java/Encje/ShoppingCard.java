package Encje;

import javax.persistence.*;
import java.util.Set;

@Entity
public class ShoppingCard {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer Id;
    @OneToMany
    Set<Book> books;
    @ManyToOne(fetch = FetchType.EAGER)
    Client client;
    private Integer cost;

    public Integer getId() {
        return Id;
    }

    public Integer getCost() {
        return cost;
    }

    public void setCost(Integer cost) {
        this.cost = cost;
    }

    public void setId(Integer id) {
        Id = id;
    }
    public Client getClient() {
        return client;
    }
    public void setClient(Client client) {
        this.client = client;
    }

    public Set<Book> getBooks() {
        return books;
    }

    public void setBooks(Set<Book> books) {
        this.books = books;
    }
}
