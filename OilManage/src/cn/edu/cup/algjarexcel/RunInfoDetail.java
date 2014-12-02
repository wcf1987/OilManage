package cn.edu.cup.algjarexcel;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import cn.edu.cup.manage.business.LogInfo;
import cn.edu.cup.tools.Tools;

public class RunInfoDetail extends RunInfo{
	String fileInputPath;
	String fileOutputPath;
	ProjectInfo proinfo;
	List<LogInfo> log=Collections.synchronizedList(new ArrayList<LogInfo>());;
	public List<LogInfo> getLog(){
		return log;
	}
	class MyOutputStream extends OutputStream{
	    public void write(int arg0) throws IOException {
	      // 写入指定的字节，忽略
	    }   
	   
	    public void write(byte data[]) throws IOException{
	      // 追加一行字符串
	    	log(new String(data));
	    }
	   
	    public void write(byte data[], int off, int len) throws IOException {
	    	
	    	
	    	String S=new String(data,off,len);
	      // 追加一行字符串中指定的部分，这个最重要
	    	if(proinfo!=null&&proinfo.status==1&&Tools.getPrintSource()==1&&!S.trim().equalsIgnoreCase("")){
	    		log(S.trim());
	    	}else{
	    		olderrStream.print(S);
	    	}
	      // 移动TextArea的光标到最后，实现自动滚动
	      //txtLog.setCaretPosition(txtLog.getText().length());
	    }
	  }


	public void setProinfo(ProjectInfo proinfo) {
		this.proinfo = proinfo;
	}



	public void setFileInputPath(String fileInputPath) {
		this.fileInputPath = fileInputPath;
	}



	public void setFileOutputPath(String fileOutputPath) {
		this.fileOutputPath = fileOutputPath;
	}
	PrintStream  printStream;
	static PrintStream  oldStream;
	static PrintStream  olderrStream;
	static{
		 oldStream=System.out;
		 olderrStream=System.err;
	}
	public RunInfoDetail() {
		super();
		MyOutputStream out=new MyOutputStream();
		 printStream = new PrintStream(out);
	    // 指定标准输出到自己创建的PrintStream

	    System.setOut(printStream);
	    System.setErr(printStream);
	}

	@Override
	public String getOutputFile() {
		// TODO Auto-generated method stub
		
		return fileOutputPath;
	}

	@Override
	public String log(String info) {
		// TODO Auto-generated method stub
		//proinfo.logInfo(info);
		long id=Thread.currentThread().getId();
		CalcThread b=ProCalcManage.getInstance().threadIDMap.get(id);
		b.proinfo.info.log.add(new LogInfo(new Date(), info));
		
		return info;
	}

	@Override
	public String endsWithError(String error) {
		proinfo.logInfo(error);
		proinfo.end(3,error);
		return null;
	}

	@Override
	public String endsWithSuccess(String info) {
		// TODO Auto-generated method stub
		proinfo.logInfo(info);
		proinfo.end(2,info);
		return null;
	}



	@Override
	public String getInputFile() {
		
		return fileInputPath;
	}

}
