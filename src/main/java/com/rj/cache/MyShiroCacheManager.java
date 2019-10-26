package com.rj.cache;

import lombok.Setter;
import org.apache.shiro.cache.AbstractCacheManager;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.springframework.data.redis.core.RedisTemplate;

@Setter
public class MyShiroCacheManager extends AbstractCacheManager {
    private RedisTemplate<String,Object> template;
    @Override
    protected Cache createCache(String s) throws CacheException {
        ShiroRBACCache shiroRBACCache = new ShiroRBACCache(s);
        shiroRBACCache.setTemplate(template);
        return shiroRBACCache;
    }
}
