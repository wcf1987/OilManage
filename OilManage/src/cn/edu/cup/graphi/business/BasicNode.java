package cn.edu.cup.graphi.business;

public class BasicNode {
	Integer id ;
	Integer Type;
	public BasicNode(Integer id, Integer type, String typeName, String iconFile) {
		super();
		this.id = id;
		Type = type;
		TypeName = typeName;
		IconFile = iconFile;
	}
	String TypeName;
	String IconFile;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getType() {
		return Type;
	}
	public void setType(Integer type) {
		Type = type;
	}
	public String getTypeName() {
		return TypeName;
	}
	public void setTypeName(String typeName) {
		TypeName = typeName;
	}
	public String getIconFile() {
		return IconFile;
	}
	public void setIconFile(String iconFile) {
		IconFile = iconFile;
	}
}
