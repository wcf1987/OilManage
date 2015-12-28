package cn.edu.cup.tools;

import java.util.HashSet;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.cup.manage.business.User;

public class MySessionListener  implements HttpSessionListener {
	public void sessionCreated(HttpSessionEvent event) {
     
 }

 public void sessionDestroyed(HttpSessionEvent event) {
        
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();

        Map  application = ActionContext.getContext().getApplication();
        
        HashSet sessions = (HashSet) application.get("sessions");
        if (sessions != null) {
      	  
            // 销毁的session均从HashSet集中移除
        	User user=(User)session.get("user");
        	if(user!=null){
            sessions.remove(session);
            System.out.println("用户"+user.getUsername()+"超时登出");
        	
        	}
        	}
        // 销毁的session均从HashSet集中移除
       
 }
}
