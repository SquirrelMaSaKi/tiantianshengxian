package com.rj.cache;

import lombok.Setter;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.SimpleSession;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;
import org.springframework.data.redis.core.RedisTemplate;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

@Setter
public class MySessionDao extends AbstractSessionDAO {
    private RedisTemplate<String,Object> template;

    @Override
    protected Serializable doCreate(Session session) {
        Serializable RSESSIONID = this.generateSessionId(session);
        this.assignSessionId(session, RSESSIONID);
        template.opsForValue().set("rj:"+RSESSIONID, session, 1, TimeUnit.DAYS);
        return RSESSIONID;
    }

    @Override
    protected Session doReadSession(Serializable sessionId) {
        template.expire("rj:"+sessionId, 1, TimeUnit.DAYS);
        SimpleSession simpleSession = (SimpleSession) template.opsForValue().get("rj:"+sessionId);
        return simpleSession;
    }

    @Override
    public void update(Session session) throws UnknownSessionException {
        template.expire("rj:"+session.getId(), 1, TimeUnit.DAYS);
        template.opsForValue().set("rj:"+session.getId(), session);
    }

    @Override
    public void delete(Session session) {
        template.delete("rj:"+session.getId());
    }

    @Override
    public Collection<Session> getActiveSessions() {
        Set keys = template.keys("rj:*");
        List<Session> sessions = template.opsForValue().multiGet(keys);
        return sessions;
    }
}
