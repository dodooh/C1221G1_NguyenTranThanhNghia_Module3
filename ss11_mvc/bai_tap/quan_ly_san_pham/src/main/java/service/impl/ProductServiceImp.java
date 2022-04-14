package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepositoryImpl;
import service.IProductService;

public class ProductServiceImp implements IProductService<Product> {
    private IProductRepository iProductRepository = new ProductRepositoryImpl();


}
