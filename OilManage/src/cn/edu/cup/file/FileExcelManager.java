package cn.edu.cup.file;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import cn.edu.cup.manage.dao.AlgorithmProDao;
import cn.edu.cup.tools.Tools;

public class FileExcelManager {
	public static String ExcelAlgBaseDir = "ExcelFrame/";
	public static String ExcelProBaseDir = "ExcelProject/";
	public static String AlgBaseDir = "uploadAlgorithm/";
	public static String uploadTemp = "uploadTemp/";
	public  static final Map<String, FileExcel> cacheList= new ConcurrentHashMap <String, FileExcel>();
	static String  msg;
	public static FileExcel  getFileExcel(int proid, int algid, String InOrOut) {
		/*ActionContext actionContext = ActionContext.getContext();
		Map session = actionContext.getSession();
		Map<String, FileExcel> cacheList = (Map<String, FileExcel>) session
				.get("ExcelCacheList");

		if (cacheList == null) {
			cacheList = new HashMap<String, FileExcel>();
			// session.put("ExcelCacheList", cacheList);

		}*/
		String key = Tools.createKeyFromProAndALg(proid, algid, InOrOut);
		FileExcel excel = cacheList.get(key);
		if (excel != null) {// 先从缓存读取excel
			return excel;
		}

		AlgorithmProDao dao = new AlgorithmProDao();

		String filepath = dao.getProFile(proid, algid, InOrOut);// 缓存没有，则从项目路径寻找excel文件
		dao.close();
		if (filepath == null || filepath.equals("")) {
			msg = "Excel文件未找到";
			return null;
		}
		excel = new FileExcel();
		int status = excel.readExcel(proid, algid, InOrOut,
				ExcelProBaseDir + filepath);
		if (status == -1) {
			msg = excel.getMsg();
			return null;
		}
		cacheList.put(key, excel);
		//session.put("ExcelCacheList", cacheList);
		return excel;

	}
	public static FileExcel reloadFileExcel(int proid, int algid, String InOrOut) {
		
		String key = Tools.createKeyFromProAndALg(proid, algid, InOrOut);
		FileExcel excel;

		AlgorithmProDao dao = new AlgorithmProDao();

		String filepath = dao.getProFile(proid, algid, InOrOut);
		dao.close();
		if (filepath == null || filepath.equals("")) {
			msg = "Excel文件未找到";
			return null;
		}
		excel = new FileExcel();
		int status = excel.readExcel(proid, algid, InOrOut,
				FileExcelManager.ExcelProBaseDir + filepath);
		if (status == -1) {
			msg = excel.getMsg();
			return null;
		}
		cacheList.put(key, excel);
		//session.put("ExcelCacheList", cacheList);
		return excel;

	}
	public static FileExcel getFileExcelTitle(int algid,
			String inOrOut, String file) {
		String key = Tools.createKeyFromProAndALg(algid,inOrOut);
		FileExcel excel = cacheList.get(key);
		if (excel != null) {// 先从缓存读取excel
			return excel;
		}
		
		excel = new FileExcel();
		int status = excel.readExcel(0, algid, inOrOut,
				file);
		if (status == -1) {
			msg = excel.getMsg();
			return null;
		}
		cacheList.put(key, excel);
		//session.put("ExcelCacheList", cacheList);
		return excel;
	}
}
