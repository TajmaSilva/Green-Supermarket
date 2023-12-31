import java.io.File;
import java.io.IOException;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import com.connection.DatabaseConnection;
import java.util.Collection;

@WebServlet("/AddProducts")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,   // 2MB
                 maxFileSize = 1024 * 1024 * 10,        // 10MB
                 maxRequestSize = 1024 * 1024 * 50)     // 50MB
public class AddProducts extends HttpServlet {

    private final String UPLOAD_DIRECTORY = "C:\\Users\\Ranuka Jayesh\\Desktop\\supermarket\\supermarket\\web\\uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        try {
            String imageName = null;

            Collection<Part> parts = request.getParts();
            for (Part part : parts) {
                if ("uploadLogo".equals(part.getName())) {
                    imageName = getFileName(part);
                    part.write(UPLOAD_DIRECTORY + File.separator + imageName);
                    break; // Assuming there is only one file upload field
                }
            }

            String productName = request.getParameter("pname");
            String productPrice = request.getParameter("price");
            String descrip = request.getParameter("description");
            String mrpPrice = request.getParameter("mprice");
            String status = request.getParameter("status");
            String category = request.getParameter("category");

            String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder salt = new StringBuilder();
            Random rnd = new Random();
            while (salt.length() < 3) {
                int index = (int) (rnd.nextFloat() * SALTCHARS.length());
                salt.append(SALTCHARS.charAt(index));
            }
            String code = salt.toString();

            int id = 0;
            String imagePath = UPLOAD_DIRECTORY + File.separator + imageName;
            int i = DatabaseConnection.insertUpdateFromSqlQuery(
                    "INSERT INTO tblproduct(id, active, code, description, image, image_name, name, price, mrp_price, product_category) VALUES('"
                            + id + "','" + status + "','" + code + "','" + descrip + "','" + imagePath + "','"
                            + imageName + "','" + productName + "','" + productPrice + "','" + mrpPrice + "','"
                            + category + "')");

            if (i > 0) {
                String success = "Product added successfully.";
                session.setAttribute("message", success);
                response.sendRedirect("admin-add-product.jsp");
            }
        } catch (IOException e) {
            request.setAttribute("message", "File Upload or Database Insertion Failed");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
