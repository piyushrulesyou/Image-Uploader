package com.uploadImageInDb.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.uploadImageInDb.Model.ImageBean;
import com.uploadImageInDb.Model.LoginBean;

public class ImageDao {

	public void storeImageInDataBase(ImageBean userImage) {

		Configuration configuration = new Configuration().configure().addAnnotatedClass(ImageBean.class).addAnnotatedClass(LoginBean.class);
		
		SessionFactory sessionFactory2 = configuration.buildSessionFactory();
		
		Session session = sessionFactory2.openSession();
		
		Transaction transaction = session.beginTransaction();
		
		session.save(userImage);
		
		transaction.commit();
	}

	
}
