package com.uploadImageInDb.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.uploadImageInDb.Model.ImageBean;
import com.uploadImageInDb.Model.LoginBean;

public class DeleteDao {

	public ImageBean deleteImageFromDb(int imageIdToBeDeleted) {

		ImageBean deletedImageBean = new ImageBean();

		Configuration configuration = new Configuration().configure().addAnnotatedClass(LoginBean.class)
				.addAnnotatedClass(ImageBean.class);

		SessionFactory sessionFactory = configuration.buildSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();

		deletedImageBean = (ImageBean) session.get(ImageBean.class, imageIdToBeDeleted);

		session.delete(deletedImageBean);

		transaction.commit();

		return deletedImageBean;

	}

}
