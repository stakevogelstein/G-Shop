/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author LOC
 */
public class ProductDAO extends DBContext {

    public Vector<Product> getAll() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "select * from [product]";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id"), quantity = rs.getInt("quantity"), brand_id = rs.getInt("brand_id");
                String name = rs.getString("name"), description = rs.getString("description"), image_url = rs.getString("image_url");
                double price = rs.getDouble("price");
                Date release_date = rs.getDate("release_date");

                products.add(new Product(id, quantity, brand_id, name, description, image_url, price, release_date));
            }
            return products;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Vector<Product> getProductsByBrand(int bid) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "select * from [product] where brand_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, bid);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id"), quantity = rs.getInt("quantity"), brand_id = rs.getInt("brand_id");
                String name = rs.getString("name"), description = rs.getString("description"), image_url = rs.getString("image_url");
                double price = rs.getDouble("price");
                Date release_date = rs.getDate("release_date");

                products.add(new Product(id, quantity, brand_id, name, description, image_url, price, release_date));
            }
            return products;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Vector<Product> sortProductsByPrice(String ord) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "select * from [product] order by price " + ord;
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id"), quantity = rs.getInt("quantity"), brand_id = rs.getInt("brand_id");
                String name = rs.getString("name"), description = rs.getString("description"), image_url = rs.getString("image_url");
                double price = rs.getDouble("price");
                Date release_date = rs.getDate("release_date");

                products.add(new Product(id, quantity, brand_id, name, description, image_url, price, release_date));
            }
            return products;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Vector<Product> filterByTag(String tag) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "";
        if (tag.equals("new")) {
            tag = "2023-07-06";
            sql = "select * from [product] where release_date = ?";
        }

        if (tag.equals("hot")) {
            tag = "Hot";
            sql = "select * from [product] where description like ?";
        }

        System.out.println(sql);
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, tag);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id"), quantity = rs.getInt("quantity"), brand_id = rs.getInt("brand_id");
                String name = rs.getString("name"), description = rs.getString("description"), image_url = rs.getString("image_url");
                double price = rs.getDouble("price");
                Date release_date = rs.getDate("release_date");

                products.add(new Product(id, quantity, brand_id, name, description, image_url, price, release_date));
            }
            return products;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Vector<Product> filterBySearch(String s) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "select * from [product] where name LIKE '%" +s+"%'";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id"), quantity = rs.getInt("quantity"), brand_id = rs.getInt("brand_id");
                String name = rs.getString("name"), description = rs.getString("description"), image_url = rs.getString("image_url");
                double price = rs.getDouble("price");
                Date release_date = rs.getDate("release_date");

                products.add(new Product(id, quantity, brand_id, name, description, image_url, price, release_date));
            }
            return products;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        System.out.println(dao.filterBySearch("MLB"));
    }
    
    public Vector<Product> getProductsByKeywords(String s) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "select * from [product] where name like ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + s + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id"), quantity = rs.getInt("quantity"), brand_id = rs.getInt("brand_id");
                String name = rs.getString("name"), description = rs.getString("description"), image_url = rs.getString("image_url");
                double price = rs.getDouble("price");
                Date release_date = rs.getDate("release_date");

                products.add(new Product(id, quantity, brand_id, name, description, image_url, price, release_date));
            }
            return products;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
     public Product getProductsById(int productId) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Product product = null;
        String sql = "select * from [product] where id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id"), quantity = rs.getInt("quantity"), brand_id = rs.getInt("brand_id");
                String name = rs.getString("name"), description = rs.getString("description"), image_url = rs.getString("image_url");
                double price = rs.getDouble("price");
                Date release_date = rs.getDate("release_date");

                product = new Product(id, quantity, brand_id, name, description, image_url, price, release_date);
            }
            return product;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     
     
     public void updateProduct(Product p, int pid) {
        PreparedStatement stm = null;

        String sql = "UPDATE [dbo].[product]\n"
                + "   SET [name] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[release_date] = ?\n"
                + " WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, p.getName());
            stm.setDouble(2, p.getPrice());
            stm.setInt(3, p.getQuantity());
            stm.setDate(4, p.getRelease_date());
            stm.setInt(5, pid);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        
        }
     }
     
     public int insertProduct(Product p) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        int generatedId = -1;

        String sql = "INSERT INTO [dbo].[product]\n"
                + "           ([name]\n"
                + "           ,[price]\n"
                + "           ,[quantity]\n"
                + "           ,[description]\n"
                + "           ,[image_url]\n"
                + "           ,[brand_id]\n"
                + "           ,[release_date])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, ?)";
        try {
            stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, p.getName());
            stm.setDouble(2, p.getPrice());
            stm.setInt(3, p.getQuantity());
            stm.setString(4, p.getDescription());
            stm.setString(5, p.getImage_url());
            stm.setInt(6, p.getBrand_id());
            stm.setDate(7, p.getRelease_date());
            stm.executeUpdate();

            //get generatedId
            rs = stm.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                rs.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return generatedId;
    }
     public int deletetProduct(int id) {
        int n = 0;
        PreparedStatement stm = null;
        ResultSet rs = getData("select * from [dbo].[order_detail] where product_id = " + id);

        String sql = "DELETE FROM [dbo].[product]\n"
                + "      WHERE id = ?";
        try {
            if (!rs.next()) {
                stm = connection.prepareStatement(sql);
                stm.setInt(1, id);

                n = stm.executeUpdate();
            }

        } catch (SQLException ex) {
            n = -1;
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }   
        return n;
    }
     
     
}
