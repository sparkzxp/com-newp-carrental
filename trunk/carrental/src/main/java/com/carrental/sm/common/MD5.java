package com.carrental.sm.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

public class MD5 {
	private static String byte2Hex(byte b) {
		int value = (b & 0x7F) + (b < 0 ? 0x80 : 0);
		return (value < 0x10 ? "0" : "") + Integer.toHexString(value).toLowerCase();
	}

	public static String MD5_32(String passwd) {
		try {
			// 123456 : e10adc3949ba59abbe56e057f20f883e
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			StringBuffer strbuf = new StringBuffer();

			md5.update(passwd.getBytes(), 0, passwd.length());
			byte[] digest = md5.digest();

			for (int i = 0; i < digest.length; i++) {
				strbuf.append(byte2Hex(digest[i]));
			}
			return strbuf.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return passwd;
		}
	}

	public static String compute(String inStr) {
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (Exception e) {
			return "";
		}
		char[] charArray = inStr.toCharArray();
		byte[] byteArray = new byte[charArray.length];

		for (int i = 0; i < charArray.length; i++) {
			byteArray[i] = (byte) charArray[i];
		}
		byte[] md5Bytes = md5.digest(byteArray);

		StringBuffer hexValue = new StringBuffer();

		for (int i = 0; i < md5Bytes.length; i++) {
			int val = ((int) md5Bytes[i]) & 0xff;
			if (val < 16) {
				hexValue.append("0");
			}
			hexValue.append(Integer.toHexString(val));
		}

		return hexValue.toString().toUpperCase();
	}

	/**
	 * 
	 * 注释: 将(随机数+第一次生成的摘要值)使用md5算出摘要值 返回值: String
	 * 
	 * @param
	 * @throws
	 */
	public static String computeMore(String input, String mark) {
		String ret = "";
		String md5F = MD5.compute(input);
		Random rd = new Random();
		String random = "";
		if (!"".equals(mark)) {
			random = Integer.valueOf(rd.nextInt()).toString();
		}
		ret = MD5.compute(random + md5F);
		return ret.toUpperCase();
	}

	public static void main(String[] args) throws NoSuchAlgorithmException {
		System.out.println(MD5_32("123456"));
	}
}
