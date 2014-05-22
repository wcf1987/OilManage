package cn.edu.cup.gui.business;

public class GUIPoint {
	public static int getTypeInt(String type){
		if( type.equals("test1"))
			return 1;
		else
			return 2;
	}
	String name;
	String typeName;
	int type;
	public GUIPoint(String name2, String typename2, int type2) {
		this.name=name2;
		this.type=type2;
		this.typeName=typename2;
		// TODO Auto-generated constructor stub
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
