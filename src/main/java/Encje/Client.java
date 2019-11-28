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
    @OneToMany(mappedBy = "client")
    private Set<Advertisement> advertisementSet;

    public Client(String login, String password, String email, String telephoneNr, String location, Set<Advertisement> advertisementSet) {
        this.login = login;
        this.password = password;
        this.email = email;
        this.telephoneNr = telephoneNr;
        this.location = location;
        this.advertisementSet = advertisementSet;
    }

    public Client(){}



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
