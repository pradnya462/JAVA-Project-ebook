package com.DAO;
import java.util.List;

import com.entity.*;

public interface CartDAO {
public boolean addCart(Cart c);
public List<Cart> getBookByUser(int userId);

public boolean delete_Book(int cid);
}
