import com.rj.dao.UserDao;
import com.rj.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:bean.xml")
public class UserTest {
    @Autowired
    private UserDao userDao;

    @Test
    public void testAdd() {
        User user = new User(null, "张三", "123", "123@qq.com", "dagag");
        userDao.add(user);
        System.out.println("添加完成");
    }

    @Test
    public void testFind() {
        User user = userDao.findByUsernameOrEmail("123@qq.com");
        System.out.println(user.toString());
    }
}
