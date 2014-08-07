package cn.edu.cup.algjarexcel;

public class RunInfoDetail extends RunInfo{
	String fileInputPath;
	String fileOutputPath;
	ProjectInfo proinfo;




	public void setProinfo(ProjectInfo proinfo) {
		this.proinfo = proinfo;
	}



	public void setFileInputPath(String fileInputPath) {
		this.fileInputPath = fileInputPath;
	}



	public void setFileOutputPath(String fileOutputPath) {
		this.fileOutputPath = fileOutputPath;
	}

	public RunInfoDetail() {
		super();
	}

	@Override
	public String getOutputFile() {
		// TODO Auto-generated method stub
		
		return fileOutputPath;
	}

	@Override
	public String output(String info) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String endsWithError(String error) {
		proinfo.end(1,error);
		return null;
	}

	@Override
	public String endsWithSuccess(String info) {
		// TODO Auto-generated method stub
		proinfo.end(0,info);
		return null;
	}



	@Override
	public String getInputFile() {
		
		return fileInputPath;
	}

}
