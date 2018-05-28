package com.geopia.wallet_ncoin.util;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import java.util.Enumeration;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.http.HttpServletRequest;

/**
 * Http 통신 클래스.
 */
public class HttpUtil {
	public static final int DEFAULT_CONN_TIMEOUT_MS = 10 * 1000;
	public static final int DEFAULT_READ_TIMEOUT_MS = 10 * 1000;
	public static final boolean IGNORE_SSL_CERT = true;

	public static String getClientIP(HttpServletRequest req) {
		String hostName = "unknown hostname";
		String ip = "unknown ip";
		try {
		   InetAddress inetAddress = InetAddress.getLocalHost();
		   hostName = inetAddress.getHostName();
		   ip = inetAddress.toString();
	        ip = req.getHeader("X-FORWARDED-FOR");
	        if (ip == null)
	            ip = req.getRemoteAddr();
	         
		} catch (Exception e) {
		   e.printStackTrace(); 
		}
		return ip;
	}
	public static String toStringSession(HttpServletRequest request) {
		StringBuilder sb=new StringBuilder();
		Enumeration<String> keyes=request.getSession().getAttributeNames();
		while(keyes.hasMoreElements()) {
			String key=keyes.nextElement();
			sb.append(key).append("=").append(request.getSession().getAttribute(key)).append("&");
		}
		return sb.toString();
	}
	
	/**
	 * json 문바열 post
	 * 
	 * @param url
	 * @param jsonString json 문자열
	 * @return 결과 문자열
	 * @throws Exception
	 */
	
	public static String get(String url) throws Exception {
		
		String response = "";
		try {
			URL urltocon = new URL(url);
             BufferedReader bin = new BufferedReader(new InputStreamReader(urltocon.openStream()));
            String line;

            while ((line = bin.readLine()) != null) {

                  System.out.println(line);
                  response+=line;
                  response+="\n";

            }

            bin.close();



     } catch (MalformedURLException e) {

            e.printStackTrace();

     } catch (IOException e) {

            e.printStackTrace();

     }
		return response.toString();
		
	}
	
	public static String postJson(String url, String jsonString) throws Exception {
		if (NcoinDateUtil.isEmpty(url))
			throw new IllegalArgumentException("url is null!");
		if (NcoinDateUtil.isEmpty(jsonString))
			throw new IllegalArgumentException("url is null!");

		HttpURLConnection c = null;
		OutputStream os = null;
		InputStream is = null;
		ByteArrayOutputStream baos = null;
		String errResult = String.format("{\"error\":\"%s\"}", "999");

		try {
			if (IGNORE_SSL_CERT)
				ignoreSslCert();

			byte[] postData = jsonString.getBytes("UTF-8");
			URL u = new URL(url);
			c = (HttpURLConnection) u.openConnection();

			c.setRequestMethod("POST");
			c.setConnectTimeout(DEFAULT_CONN_TIMEOUT_MS);
			c.setReadTimeout(DEFAULT_READ_TIMEOUT_MS);
			c.setRequestProperty("Cache-Control", "no-cache");
			c.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
			c.setRequestProperty("Content-length", "" + postData.length);
			c.setRequestProperty("Accept", "application/json;charset=UTF-8");
			c.setDoOutput(true);
			c.setDoInput(true);
			c.setUseCaches(false);
			c.setAllowUserInteraction(false);

			os = c.getOutputStream();
			os.write(postData);
			os.flush();

			int status = c.getResponseCode();

			switch (status) {
			case HttpURLConnection.HTTP_OK:
				is = c.getInputStream();
				baos = new ByteArrayOutputStream();
				byte[] byteBuff = new byte[1024];
				int read = 0;
				while ((read = is.read(byteBuff, 0, byteBuff.length)) != -1) {
					baos.write(byteBuff, 0, read);
				}
				return new String(baos.toByteArray());
			default:
				errResult = String.format("{\"error\":\"%d\"}", status);
			}

		} catch (MalformedURLException ex) {
			throw new MalformedURLException(ex.getMessage());
		} catch (IOException ex) {
			throw new IOException(ex);
		} finally {
			try {
				if (os != null)
					os.close();
			} catch (Exception ex) {
				errResult = String.format("{\"error\":\"%s\"}", "998");
			}
			try {
				if (is != null)
					is.close();
			} catch (Exception ex) {
				errResult = String.format("{\"error\":\"%s\"}", "997");
			}
			if (c != null)
				c.disconnect();
		}
		return errResult;
	}

	/**
	 * SSL 무시 하도록 설정. 운영에서는 미사용 확인.
	 * 
	 * @throws NoSuchAlgorithmException
	 * @throws KeyManagementException
	 */
	private static void ignoreSslCert() throws NoSuchAlgorithmException, KeyManagementException {
		// Create a trust manager that does not validate certificate chains
		TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {
			public java.security.cert.X509Certificate[] getAcceptedIssuers() {
				return new X509Certificate[0];
			}

			public void checkClientTrusted(X509Certificate[] certs, String authType) {
			}

			public void checkServerTrusted(X509Certificate[] certs, String authType) {
			}
		} };

		// Install the all-trusting trust manager
		SSLContext sc = SSLContext.getInstance("SSL");
		sc.init(null, trustAllCerts, new java.security.SecureRandom());
		HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

		// Create all-trusting host name verifier
		HostnameVerifier allHostsValid = new HostnameVerifier() {
			public boolean verify(String hostname, SSLSession session) {
				return true;
			}
		};

		// Install the all-trusting host verifier
		HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
	}
	
	static public String getStringAttributes(HttpServletRequest request) {
		StringBuilder stringBuilder=new StringBuilder();
		Enumeration<String> keys=request.getAttributeNames();
		while(keys.hasMoreElements()) {
			String key=keys.nextElement();
			String val=request.getAttribute(key).toString();
			stringBuilder.append(key);
			stringBuilder.append("=");
			stringBuilder.append(val);
			stringBuilder.append("<br/>");
		}
		return stringBuilder.toString();
	}
}
