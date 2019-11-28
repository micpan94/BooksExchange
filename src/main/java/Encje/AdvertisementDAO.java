package Encje;

import javax.enterprise.context.ApplicationScoped;
import java.util.Collection;

@ApplicationScoped
public class AdvertisementDAO extends EntityDao<Advertisement> {

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

}
