package model;

public class StringFilter {
	
	public static String doFilter(String input) {
		StringBuffer filtered = new StringBuffer(input.length());
		for(int i=0;i<input.length();i++) {
			char c = input.charAt(i);
			if(c=='<')
				filtered.append("&lt;");
			else if(c=='>')
				filtered.append("&gt;");
			else if(c=='"')
				filtered.append("&quot;");
			else if(c=='&')
				filtered.append("&amp;");
			else
				filtered.append(c);
		}
		return filtered.toString();
	}
}
