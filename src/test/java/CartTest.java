import com.rj.dao.CartDao;
import com.rj.pojo.Cart;
import com.rj.pojo.Goods;
import com.rj.service.CartService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:bean.xml")
public class CartTest {
    @Autowired
    private CartDao cartDao;
    @Autowired
    private CartService cartService;

    @Test
    public void testCartDaoAdd() {
        Cart cart = new Cart(1, 1, new BigDecimal(3), new BigDecimal(90.00));
        cartDao.add(cart);
        System.out.println("添加完毕");
    }

    @Test
    public void testCartDaoFindByUid() {
        List<Cart> carts = cartDao.findByUid(1);
        for (Cart cart : carts) {
            System.out.println(cart.toString());
        }
    }

    @Test
    public void testCartServiceFindByUid() {
        List<Cart> carts = cartService.findByUid(1);
        for (Cart cart : carts) {
            System.out.println(cart.toString());
            Goods goods = cart.getGoods();
            System.out.println(goods.toString());
        }
    }

    @Test
    public void testCartDaoModify() {
        Cart cart = new Cart(1, 1, new BigDecimal(4), new BigDecimal(120.00));
        cartDao.modify(cart);
    }
    @Test
    public void testCartDaoFindByGid() {
        Cart cart = cartDao.findByGid(1);
        System.out.println(cart.toString());
    }
    @Test
    public void testCartDaoDeleteByGid() {
        cartDao.deleteByGid(2);
    }
}
