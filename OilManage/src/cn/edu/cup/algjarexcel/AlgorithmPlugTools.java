package cn.edu.cup.algjarexcel;



public abstract class AlgorithmPlugTools{
	public void injectInfo(RunInfo info){
		this.info=info;
	}

	public RunInfo getInfo(){
		return this.info;
	}
	
	/**
	 * 子类必须覆盖的方法，用来启动算法
	 * @param algID 子功能ID
	 * @return
	 */
	public abstract String startCalc(int algID) throws Exception;
	RunInfo info=null;

	

	/**
	 * 返回输入的工程文件excel路径
	 * @return
	 */
	public String getExcelInputPath(){
		if(this.info==null){
			return "测试环境无法提供输入文件路径，请采用自定义模式";
		}else{
		return this.info.getInputFile();
		}
	}
	
	/**
	 * 返回输出的工程文件excel路径
	 * @return
	 */
	public String getExcelOutputPath(){
		if(this.info==null){
			return "测试环境无法提供输入文件路径，请采用自定义模式";
		}else{
			return this.info.getOutputFile();
		}
		
	}
	/**
	 * 输出的运行工程中的信息
	 * @return
	 */
	public void log(String info){
		if(this.info==null){
			System.out.println(info);
		}else{
		 this.info.log(info);
		}
	}
	/**
	 * 工程异常结束，将异常信息打印出来
	 * @return
	 */
	public  void endsWithError(String error){
		if(this.info==null){
			System.out.println("程序异常结束："+info);
		}else{
		this.info.endsWithError(error);
		}
	}
	
	/**
	 * 
	 * 工程正常结束，将正常信息打印出来
	 * @return
	 */
	public  void endsWithSuccess(String info){
		if(this.info==null){
			System.out.println("程序正常结束："+info);
		}else{
			this.info.endsWithSuccess(info);
		}
	}
}
