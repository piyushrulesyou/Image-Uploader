package com.uploadImageInDb.services;

import com.uploadImageInDb.Dao.UpdateDao;
import com.uploadImageInDb.Model.ImageBean;

public class UpdateImageServices {

	public ImageBean updateImage(int imageIdToBeUpdated, String newImageName) {

		UpdateDao updateDao = new UpdateDao();
		ImageBean imageToBeUpdated = updateDao.getDetailsOfImageAndDeleteOldImage(imageIdToBeUpdated);

		imageToBeUpdated.setImagename(newImageName);

		updateDao.addUpdateImagesToDatabase(imageToBeUpdated);

		return imageToBeUpdated;

	}

}
