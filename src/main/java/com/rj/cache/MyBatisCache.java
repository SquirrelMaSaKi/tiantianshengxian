package com.rj.cache;

import org.apache.ibatis.cache.Cache;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.context.ContextLoader;

import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

public class MyBatisCache implements Cache {
    private String id;
    private final ReadWriteLock lock = new ReentrantReadWriteLock();

    public MyBatisCache() {

    }

    public MyBatisCache(String id) {
        this.id = id;
    }

    @Override
    public String getId() {
        return this.id;
    }

    @Override
    public void putObject(Object key, Object value) {
        RedisTemplate<String,Object> template = (RedisTemplate<String, Object>) ContextLoader.getCurrentWebApplicationContext().getBean("redisTemplate");
        template.opsForValue().set(key.toString(), value,1, TimeUnit.HOURS);
    }

    @Override
    public Object getObject(Object key) {
        RedisTemplate<String,Object> template = (RedisTemplate<String, Object>) ContextLoader.getCurrentWebApplicationContext().getBean("redisTemplate");
        Object cache = template.opsForValue().get(key.toString());
        return cache;
    }

    @Override
    public Object removeObject(Object key) {
        return null;
    }

    @Override
    public void clear() {
        RedisTemplate<String,Object> template = (RedisTemplate<String, Object>) ContextLoader.getCurrentWebApplicationContext().getBean("redisTemplate");
        Set<String> keys = template.keys("*"+this.getId()+"*");
        template.delete(keys);
    }

    @Override
    public int getSize() {
        return 0;
    }

    @Override
    public ReadWriteLock getReadWriteLock() {
        return this.lock;
    }
}
