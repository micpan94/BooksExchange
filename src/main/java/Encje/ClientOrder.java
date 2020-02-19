package Encje;

import javax.persistence.*;
import java.util.Set;

@Entity
public class ClientOrder  {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    private Client client;
    private Integer totalPrice;

    public ClientOrder() {
    }
        public ClientOrder(Client client,Integer totalPrice){
            this.client = client;
            this.totalPrice = totalPrice;
        }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Integer getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Integer totalPrice) {
        this.totalPrice = totalPrice;
    }
}
