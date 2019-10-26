package com.rj.cache;

import lombok.Setter;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.Collection;
import java.util.Set;
import java.util.concurrent.TimeUnit;

@Setter
public class ShiroRBACCache implements Cache {
    private String name;
    private RedisTemplate<String,Object> template;

    public ShiroRBACCache() {
    }

    public ShiroRBACCache(String name) {
        this.name = name;
    }

    @Override
    public Object get(Object o) throws CacheException {
        Object data = template.opsForValue().get(o.toString());
        return data;
    }

    @Override
    public Object put(Object o, Object o2) throws CacheException {
        template.opsForValue().set(o.toString(), o2, 1, TimeUnit.HOURS);
        return null;
    }

    @Override
    public Object remove(Object o) throws CacheException {
        template.delete(o.toString());
        return null;
    }

    @Override
    public void clear() throws CacheException {

    }

    @Override
    public int size() {
        return 0;
    }

    @Override
    public Set keys() {
        return null;
    }

    @Override
    public Collection values() {
        return null;
    }
}
