package cn.dds.entity;

import java.io.Serializable;
import java.util.List;

//一级目录
public class Category  implements Serializable {
    private int category_id;
    private String category_name;
    private List<Catalogue>  catalogues;//二级目录

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public List<Catalogue> getCatalogues() {
        return catalogues;
    }

    public void setCatalogues(List<Catalogue> catalogues) {
        this.catalogues = catalogues;
    }

    @Override
    public String toString() {
        return "Category{" +
                "catagory_id=" + category_id +
                ", catagory_name='" + category_name + '\'' +
                ", catalogues=" + catalogues +
                '}';
    }
}
