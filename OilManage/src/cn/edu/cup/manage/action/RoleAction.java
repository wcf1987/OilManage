package cn.edu.cup.manage.action;

import java.util.List;

import cn.edu.cup.manage.business.AlgRoleBase;
import cn.edu.cup.manage.business.RoleBase;
import cn.edu.cup.manage.business.User;
import cn.edu.cup.manage.dao.RoleDao;

public class RoleAction {
	List<User> userList;
	List<RoleBase> roleList;
	List<AlgRoleBase> algList;
	int roleID;
	int userID;
	int algID;
	int userRoleID;
	int algRoleID;
	public List<User> getUserList() {
		return userList;
	}
	public List<RoleBase> getRoleList() {
		return roleList;
	}
	public List<AlgRoleBase> getAlgList() {
		return algList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	public void setRoleList(List<RoleBase> roleList) {
		this.roleList = roleList;
	}
	public void setAlgList(List<AlgRoleBase> algList) {
		this.algList = algList;
	}
	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public void setAlgID(int algID) {
		this.algID = algID;
	}
	public void setUserRoleID(int userRoleID) {
		this.userRoleID = userRoleID;
	}
	public void setAlgRoleID(int algRoleID) {
		this.algRoleID = algRoleID;
	}
	String roleName;
	String roleDes;
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public void setRoleDes(String roleDes) {
		this.roleDes = roleDes;
	}
	public String listRoles(){		
		RoleDao dao=new RoleDao();
		roleList=dao.getRolesList();
		return "SUCCESS";
	}
	public String listAlgByRole(){		
		RoleDao dao=new RoleDao();
		algList=dao.getAlgsListByRole(roleID);
		return "SUCCESS";
	}
	public String listUserByRole(){		
		RoleDao dao=new RoleDao();
		userList=dao.getUsersListByRole(roleID);
		return "SUCCESS";
	}
	public String addRole(){		
		RoleDao dao=new RoleDao();
		dao.addRole(roleName,roleDes);
		return "SUCCESS";
	}
	public String delRole(){		
		RoleDao dao=new RoleDao();
		dao.delRole(this.roleID);
		return "SUCCESS";
	}
	public String addUserRole(){		
		RoleDao dao=new RoleDao();
		dao.addUserRole(this.userID,this.roleID);
		return "SUCCESS";
	}
	public String delUserRole(){		
		RoleDao dao=new RoleDao();
		dao.delUserRole(this.userRoleID);
		return "SUCCESS";
	}
	public String addAlgRole(){		
		RoleDao dao=new RoleDao();
		dao.addAlgRole(this.algID,this.roleID);
		return "SUCCESS";
	}
	public String delAlgRole(){		
		RoleDao dao=new RoleDao();
		dao.delAlgRole(this.algRoleID);
		return "SUCCESS";
	}
	public static void main(String args[]){
		RoleAction test=new RoleAction();
		test.roleName="管理员";
		test.roleDes="descrepi";
		test.algID=16;
		test.userID=1;
		test.roleID=4;
		
		test.listRoles();
		System.out.println(test.roleList.size());
		test.listAlgByRole();
		System.out.println(test.algList.size());
		test.listUserByRole();
		System.out.println(test.userList.size());
	}
}
