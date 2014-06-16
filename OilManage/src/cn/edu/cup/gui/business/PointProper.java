package cn.edu.cup.gui.business;

public class PointProper {
	int ID;
	String par_display;
	String par_name;
	String measure_CName;
	String measure_Symbol;
	String point_type;
	int measure_id;
	public String getPoint_type() {
		return point_type;
	}

	public void setPoint_type(String point_type) {
		this.point_type = point_type;
	}

	public int getMeasure_id() {
		return measure_id;
	}

	public void setMeasure_id(int measure_id) {
		this.measure_id = measure_id;
	}

	public PointProper(int iD, String par_display, String par_name,
		String measure_CName,
			String measure_Symbol) {
		super();

	}

	public PointProper(Integer id2, String point_type2,String par_display2, String par_name2, String measure_CName2, String measure_Symbol2, Integer mess_id) {
		ID = id2;
		this.point_type=point_type2;
		this.par_display = par_display2;
		this.par_name = par_name2;
		this.measure_CName = measure_CName2;
		this.measure_Symbol = measure_Symbol2;
		this.measure_id=mess_id;
		
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getPar_display() {
		return par_display;
	}

	public void setPar_display(String par_display) {
		this.par_display = par_display;
	}

	public String getPar_name() {
		return par_name;
	}

	public void setPar_name(String par_name) {
		this.par_name = par_name;
	}


	public String getMeasure_CName() {
		return measure_CName;
	}

	public void setMeasure_CName(String measure_CName) {
		this.measure_CName = measure_CName;
	}

	public String getMeasure_Symbol() {
		return measure_Symbol;
	}

	public void setMeasure_Symbol(String measure_Symbol) {
		this.measure_Symbol = measure_Symbol;
	}
	
}
