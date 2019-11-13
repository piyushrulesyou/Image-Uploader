package com.uploadImageInDb.services;

import com.uploadImageInDb.Dao.DeleteDao;
import com.uploadImageInDb.Model.ImageBean;

public class DeleteServices {

	public ImageBean deleteImage(int imageIdToBeDeleted) {

		DeleteDao deleteDao = new DeleteDao();
		ImageBean deletedImageBean = deleteDao.deleteImageFromDb(imageIdToBeDeleted);
		
		return deletedImageBean;
		
	}

}
