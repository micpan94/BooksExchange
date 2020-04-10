package Encje;

import javax.enterprise.context.ApplicationScoped;
import javax.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

    public String MD5(String password) {
        String passwordToHash = password;
        String generatedPassword = null;
        try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            //Add password bytes to digest
            md.update(passwordToHash.getBytes());
            //Get the hash's bytes
            byte[] bytes = md.digest();
            //This bytes[] has bytes in decimal format;
            //Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
            generatedPassword = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }


        return generatedPassword;
    }
}


