package service.impl;

import java.util.List;
import model.Category;
import repository.ICategoryRepository;
import repository.impl.CategoryRepositoryImpl;
import service.ICategoryService;

public class CategoryServiceImpl implements ICategoryService {
    private final ICategoryRepository iCategoryRepository = new CategoryRepositoryImpl();
    @Override
    public List<Category> selectAllCategory() {
        return iCategoryRepository.selectAll();
    }
}
