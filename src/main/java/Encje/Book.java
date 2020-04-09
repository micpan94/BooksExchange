package Encje;


import javax.persistence.*;
import java.util.List;


@Entity
public class Book  {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String title;
    private String author;
    private String publishingHouse;
    private String firstRelease;
    private Integer price;
    private String type;
    @ManyToMany
    private List<ShoppingCard> ShoppingCard;


    public Book() {
    }

    public Book(String title, String author, String publishingHouse, String firstRelease, Integer price, String type,List<ShoppingCard>  shoppingCard) {
        this.title = title;
        this.author = author;
        this.publishingHouse = publishingHouse;
        this.firstRelease = firstRelease;
        this.price = price;
        this.type = type;
        this.ShoppingCard = shoppingCard;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublishingHouse() {
        return publishingHouse;
    }

    public void setPublishingHouse(String publishingHouse) {
        this.publishingHouse = publishingHouse;
    }

    public String getFirstRelease() {
        return firstRelease;
    }

    public void setFirstRelease(String firstRelease) {
        this.firstRelease = firstRelease;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<Encje.ShoppingCard> getShoppingCard() {
        return ShoppingCard;
    }

    public void setShoppingCard(List<Encje.ShoppingCard> shoppingCard) {
        ShoppingCard = shoppingCard;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", publishingHouse='" + publishingHouse + '\'' +
                ", firstRelease='" + firstRelease + '\'' +
                ", price=" + price +
                '}';
    }
}
