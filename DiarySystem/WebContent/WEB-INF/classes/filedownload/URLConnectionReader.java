    package filedownload;
	import java.net.*;
    import java.io.*;

    public class URLConnectionReader {
	public URLConnectionReader()throws Exception 
	{
	}
        public void URLConnection(String path)throws Exception {
		String fname,fpath, PATH=path;
		int len1, len=PATH.length();
		len1=PATH.lastIndexOf("/");
		fname=PATH.substring(len1+1,len);
            URL yahoo = new URL(PATH);
            URLConnection yc = yahoo.openConnection();
            BufferedReader in = new BufferedReader(
                                    new InputStreamReader(
                                    yc.getInputStream()));
           	String inputLine;
	    	File file=new File("/root/Desktop/",fname);
		BufferedWriter out = new BufferedWriter(new FileWriter(file));
        	
        	
   		while ((inputLine = in.readLine()) != null) 
                out.write(inputLine);
		out.close();
            	in.close();
        }
    }
