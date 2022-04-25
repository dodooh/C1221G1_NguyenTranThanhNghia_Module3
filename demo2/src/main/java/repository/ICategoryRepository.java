package repository;

import java.util.List;
import model.Category;

public interface ICategoryRepository {

    List<Category> selectAll();
}
