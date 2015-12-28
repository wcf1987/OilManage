package cn.edu.cup.manage.action;

import java.util.HashSet;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.edu.cup.manage.business.User;
import cn.edu.cup.manage.dao.UserDao;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	String  username;
	String password;
	String type;
	UserDao userDAO;
	String flag;
	int totalUser;
	public int getTotalUser() {
		return totalUser;
	}
	public void setTotalUser(int totalUser) {
		this.totalUser = totalUser;
	}
	public UserDao getUserDAO() {
		return userDAO;
	}
	public void setUserDAO(UserDao userDAO) {
		this.userDAO = userDAO;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String login()   {
		
		User user=new User();
		//add by zsy to log remote access ip
		HttpServletRequest request = ServletActionContext.getRequest(); 
		String remoteip=(String)request.getRemoteHost();
		//above add by zsy to log remote access ip
		
		if(username==null||username.equals("")){
	        ActionContext actionContext = ActionContext.getContext();
	        Map session = actionContext.getSession();
	        session.put("wrong", "用户名为空");	
			return "fail";
		}
		if(password==null||password.equals("")){
	        ActionContext actionContext = ActionContext.getContext();
	        Map session = actionContext.getSession();
	        session.put("wrong", "密码为空");	
			return "fail";
		}
		userDAO=new UserDao();
		user=userDAO.searchUser(username, password, type);
		if(user==null){
	        ActionContext actionContext = ActionContext.getContext();
	        Map session = actionContext.getSession();
	        session.put("wrong", "帐户或者密码错误，或者您的账号正在审核中。");	
			return "fail";
		}
		//add by zsy to log remote access ip
//		userDAO.recordLogin(username,remoteip);//add by zsy
		//above add by zsy to log remote access ip
		String totalUser=String.valueOf(userDAO.getCountUser());
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        session.put("user", user);
        session.put("totalUser", totalUser);
        userDAO.close();

        Map  application = ActionContext.getContext().getApplication();
            
            // 在application范围由一个HashSet集保存所有的session
        HashSet sessions = (HashSet) application.get("sessions");
        if (sessions == null) {
             sessions = new HashSet();
             application.put("sessions", sessions);
            }
            
            // 新创建的session均添加到HashSet集中 系统时间
            sessions.add(session);
            System.out.println("用户"+user.getUsername()+"登录系统");
            // 可以在别处从application范围中取出sessions集合
            // 然后使用sessions.size()获取当前活动的session数，即为“在线人数”
   
		return "succ";
	}
	public String logout(){
		ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        User user=(User)session.get("user");
        session.remove("user");
//		HttpServletRequest request = null;
//		request.getSession().removeAttribute("user");
        flag="true";
        
        Map  application = ActionContext.getContext().getApplication();
        
        // 在application范围由一个HashSet集保存所有的session
        HashSet sessions = (HashSet) application.get("sessions");
        if (sessions != null) {
        	  
            // 销毁的session均从HashSet集中移除
            sessions.remove(session);
            System.out.println("用户"+user.getUsername()+"手动登出");
        	
        }
        
        
		return SUCCESS;
	}
	
}
