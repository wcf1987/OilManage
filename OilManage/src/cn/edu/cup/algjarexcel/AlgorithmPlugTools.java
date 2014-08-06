package cn.edu.cup.algjarexcel;



public abstract class AlgorithmPlugTools {
	public abstract String startCalc(int algID);
	RunInfo info;
	public void injectInfo(RunInfo info){
		this.info=info;
	}
	public RunInfo getInfo(){
		return this.info;
	}
	

	/**
	 * 返回输入的工程文件excel路径
	 * @return
	 */
	public String getExcelInputPath(){
		return this.info.getInputFile();
	}
	
	/**
	 * 返回输出的工程文件excel路径
	 * @return
	 */
	public String getExcelOutputPath(){
		return this.info.getOutputFile();
	}
	/**
	 * 输出的运行工程中的信息
	 * @return
	 */
	public void outputInfo(String info){
		 this.info.output(info);
	}
	/**
	 * 工程异常结束，将异常信息打印出来
	 * @return
	 */
	public  void endsWithError(String error){
		this.info.endsWithError(error);
	}
	
	/**
	 * 
	 * 工程正常结束，将正常信息打印出来
	 * @return
	 */
	public  void endsWithSuccess(String info){
		this.info.endsWithSuccess(info);
	}
}
