import com.rj.pojo.User;
import com.rj.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:bean.xml")
public class UserServiceTest {
    @Autowired
    private UserService userService;

    @Test
    public void testAdd() {
        User user = new User(null, "李四", "123", "456@163.com", null);
        userService.add(user);
        System.out.println("添加完毕");
    }
}
