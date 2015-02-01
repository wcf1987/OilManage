package cn.edu.cup.graphi.business;

public class NodeProper {
	Integer id ;
	Integer properid;
	String properValue;
	Integer parentID;
	String properName;
	String properUnit;
	Integer proID;
	public NodeProper(Integer id, Integer properid, String properValue,
			Integer parentID, String properName, String properUnit,
			Integer proID) {
		super();
		this.id = id;
		this.properid = properid;
		this.properValue = properValue;
		this.parentID = parentID;
		this.properName = properName;
		this.properUnit = properUnit;
		this.proID = proID;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getProperid() {
		return properid;
	}
	public void setProperid(Integer properid) {
		this.properid = properid;
	}
	public String getProperValue() {
		return properValue;
	}
	public void setProperValue(String properValue) {
		this.properValue = properValue;
	}
	public Integer getParentID() {
		return parentID;
	}
	public void setParentID(Integer parentID) {
		this.parentID = parentID;
	}
	public String getProperName() {
		return properName;
	}
	public void setProperName(String properName) {
		this.properName = properName;
	}
	public String getProperUnit() {
		return properUnit;
	}
	public void setProperUnit(String properUnit) {
		this.properUnit = properUnit;
	}
	public Integer getProID() {
		return proID;
	}
	public void setProID(Integer proID) {
		this.proID = proID;
	}
}
