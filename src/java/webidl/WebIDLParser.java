package webidl;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import webidl.core.WebIDL.*;

public class WebIDLParser {
	private final String contents;
	private int index;

	public WebIDLParser(String contents) {
		this.contents = contents;
	}

	public Definition parse() {
		List<ExtendedAttribute> attributes = parseExtendedAttributes();
		switch(lookahead()) {
		case "interface":
			return parseInterfaceDefinition(attributes);
		default:
			throw new IllegalArgumentException();
		}
	}

	private List<ExtendedAttribute> parseExtendedAttributes() {
		ArrayList<ExtendedAttribute> attributes = new ArrayList<>();
		if(tryAndMatch("[") != null) {
			while(tryAndMatch("]") == null) {
				if(!attributes.isEmpty()) {
					match(",");
				}
				attributes.add(parseExtendedAttribute());
				System.out.println("MATCHED");
			}
		}
		return attributes;
	}

	private ExtendedAttribute parseExtendedAttribute() {
		Identifier name = parseIdentifier();
		Identifier[] list = new Identifier[0];
		if(tryAndMatch("=") != null) {
			if(tryAndMatch("(") != null) {
				ArrayList<Identifier> ids = new ArrayList<>();
				while(tryAndMatch(")") == null) {
					if(!ids.isEmpty()) {
						match(",");
					}
					ids.add(parseIdentifier());
				}
				list = ids.toArray(new Identifier[ids.size()]);
			} else {
				list = new Identifier[] {parseIdentifier()};
			}
		}
		return new ExtendedAttribute(name,list);
	}

	private Interface parseInterfaceDefinition(List<ExtendedAttribute> attributes) {
		match("interface");
		Identifier name = parseIdentifier();
		Identifier parent = null;
		if (tryAndMatch(":") != null) {
			parent = parseIdentifier();
		}
		match("{");
		List<Member> members = new ArrayList<>();
		while (tryAndMatch("}") == null) {
			members.add(parseInterfaceMember());
		}
		return new Interface(attributes, name, parent, members);
	}

	private Member parseInterfaceMember() {
		List<ExtendedAttribute> attributes = parseExtendedAttributes();
		switch(lookahead()) {
		case "const":
			return parseConstMember(attributes);
		case "attribute":
			return parseAttributeMember(attributes);
		default:
			return parseOperationMember(attributes);
		}
	}

	private Member parseConstMember(List<ExtendedAttribute> attributes) {
		match("const");
	}

	private Member parseAttributeMember(List<ExtendedAttribute> attributes) {
		match("attribute");
	}

	private Member parseOperationMember(List<ExtendedAttribute> attributes) {

	}

	private Identifier parseIdentifier() {
		skipWhiteSpace();
		int start = index;
		if(!isIdentifierStart(contents.charAt(index))) {
			throw new IllegalArgumentException("invalid identifier: " + contents.charAt(index));
		} else {
			index = index + 1;
		}
		while (isIdentifierPart(contents.charAt(index))) {
			index = index + 1;
		}
		return new Identifier(contents.substring(start, index));
	}

	public String tryAndMatch(String item) {
		String w = lookahead();
		if(w.equals(item)) {
			match(w);
			return w;
		} else {
			return null;
		}
	}

	private void match(String item) {
		if(!contents.startsWith(item,index)) {
			throw new IllegalArgumentException("failed matching " + item);
		}
		index = index + item.length();
	}

	private String lookahead() {
		skipWhiteSpace();
		int end = index;
		if(isOperator(contents.charAt(end))) {
			end = end + 1;
		} else {
			while (isIdentifierStart(contents.charAt(end))
					|| (end != index && isIdentifierPart(contents.charAt(end)))) {
				end = end + 1;
			}
		}
		return contents.substring(index, end);
	}

	private static char[] OPERATORS = {'[',']','(',')','=',','};
	private boolean isOperator(char ch) {
		for(int i=0;i!=OPERATORS.length;++i) {
			if(OPERATORS[i] == ch) {
				return true;
			}
		}
		return false;
	}

	private boolean isIdentifierStart(char ch) {
		return Character.isJavaIdentifierStart(ch);
	}

	private boolean isIdentifierPart(char ch) {
		return Character.isJavaIdentifierStart(ch);
	}

	private void skipWhiteSpace() {
		while(Character.isWhitespace(contents.charAt(index))) {
			index = index + 1;
		}
	}
}
