package com.sweet.core.shiro.session;import com.sweet.core.shiro.UserOnline;import com.sweet.system.entity.User;import org.apache.shiro.session.Session;import org.apache.shiro.session.mgt.eis.SessionDAO;import org.apache.shiro.subject.SimplePrincipalCollection;import org.apache.shiro.subject.support.DefaultSubjectContext;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Service;import java.util.ArrayList;import java.util.Collection;import java.util.List;@Service("sessionService")public class SessionServiceImpl implements SessionService {    @Autowired    private SessionDAO sessionDAO;    @Override    public List<UserOnline> list() {        List<UserOnline> list = new ArrayList<>();        Collection<Session> sessions = null;        try {            sessions = sessionDAO.getActiveSessions();        } catch (Exception e) {        }        for (Session session : sessions) {            if(session!=null){                System.out.println(session);            UserOnline userOnline = new UserOnline();            User user = new User();            SimplePrincipalCollection principalCollection = new SimplePrincipalCollection();            if (session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY) == null) {                continue;            } else {                principalCollection = (SimplePrincipalCollection) session                        .getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);                user = (User) principalCollection.getPrimaryPrincipal();                if(user.getUserId()!=null){                    userOnline.setUserName(user.getUserName());                    userOnline.setUserId(user.getUserId().toString());                }            }            userOnline.setId((String) session.getId());            userOnline.setHost(session.getHost());            userOnline.setStartTimestamp(session.getStartTimestamp());            userOnline.setLastAccessTime(session.getLastAccessTime());            Long timeout = session.getTimeout();            if (timeout == 0l) {                userOnline.setStatus("离线");            } else {                userOnline.setStatus("在线");            }            userOnline.setTimeout(timeout);            list.add(userOnline);            }        }        return list;    }    @Override    public boolean forceLogout(String sessionId) {        Session session = sessionDAO.readSession(sessionId);        sessionDAO.delete(session);        return true;    }}