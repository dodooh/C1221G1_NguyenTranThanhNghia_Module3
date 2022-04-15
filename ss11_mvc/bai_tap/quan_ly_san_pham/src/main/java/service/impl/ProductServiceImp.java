package service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.IntStream;
import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepositoryImpl;
import service.IProductService;

public class ProductServiceImp implements IProductService<Product> {

    private final IProductRepository iProductRepository = new ProductRepositoryImpl();

    @Override
    public List<Product> getListProduct() {
        return iProductRepository.getList();
    }

    private Map<String, String> validate(Product product) {
        Map<String, String> errorMap = new HashMap<>();
        if (product.getName().length() <= 4) {
            errorMap.put("name", "Name must be > 4 characters length.");
        }
        if (product.getPrice() == null) {
            errorMap.put("price", "Price can't be empty");
        } else if (product.getPrice() <= 0) {
            errorMap.put("price", "Price must be > 0.");
        }
        if (product.getManufactor().length() == 0) {
            errorMap.put("manufacture", "Manufacture must not be empty");
        }
        return errorMap;
    }



    @Override
    public Map<String, String> save(Product product) {
        Map<String, String> errorMap = validate(product);
        if (errorMap.isEmpty()) {
            iProductRepository.save(product);
        }
        return errorMap;
    }

    @Override
    public Product findById(int id) {
        return getListProduct().stream().filter(c -> c.getId() == id).findFirst().orElse(null);
    }

    private int getIndexOfProduct(int id) {
        return IntStream.range(0, getListProduct().size())
            .filter(i -> getListProduct().get(i).getId() == id)
            .findFirst().orElse(-1);
    }

    @Override
    public Map<String, String> update(int id, Product product) {
        Map<String, String> errorMap = validate(product);
        if (errorMap.isEmpty()) {
            int indexToEdit = getIndexOfProduct(id);
            iProductRepository.update(indexToEdit, product);
        }
        return errorMap;
    }

    @Override
    public void remove(int id) {
        int index = getIndexOfProduct(id);
        iProductRepository.remove(index);
    }
}

