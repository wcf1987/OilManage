package cn.edu.cup.gui.business;

public class PointValue {
	int ID;
	String par_display;
	String par_name;
	double par_value;
	double par_ISOValue;
	String measure_CName;
	String measure_Symbol;

	public PointValue(int iD, String par_display, String par_name,
			double par_value2, double par_ISOValue2, String measure_CName,
			String measure_Symbol) {
		super();
		ID = iD;
		this.par_display = par_display;
		this.par_name = par_name;
		this.par_value = par_value2;
		this.par_ISOValue = par_ISOValue2;
		this.measure_CName = measure_CName;
		this.measure_Symbol = measure_Symbol;
	}

	public PointValue() {
		super();
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

	public double getPar_value() {
		return par_value;
	}

	public void setPar_value(double par_value) {
		this.par_value = par_value;
	}

	public double getPar_ISOValue() {
		return par_ISOValue;
	}

	public void setPar_ISOValue(double par_ISOValue) {
		this.par_ISOValue = par_ISOValue;
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
