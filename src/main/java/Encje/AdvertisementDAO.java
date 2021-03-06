package Encje;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import java.util.*;

@ApplicationScoped
public class AdvertisementDAO extends EntityDao<Advertisement> {

    @Inject
    private ClientDao clientDao;

    public AdvertisementDAO() {
        super(Advertisement.class);
    }

    public Advertisement getAdvertisement(Integer id) {
        Collection<Advertisement> all = findAll();
        Advertisement advertisement = new Advertisement();
        for (Advertisement element : all) {
            if (element.getId() == id) {
                advertisement = element;
            }
        }

        return advertisement;

    }

    public Collection<Advertisement> getAllClientAdvByID(Integer id) {

        Collection<Advertisement> all = new HashSet<>();
        Collection<Advertisement> all1 = findAll();
        Client byId = clientDao.findById(id);
        for (Advertisement element : all1) {
            if (element.getClient() == byId) {
                all.add(element);
            }
        }
        return all;
    }

    public Boolean isValidID(Integer id) {
        Collection<Advertisement> all = findAll();
        Boolean result = false;
        for (Advertisement element : all) {
            if (element.getId() == id) {
                result = true;
            }
        }
        return result;
    }

    public List<Advertisement> getAdvByCity(String city) {
        List<Advertisement> result = new ArrayList<>();
        Collection<Advertisement> all = findAll();
        for (Advertisement element : all) {
            if (element.getLocation().contains(city) ) {
                result.add(element);
            }
        }
        return result;
    }

}
