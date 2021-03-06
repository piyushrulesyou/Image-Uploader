
<%@ page import=" com.uploadImageInDb.Model.LoginBean"%>
<%@ page import=" com.uploadImageInDb.Model.ImageBean"%>
<%@ page import=" java.util.List"%>
<%@ page import=" java.util.*"%>
<%@ page import=" java.io.*"%>
<%@ page import=" java.util.ArrayList"%>
<%@ page import=" java.sql.Blob"%>
<%@ page import=" java.awt.image.BufferedImage"%>
<%@ page import=" javax.imageio.ImageIO"%>
<%@ page import=" java.io.ByteArrayInputStream"%>
<%@ page import=" java.text.DecimalFormat"%>
<%@ page import=" java.math.RoundingMode"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>




<!DOCTYPE html>
<html>
<head>
<script>
	function refreshPage() {
		document.getElementById("imageForm").reset();
	}
</script>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<meta charset="ISO-8859-1">
<title>Upload Image</title>
</head>
<body>

	<%
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
		if (session.getAttribute("userLoginInfo") == null) {
			request.setAttribute("error", "Please Login First");
			request.getRequestDispatcher("/LoginPage.jsp").forward(request, response);

		} else {
	%>

	<form action="ImageControllerInDb" method="post"
		enctype="multipart/form-data" id="imageForm">
		<fieldset>
			<blockquote class="blockquote text-center">
				<p class="mb-0 display-4">IMAGE MANAGEMENT UTILITY</p>
			</blockquote>
			<hr>

			<p>${successMessage}</p>

			<p align="right">

				Welcome
				<%
				LoginBean userDetails = (LoginBean) session.getAttribute("userLoginInfo");

					String username = userDetails.getUsername();

					out.println(username);
			%>

				<br> <a href="LogoutControllerInDb">Sign Out</a>

			</p>
			Please select an image file to upload(Max Size 1 MB) <br> <br>
			<input type="text" id="image-div" disabled> <input
				type="file" id="image" name="image" accept="image/*" multiple
				required> <br> <br> <br>

			<p style="color: red"><%=(request.getAttribute("errorSizeExceeding") == null) ? ""
						: request.getAttribute("errorSizeExceeding")%></p>


			<button type="button" onClick="refreshPage()" style="float: right">Cancel</button>

			<input type="submit" style="float: right" value="Upload">
		</fieldset>
	</form>
	<%
		}

		LoginBean imageListTemp1 = (LoginBean) session.getAttribute("dbUser");

		List<ImageBean> imageListTemp = imageListTemp1.getImages();

		out.println("<strong>Total image(s) uploaded = " + imageListTemp.size() + "</strong>");

		if (imageListTemp.size() != 0) {
	%>
	<fieldset>
		<table class="table table-bordered table-hover">
			<thead class="thead-dark">
				<tr>
					<th>S.No</th>
					<th>Name</th>
					<th>Size</th>
					<th>Preview</th>
					<th>Action</th>
				</tr>
			</thead>
			<%
				if (session.getAttribute("dbUser") != null) {

						LoginBean imageList1 = (LoginBean) session.getAttribute("dbUser");

						List<ImageBean> imageList = imageList1.getImages();

						int i = 1;
						for (ImageBean eachImageAll : imageList) {
			%>
			<tr>
				<td>
					<%
						int imageId = eachImageAll.getImage_id();
									out.println(i);
					%> <input type="hidden" name="imgID" value="<%=imageId%>" />

				</td>

				<%
					Blob eachImageBlob = eachImageAll.getImage();
				%>
				<td>
					<%
						String imageName = eachImageAll.getImagename();
									out.println(imageName);
					%>
				</td>

				<%
					int blobImageLength = (int) eachImageBlob.length();
								byte[] eachImageByte = eachImageBlob.getBytes(1, blobImageLength);

								String imgStringBase64 = Base64.getEncoder().encodeToString(eachImageByte);
				%>

				<td>
					<%
						DecimalFormat decimalFormat = new DecimalFormat("#.###");
									decimalFormat.setRoundingMode(RoundingMode.CEILING);

									double sizeImageBytes = (imgStringBase64.length());
									double sizeImageKB = sizeImageBytes / 1024 / 1024;
									out.println(decimalFormat.format(sizeImageKB) + " MB");
					%>
				</td>


				<td>
					<%
						out.println(
											"<img src='data:image/jpg;base64," + imgStringBase64 + "' width='100' height='100'/>");
					%>
				</td>

				<td><a href="UpdateImageControllerInDb?imageId=<%=imageId%>"><button
							value="Edit">Edit</button></a> <a
					href="DeleteControllerInDb?imageId=<%=imageId%>"><button
							value="Delete">Delete</button></a></td>

				<%
					i++;
							}
						}
				%>
			</tr>
		</table>
	</fieldset>
	<%
		}
	%>


</body>


</html>