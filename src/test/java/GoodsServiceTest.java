import com.rj.dao.GoodsDao;
import com.rj.pojo.Goods;
import com.rj.pojo.GoodsType;
import com.rj.service.GoodsService;
import com.rj.service.GoodsTypeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:bean.xml")
public class GoodsServiceTest {
    @Autowired
    private GoodsTypeService goodsTypeService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private GoodsDao goodsDao;

    @Test
    public void testFindAll() {
        List<GoodsType> goodsTypes = goodsTypeService.findAll();
        for (GoodsType goodsType : goodsTypes) {
            System.out.println(goodsType.toString());
            List<Goods> goods = goodsType.getGoods();
            for (Goods good : goods) {
                System.out.println(good.toString());
            }
        }
    }

    @Test
    public void testFindByGoodID() {
        Goods goods = goodsService.findByGoodId(1);
        System.out.println(goods.toString());
    }

    @Test
    public void testFindByPage() {
        List<Goods> goods = goodsDao.findByTypeIdAndCondition(null, "");
        for (Goods good : goods) {
            System.out.println(good.toString());
        }
    }
}
