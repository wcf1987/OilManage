package cn.edu.cup.manage.business;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;

// default package



@Entity
public class User  implements java.io.Serializable {


    // Fields    
	private int order;
    private int userid;
    private String username;
    private String password;
    private Date addTime;
    private Date lastLoginTime;
    private int loginTimes;
     
//     private int usergroupid;
//     private String email;
//     private int state;
//     private String info;
     private int roleID;
     private String roleName;
     private int userRoleID;
    // Constructors


	/** default constructor */
    public User() {
    }

	/** minimal constructor */
    public User(int userid) {
        this.userid = userid;
    }
    
    
	public User(int order,int userRoleID,int roleID, String roleName,int userid, String username ) {
		super();
		this.order=order;
		this.userid = userid;
		this.username = username;
		this.roleID = roleID;
		this.roleName = roleName;
		this.userRoleID = userRoleID;
	}

	public User(int userid, String username, Date addTime,
			Date lastLoginTime, int loginTimes) {
		super();
		this.userid = userid;
		this.username = username;
		this.addTime = addTime;
		this.lastLoginTime = lastLoginTime;
		this.loginTimes = loginTimes;
	}
	
	// Property accessors
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
    public int getUserid() {
        return this.userid;
    }
    
    public int getRoleID() {
		return roleID;
	}

	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public int getUserRoleID() {
		return userRoleID;
	}

	public void setUserRoleID(int userRoleID) {
		this.userRoleID = userRoleID;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public int getLoginTimes() {
		return loginTimes;
	}

	public void setLoginTimes(int loginTimes) {
		this.loginTimes = loginTimes;
	}

	public void setUserid(int userid) {
        this.userid = userid;
    }
    
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    





}