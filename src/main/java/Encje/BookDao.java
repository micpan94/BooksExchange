package Encje;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class BookDao extends EntityDao<Book> {
    public BookDao(){
        super(Book.class);
    }
}
