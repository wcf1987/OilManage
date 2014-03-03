package cn.edu.cup.manage.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.edu.cup.manage.dao.UserDAO;
import cn.edu.cup.manage.business.User;

public class LoginAction extends ActionSupport{
	String  username;
	String password;
	String type;
	UserDAO userDAO;
	public UserDAO getUserDAO() {
		return userDAO;
	}
	public void setUserDAO(UserDAO userDAO) {
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
		userDAO=new UserDAO();
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
		
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        session.put("user", user);
		//System.out.println(getUsername());
        System.out.println(user.getUsername()+"已登录");
		//System.out.println(getType());
		return "succ";
	}
	
}
