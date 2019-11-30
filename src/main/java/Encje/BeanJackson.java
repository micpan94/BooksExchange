package Encje;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.inject.Produces;

@ApplicationScoped
public class BeanJackson {


    @Produces
    public ObjectMapper objectMapper(){
        return new ObjectMapper();
    }

    @Produces
    public ObjectWriter objectWriter(){
        return new ObjectMapper().writerWithDefaultPrettyPrinter();
    }
}
