package cn.edu.cup.algjarexcel;

public class CalcThread extends Thread {
	ProjectInfo proinfo;
	AlgorithmPlugTools alg;
	public void setProInfo(ProjectInfo proinfo) {
		// TODO Auto-generated method stub
		this.proinfo=proinfo;
		this.alg=this.proinfo.getAlg();
	}
	public void stopByForce(){
		this.proinfo.end(3, "外部强制终止");
		this.stop();
	}
	public void setAlg(AlgorithmPlugTools alg) {
		// TODO Auto-generated method stub
		this.alg=alg;
	}

	public void run() {
		// TODO Auto-generated method stub
		alg.injectInfo(proinfo.getInfo());
		alg.startCalc(proinfo.getAlgID());
	}

}
