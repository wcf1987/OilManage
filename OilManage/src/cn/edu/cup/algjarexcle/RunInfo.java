package cn.edu.cup.algjarexcle;


public abstract class RunInfo {
	
	public int Algorthm;
	
	public int getAlgorthm() {
		return Algorthm;
	}
	public void setAlgorthm(int algorthm) {
		Algorthm = algorthm;
	}
	

	public RunInfo() {
		super();
	}
	public abstract String getInputFile();
	public abstract String getOutputFile();
	public abstract String output(String info); 
	public abstract String endsWithError(String error);
	public abstract String endsWithSuccess(String info);
	
}
