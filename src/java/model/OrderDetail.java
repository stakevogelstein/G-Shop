/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Van Minh Tuan
 */
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@Builder
//@Data
//@AllArgsConstructor
//@NoArgsConstructor
//@Getter
//@Setter
//@ToString
public class OrderDetail {

    private int product_quantity;
    private Order order;
    private Product product;
    private double price;

    public OrderDetail() {
    }

    public OrderDetail(int product_quantity, Order order, Product product, double price) {
        this.product_quantity = product_quantity;
        this.order = order;
        this.product = product;
        this.price = price;
    }

    public int getProduct_quantity() {
        return product_quantity;
    }

    public void setProduct_quantity(int product_quantity) {
        this.product_quantity = product_quantity;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "product_quantity=" + product_quantity + ", order=" + order + ", product=" + product + ", price=" + price + '}';
    }
    
    
}
