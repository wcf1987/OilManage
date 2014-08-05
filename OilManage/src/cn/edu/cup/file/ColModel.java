package cn.edu.cup.file;

public class ColModel {
	String name;
	String index;
	boolean editable=true;
	
	public boolean isEditable() {
		return editable;
	}

	boolean hidden;
	public boolean isHidden() {
		return hidden;
	}

	String align="center";
	public void setName(String name) {
		this.name = name;
	}
	public ColModel(String name) {
		super();
		this.name = name;
		this.index=name;
		this.hidden=false;
	}
	public ColModel(String name,boolean hidden) {
		super();
		this.name = name;
		this.index=name;
		this.hidden=hidden;
	}
	public void setIndex(String index) {
		this.index = index;
	}

	public void setAlign(String align) {
		this.align = align;
	}
	public String getName() {
		return name;
	}
	public String getIndex() {
		return index;
	}

	public String getAlign() {
		return align;
	}
}
