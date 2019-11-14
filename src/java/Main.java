import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import webidl.WebIDLParser;
import webidl.core.WebIDL;

public class Main {

	public static void main(String[] args) throws IOException {
		String contents = new String(Files.readAllBytes(Paths.get("whatwg/dom/dom.bs")));
		// Simple hacks to tidy things up
		contents = contents.replaceAll("<pre class=\"idl\">", OPEN_TAG);
		contents = contents.replaceAll("<pre class=idl force=\"Document\">", OPEN_TAG);
		// Extract the WebIDL
		String webidl = extractWebIDL(contents);
		System.out.println(webidl);
		// Parse WebIDL
		List<WebIDL.Definition> declarations = parseWebIDL(webidl);
		// Output Whiley API
	}

	private static final String OPEN_TAG = "<pre class=idl>";
	private static final String CLOSE_TAG = "</pre>";

	/**
	 * Extract the WebIDL from the input string. Sections of WebIDL are identified
	 * as starting with "<pre class=idl", etc.
	 *
	 * @param contents
	 * @return
	 */
	private static String extractWebIDL(String contents) {
		String result = "";
		int i=0;
		while(i < contents.length()) {
			int start = OPEN_TAG.length() + matchFirst(contents,i,OPEN_TAG);
			if(start < contents.length()) {
				int end = matchFirst(contents,start,CLOSE_TAG);
				result += contents.substring(start,end);
			}
			i = start;
		}
		return result;
	}

	private static int matchFirst(String contents, int start, String sequence) {
		for(int i=start;i!=contents.length();++i) {
			if(contents.startsWith(sequence, i)) {
				return i;
			}
		}
		return contents.length();
	}

	private static List<WebIDL.Definition> parseWebIDL(String contents) {
		ArrayList<WebIDL.Definition> decls = new ArrayList<>();
		WebIDLParser parser = new WebIDLParser(contents);
		WebIDL.Definition decl;
		while((decl = parser.parse()) != null) {
			decls.add(decl);
		}
		return decls;
	}
}
