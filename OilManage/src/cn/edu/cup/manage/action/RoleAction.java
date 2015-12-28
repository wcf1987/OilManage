package cn.edu.cup.manage.action;

import java.util.List;

import cn.edu.cup.manage.business.AlgRoleBase;
import cn.edu.cup.manage.business.RoleBase;
import cn.edu.cup.manage.business.User;
import cn.edu.cup.manage.dao.RoleDao;

/**
 * @author Administrator
 *
 */
public class RoleAction {
	List<User> userList;
	List<RoleBase> roleList;
	List<AlgRoleBase> algList;
	int roleID;
	int userID;
	int algID;
	int userRoleID;
	int algRoleID;

	private int page;//第几页
	private int records;//总记录数
	private int rows;//每行多少个
	private int rowNum;//
	private int total;//多少页
	private String sidx;
	private String sord;
	private int id;
	private List<Integer> ids;
	
	
	public List<Integer> getIds() {
		return ids;
	}
	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRecords() {
		return records;
	}
	public void setRecords(int records) {
		this.records = records;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}

	public int getRows() {
		return rows;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getRowNum() {
		return rowNum;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getSidx() {
		return sidx;
	}
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}
	public String getSord() {
		return sord;
	}
	public void setSord(String sord) {
		this.sord = sord;
	}
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
		roleList=dao.getRolesList(page, rows, sidx, sord);
		records=dao.getCountRole();

		if(records!=0&& rows!=0){
		total=records/rows;
			if(records%rows!=0){
				total++;
			}
		}
		dao.close();
		return "SUCCESS";
	}
	public String listAlgByRole(){		
		RoleDao dao=new RoleDao();
		algList=dao.getAlgsListByRole(roleID);
		
		records=dao.getCountAlgsByRole(roleID);
		if(records!=0&& rows!=0){
		total=records/rows;
			if(records%rows!=0){
				total++;
			}
		}
		
		dao.close();
		return "SUCCESS";
	}
	public String listUserByRole(){		
		RoleDao dao=new RoleDao();
		userList=dao.getUsersListByRole(roleID);
		
		records=dao.getCountUsersByRole(roleID);
		if(records!=0&& rows!=0){
		total=records/rows;
			if(records%rows!=0){
				total++;
			}
		}
		dao.close();
		return "SUCCESS";
	}
	public String addRole(){		
		RoleDao dao=new RoleDao();
		dao.addRole(roleName,roleDes);
		dao.close();
		return "SUCCESS";
	}
	public String delRole(){		
		RoleDao dao=new RoleDao();
		if(!ids.isEmpty()){
			for(int id:ids)
				dao.delRole(id);
		}
		dao.close();
		return "SUCCESS";
	}
	public String addUserRole(){		
		RoleDao dao=new RoleDao();
		dao.addUserRole(this.userID,this.roleID);
		dao.close();
		return "SUCCESS";
		
	}
	public String delUserRole(){		
		RoleDao dao=new RoleDao();
		if(!ids.isEmpty()){
			for(int id:ids)
			dao.delUserRole(id);
		}
		dao.close();
		
		return "SUCCESS";
	}
	public String addAlgRole(){		
		RoleDao dao=new RoleDao();
		dao.addAlgRole(this.algID,this.roleID);
		dao.close();
		return "SUCCESS";
	}
	public String delAlgRole(){		
		RoleDao dao=new RoleDao();
		if(!ids.isEmpty()){
			for(int id:ids)
				dao.delAlgRole(id);
		}
		dao.close();
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
