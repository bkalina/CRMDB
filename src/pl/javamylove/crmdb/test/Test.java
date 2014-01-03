package pl.javamylove.crmdb.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pl.javamylove.crmdb.dao.PhoneNumberDAO;


public class Test {

	public static void main(String[] args) {

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"pl/javamylove/crmdb/config/dao-config.xml");
		
		PhoneNumberDAO pnDao = (PhoneNumberDAO) context.getBean("phoneNumberDao");
		
		pnDao.getNumbersList();
		
	}

}
