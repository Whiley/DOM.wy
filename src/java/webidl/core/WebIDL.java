package webidl.core;

import java.util.ArrayList;
import java.util.List;

public class WebIDL {
	public interface Definition {

	}


	public static class Interface extends AbstractDefinition {
		private final Identifier name;
		private final Identifier parent;
		private final List<Member> members;

		public Interface(List<ExtendedAttribute> attributes, Identifier name, Identifier parent, List<Member> members) {
			super(attributes);
			this.name = name;
			this.parent = parent;
			this.members = new ArrayList<>(members);
		}

		public Identifier getName() {
			return name;
		}

		public Identifier getParent() {
			return parent;
		}

		public List<Member> getMembers() {
			return members;
		}
	}


	public static interface Member {

	}

	public static abstract class AbstractDefinition implements Definition {
		private final List<ExtendedAttribute> attributes;

		public AbstractDefinition(List<ExtendedAttribute> attributes) {
			this.attributes = attributes;
		}

		public List<ExtendedAttribute> getAttributes() {
			return attributes;
		}
	}


	public static class ExtendedAttribute {
		private Identifier name;
		private Identifier[] items;

		public ExtendedAttribute(Identifier name, Identifier... items) {
			this.name = name;
			this.items = items;
		}

		public Identifier getName() {
			return name;
		}

		public int size() {
			return items.length;
		}

		public Identifier get(int ith) {
			return items[ith];
		}
	}

	public static class Identifier {
		private final String name;

		public Identifier(String name) {
			this.name = name;
		}

		@Override
		public String toString() {
			return name;
		}

		@Override
		public boolean equals(Object o) {
			if(o instanceof Identifier) {
				return ((Identifier)o).name.equals(name);
			}
			return false;
		}

		@Override
		public int hashCode() {
			return name.hashCode();
		}
	}
}
