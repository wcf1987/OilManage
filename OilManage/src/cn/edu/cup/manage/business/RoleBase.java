package cn.edu.cup.manage.business;

public class RoleBase {
	int roleID;
	String RoleName;
	public RoleBase(int roleID, String roleName, String roleDescription) {
		super();
		this.roleID = roleID;
		RoleName = roleName;
		RoleDescription = roleDescription;
	}
	String RoleDescription;
	public int getRoleID() {
		return roleID;
	}
	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}
	public String getRoleName() {
		return RoleName;
	}
	public void setRoleName(String roleName) {
		RoleName = roleName;
	}
	public String getRoleDescription() {
		return RoleDescription;
	}
	public void setRoleDescription(String roleDescription) {
		RoleDescription = roleDescription;
	}
	
}
