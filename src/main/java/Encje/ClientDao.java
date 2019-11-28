package Encje;

import javax.enterprise.context.ApplicationScoped;
import javax.servlet.http.HttpSession;
import java.util.Collection;

@ApplicationScoped
public class ClientDao extends EntityDao<Client> {
    public ClientDao() {
        super(Client.class);
    }

    public Boolean checkEmail(String email) {
        Collection<Client> clients = findAll();
        Boolean result = true;

        for (Client element : clients) {
            for (int i = 0; i < clients.size(); i++) {
                if (element.getEmail().equals(email)) {
                    result = false;
                }
            }
        }
        return result;
    }

    public Boolean checkLogin(String login) {
        Collection<Client> all = findAll();
        Boolean result = true;
        for (Client element : all) {
            for (int i = 0; i < all.size(); i++) {
                if (element.getLogin().equals(login)) {
                    result = false;
                }
            }

        }
        return result;
    }

    public Client finyByLogin(String login) {
        Client client = new Client();
        Collection<Client> clients = findAll();
        for (int i = 0; i < clients.size(); i++) {
            for (Client element : clients) {
                if (element.getLogin().equals(login)) {
                    client = element;
                }
            }
        }

        return client;
    }

}
