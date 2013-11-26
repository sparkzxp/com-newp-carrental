package com.carrental.sm.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * @author 张霄鹏
 * 
 */
public class FileUtil {

	public static final int ARCTYPE_IMAGE_PATH_NUM = 1;
	public static final String ARCTYPE_IMAGE_PATH = "arctype/images/";

	public static String getFilePath(int filePath) {
		String ret;
		switch (filePath) {
		case ARCTYPE_IMAGE_PATH_NUM:
			ret = ARCTYPE_IMAGE_PATH;
			break;
		default:
			ret = "";
			break;
		}
		return ret;
	}

	/**
	 * 把一个文件转化为字节
	 * 
	 * @param file
	 * @return byte[]
	 * @throws Exception
	 */
	public static byte[] getByte(File file) throws Exception {
		byte[] bytes = null;
		if (file != null) {
			InputStream is = new FileInputStream(file);
			int length = (int) file.length();
			if (length > Integer.MAX_VALUE) {
				// 当文件的长度超过了int的最大值
				System.out.println("this file is max ");
				return null;
			}
			bytes = new byte[length];
			int offset = 0;
			int numRead = 0;
			while (offset < bytes.length && (numRead = is.read(bytes, offset, bytes.length - offset)) >= 0) {
				offset += numRead;
			}
			// 如果得到的字节长度和file实际的长度不一致就可能出错了
			if (offset < bytes.length) {
				System.out.println("file length is error");
				return null;
			}
			is.close();
		}
		return bytes;
	}

	/**
	 * 获取图片储存名称
	 */
	public static String gainFileName(String oldFileName) {
		String fileName = "";
		fileName += new SimpleDateFormat("yyyyMMddHHmmss_").format(new Date()); // 以yyyyMMdd的方式生成时间
		fileName += new Random().nextInt(10000); // 时间文件名称生成随机数
		fileName += "." + gainExt(oldFileName); // 连接上后缀名
		return fileName;
	}

	/**
	 * 获取文件的后缀名 转小写
	 */
	public static String gainExt(String fileName) {
		return fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
	}

	/**
	 * 删除单个文件
	 * 
	 * @param sPath
	 *            被删除文件的文件名
	 * @return 单个文件删除成功返回true，否则返回false
	 */
	public static boolean deleteFile(String sPath) {
		Boolean flag = false;
		File file = new File(sPath);
		// 路径为文件且不为空则进行删除
		if (file.isFile() && file.exists()) {
			file.delete();
			flag = true;
		}
		return flag;
	}
}
