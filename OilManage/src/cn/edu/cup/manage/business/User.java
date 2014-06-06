package cn.edu.cup.manage.business;

import javax.persistence.Column;
import javax.persistence.Entity;

// default package



@Entity
public class User  implements java.io.Serializable {


    // Fields    

     private int userid;
     private String username;
     private String password;
     private int usergroupid;
     private String email;
     private int state;
     private String info;
     private int roleID;
     private String roleName;
     private int userRoleID;
    // Constructors

    public int getUserRoleID() {
		return userRoleID;
	}

	public void setUserRoleID(int userRoleID) {
		this.userRoleID = userRoleID;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public int getRoleID() {
		return roleID;
	}

	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}

	/** default constructor */
    public User() {
    }

	/** minimal constructor */
    public User(int userid) {
        this.userid = userid;
    }
    
    /** full constructor */
    public User(int userid, String username, String password, int usergroupid, String email, int state, String info) {
        this.userid = userid;
        this.username = username;
        this.password = password;
        this.usergroupid = usergroupid;
        this.email = email;
        this.state = state;
        this.info = info;
    }

   
    public User(Integer id, Integer rid, String rName, Integer uid, String uName) {
		// TODO Auto-generated constructor stub
    	this.roleID=rid;
    	this.roleName=rName;
    	this.userid=uid;
    	this.username=uName;
    	this.userRoleID=id;
	}

	// Property accessors
    @Column
    public int getUserid() {
        return this.userid;
    }
    
    public void setUserid(int userid) {
        this.userid = userid;
    }
    
    @Column
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    @Column
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    @Column
    public int getUsergroupid() {
        return this.usergroupid;
    }
    
    public void setUsergroupid(int usergroupid) {
        this.usergroupid = usergroupid;
    }
    
    @Column
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    @Column
    public int getState() {
        return this.state;
    }
    
    public void setState(int state) {
        this.state = state;
    }
    
    @Column
    public String getInfo() {
        return this.info;
    }
    
    public void setInfo(String info) {
        this.info = info;
    }
   








}