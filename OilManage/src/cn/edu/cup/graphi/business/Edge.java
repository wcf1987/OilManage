package cn.edu.cup.graphi.business;

public class Edge {
	Integer id ;
	Integer sourceid;
	Integer targetid;
	Integer BasicNodeID;
	Integer proID;
	public Edge(Integer id, Integer sourceid, Integer targetid,
			Integer basicNodeID, Integer proID) {
		super();
		this.id = id;
		this.sourceid = sourceid;
		this.targetid = targetid;
		BasicNodeID = basicNodeID;
		this.proID = proID;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getSourceid() {
		return sourceid;
	}
	public void setSourceid(Integer sourceid) {
		this.sourceid = sourceid;
	}
	public Integer getTargetid() {
		return targetid;
	}
	public void setTargetid(Integer targetid) {
		this.targetid = targetid;
	}
	public Integer getBasicNodeID() {
		return BasicNodeID;
	}
	public void setBasicNodeID(Integer basicNodeID) {
		BasicNodeID = basicNodeID;
	}
	public Integer getProID() {
		return proID;
	}
	public void setProID(Integer proID) {
		this.proID = proID;
	}
}
