package Encje;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Order  {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    private Client client;

}
