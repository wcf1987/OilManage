package cn.edu.cup.manage.business;

public class AlgRoleBase {
	int algRoleID;
	int roleID;
	String roleName;
	int algID;
	int order;
	
	public AlgRoleBase(int order,int algRoleID, int roleID, String roleName, int algID,
			String algName) {
		super();
		this.order=order;
		this.algRoleID = algRoleID;
		this.roleID = roleID;
		this.roleName = roleName;
		this.algID = algID;
		this.algName = algName;
	}
	String algName;
	public int getAlgRoleID() {
		return algRoleID;
	}
	public void setAlgRoleID(int algRoleID) {
		this.algRoleID = algRoleID;
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
	public int getAlgID() {
		return algID;
	}
	public void setAlgID(int algID) {
		this.algID = algID;
	}
	public String getAlgName() {
		return algName;
	}
	public void setAlgName(String algName) {
		this.algName = algName;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
}
