package cn.edu.cup.file;

public class ColModel {
	String name;
	String index;
	String width="80";
	String align="center";
	public void setName(String name) {
		this.name = name;
	}
	public ColModel(String name) {
		super();
		this.name = name;
		this.index=name;
	}
	public void setIndex(String index) {
		this.index = index;
	}
	public void setWidth(String width) {
		this.width = width;
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
	public String getWidth() {
		return width;
	}
	public String getAlign() {
		return align;
	}
}
