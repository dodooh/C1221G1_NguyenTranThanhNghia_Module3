package repository.impl;

import static java.util.stream.Collectors.toList;

import java.util.ArrayList;
import java.util.List;
import model.Product;
import repository.IProductRepository;

public class ProductRepositoryImpl implements IProductRepository {
    private static final List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(10,"Iphone X", 1299.9, "Hang nay con nhieu", "Apple"));
        productList.add(new Product(2,"Iphone 11", 1239.9, "Hang nay con nhieu", "Apple"));
        productList.add(new Product(3,"Iphone 12", 1349.9, "Hang nay con nhieu", "Apple"));
        productList.add(new Product(4,"Iphone 13", 1459.9, "Hang nay con nhieu", "Apple"));
        productList.add(new Product(5,"Iphone 14", 1679.9, "Hang nay con nhieu", "Apple"));
        productList.add(new Product(15,"Iphone 15", 1969.9, "Hang nay con it", "Samsung"));
    }

    @Override
    public List<Product> getList() {
        List<Product> cloneProducts = productList.stream().map(Product::new).collect(toList());
        return cloneProducts;
    }

    @Override
    public void save(Product product) {
        productList.add(product);
    }

    @Override
    public void update(int index, Product newProduct) {
        productList.set(index, newProduct);
    }

    @Override
    public void remove(int index) {
        productList.remove(index);
    }
}
