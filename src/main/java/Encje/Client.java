package Encje;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Client{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String login;
    private String password;
    private String email;
    private String telephoneNr;
    private String location;
    private String firstName;
    private String lastName;

    @OneToMany(mappedBy = "client",fetch = FetchType.EAGER)
    private Set<Advertisement> advertisementSet;

    @OneToMany(mappedBy = "client",fetch = FetchType.EAGER)
    private Set<Order> orders;

    public Client(String firstName,String login, String password, String email, String telephoneNr, String location, String lastName, Set<Advertisement> advertisementSet,Set<Order> orders) {
        this.login = login;
        this.password = password;
        this.email = email;
        this.telephoneNr = telephoneNr;
        this.location = location;
        this.lastName = lastName;
        this.firstName = firstName;
        this.advertisementSet = advertisementSet;
        this.orders = orders;
    }

    public Client(){}


    public String getTelephoneNr() {
        return telephoneNr;
    }

    public void setTelephoneNr(String telephoneNr) {
        this.telephoneNr = telephoneNr;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Set<Advertisement> getAdvertisementSet() {
        return advertisementSet;
    }

    public Set<Order> getOrders() {
        return orders;
    }

    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }

    public void setAdvertisementSet(Set<Advertisement> advertisementSet) {
        this.advertisementSet = advertisementSet;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Override
    public String toString() {
        return "Client{" +
                "id=" + id +
                ", login='" + login + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
