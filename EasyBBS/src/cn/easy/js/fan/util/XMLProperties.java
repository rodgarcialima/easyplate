package cn.easy.js.fan.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;

public class XMLProperties {
	private File file;

	private Document doc;

	private Map propertyCache = new HashMap();

	public XMLProperties(String file) {
		this.file = new File(file);
		try {
			SAXBuilder builder = new SAXBuilder();

			DataUnformatFilter format = new DataUnformatFilter();
			builder.setXMLFilter(format);
			this.doc = builder.build(new File(file));
		} catch (Exception e) {
			System.err
					.println("Error creating XML parser in PropertyManager.java");

			e.printStackTrace();
		}
	}

	public XMLProperties(File file, Document doc) {
		this.file = file;
		this.doc = doc;
	}

	public String getProperty(String name) {
		if (this.propertyCache.containsKey(name)) {
			return ((String) this.propertyCache.get(name));
		}

		String[] propName = parsePropertyName(name);

		Element element = this.doc.getRootElement();
		for (int i = 0; i < propName.length; ++i) {
			element = element.getChild(propName[i]);
			if (element == null) {
				return null;
			}

		}

		String value = element.getText();
		if ("".equals(value)) {
			return null;
		}

		value = value.trim();
		this.propertyCache.put(name, value);
		return value;
	}

	public String[] getChildrenProperties(String parent) {
		String[] propName = parsePropertyName(parent);

		Element element = this.doc.getRootElement();
		for (int i = 0; i < propName.length; ++i) {
			element = element.getChild(propName[i]);
			if (element == null) {
				return new String[0];
			}
		}

		List children = element.getChildren();
		int childCount = children.size();
		String[] childrenNames = new String[childCount];
		for (int i = 0; i < childCount; ++i) {
			childrenNames[i] = ((Element) children.get(i)).getName();
		}
		return childrenNames;
	}

	public void setProperty(String name, String value) {
		this.propertyCache.put(name, value);

		String[] propName = parsePropertyName(name);

		Element element = this.doc.getRootElement();
		for (int i = 0; i < propName.length; ++i) {
			if (element.getChild(propName[i]) == null) {
				element.addContent(new Element(propName[i]));
			}
			element = element.getChild(propName[i]);
		}

		element.setText(value);

		saveProperties();
	}

	public void deleteProperty(String name) {
		String[] propName = parsePropertyName(name);

		Element element = this.doc.getRootElement();
		for (int i = 0; i < propName.length - 1; ++i) {
			element = element.getChild(propName[i]);

			if (element == null) {
				return;
			}
		}

		element.removeChild(propName[(propName.length - 1)]);

		saveProperties();
	}

	private synchronized void saveProperties() {
		OutputStream out = null;
		boolean error = false;

		File tempFile = null;
		try {
			tempFile = new File(this.file.getParentFile(), this.file.getName()
					+ ".tmp");

			String indent = "    ";
			Format format = Format.getPrettyFormat();
			format.setIndent(indent);
			format.setEncoding("utf-8");
			XMLOutputter outp = new XMLOutputter(format);
			out = new BufferedOutputStream(new FileOutputStream(tempFile));
			outp.output(this.doc, out);
		} catch (Exception e) {
			e.printStackTrace();

			error = true;
		} finally {
			try {
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
				error = true;
			}
		}

		if (error)
			return;
		this.file.delete();

		tempFile.renameTo(this.file);
	}

	private String[] parsePropertyName(String name) {
		int size = 1;
		for (int i = 0; i < name.length(); ++i) {
			if (name.charAt(i) == '.') {
				++size;
			}
		}
		String[] propName = new String[size];

		StringTokenizer tokenizer = new StringTokenizer(name, ".");
		int i = 0;
		while (tokenizer.hasMoreTokens()) {
			propName[i] = tokenizer.nextToken();
			++i;
		}
		return propName;
	}
}
