import java.io.*;
import java.net.*;

/*
 * Command line program to download data from URLs and save
 * it to local files. Run like this:
 * java FileDownload http://schmidt.devlib.org/java/file-download.html
 * @author Marco Schmidt
 */
public class download{
	
	public static void filedownload(String address, String localFileName) {
		OutputStream out = null;
		URLConnection conn = null;
		InputStream  in = null;
		try {
			URL url = new URL(address);
			out = new BufferedOutputStream(
				new FileOutputStream(localFileName));
			conn = url.openConnection();
			in = conn.getInputStream();
			byte[] buffer = new byte[1024];
			int numRead;
			long numWritten = 0;
			while ((numRead = in.read(buffer)) != -1) {
				out.write(buffer, 0, numRead);
				numWritten += numRead;
			}
			System.out.println(localFileName + "\t" + numWritten);
		} catch (Exception exception) {
			exception.printStackTrace();
		} finally {
			
		}
	}

	public static void filedownload(String address) {
		int lastSlashIndex = address.lastIndexOf('/');
		if (lastSlashIndex >= 0 &&
		    lastSlashIndex < address.length() - 1) {
			filedownload(address, address.substring(lastSlashIndex + 1));
		} else {
			System.err.println("Could not figure out local file name for " +
				address);
		}
	}

	/*public static void main(String[] args) {
		for (int i = 0; i < args.length; i++) {
			filedownload(args[i]);
		}
	}*/
}

