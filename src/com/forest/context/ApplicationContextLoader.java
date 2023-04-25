package com.forest.context;

import java.lang.reflect.Method;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class ApplicationContextLoader {
	
	public static void build(String beanConfigXml)throws Exception{
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = factory.newDocumentBuilder();
		Document document = documentBuilder.parse(beanConfigXml);
		
		Element root = document.getDocumentElement();
		
		//System.out.println(root.getTagName());

		if(root == null || !root.getTagName().equals("beans")) return;
		
		Map<String, Object> applicationContext = ApplicationContext.getApplicationContext();
		
		NodeList beans = root.getElementsByTagName("bean");
		for(int i = 0; i < beans.getLength(); i++) { //bean instance 생성
			//System.out.println(beans.item(i).getNodeName());
			
			Node bean = beans.item(i);
			if(bean.getNodeType() == Node.ELEMENT_NODE) {
				Element ele = (Element) bean;
				
				String id = ele.getAttribute("id");
				String classType = ele.getAttribute("class");
				
				//System.out.printf("id : %s, class=%s\n", id,classType);
				
				Class<?> cls = Class.forName(classType);
				Object targetObj = cls.newInstance(); //single tone
				applicationContext.put(id, targetObj);// beans에서 bean id, class 뽑기
				
				System.out.println("id : " + id + ", class : " + targetObj);
			}
		}
		
		//의존주입
		for(int i = 0; i < beans.getLength(); i++) {
			Node bean = beans.item(i);
			
			NodeList properties = bean.getChildNodes();
			for(int j= 0; j < properties.getLength(); j++) {
				Node property = properties.item(j);
				if(!property.getNodeName().equals("property")) continue;
				
				if(property.getNodeType() == Node.ELEMENT_NODE) {
					Element ele = (Element) property;
					String name = ele.getAttribute("name");
					String ref = ele.getAttribute("ref-value");// beans에서 bean안의 name, ref-value 뽑기
					
					//System.out.printf("name = %s,ref-value=%s\n", name,ref);
					
					String setMethodName = "set" + name.substring(0,1).toUpperCase() + name.substring(1);
					
					Element eleBean = (Element)bean;
					String className = eleBean.getAttribute("class");
					Class<?> classType = Class.forName(className);
					
					Method[] methods = classType.getMethods();
					for(Method method : methods) {
						if(method.getName().equals(setMethodName)) {
							//System.out.printf("className : %s, name : %s, setMethod : %s\n", className,name,method.getName());
							
							//method.invoke(실행할 인스턴스, 파라미터1, 파라미터2, ..)
							method.invoke(applicationContext.get(eleBean.getAttribute("id")), applicationContext.get(ref));
							System.out.println("[invoke" + applicationContext.get(eleBean.getAttribute("id")) + " : " + applicationContext.get(ref));
						}
					}
				}
			}
		}
	}
}