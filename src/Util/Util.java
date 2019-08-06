package Util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Util {
   public static String md5(String target) {
       MessageDigest md = null;
       try {
           md = MessageDigest.getInstance("MD5");
       } catch (NoSuchAlgorithmException e) {
           e.printStackTrace();
       }

       byte[] byteData = target.getBytes();
       md.update(byteData);
       byte[] digest = md.digest();

       String strENCData = "";
       for (int i = 0; i < digest.length; i++) {
           strENCData = strENCData + Integer.toHexString(digest[i] & 0xFF).toUpperCase();
       }
       return strENCData;
   }
}
