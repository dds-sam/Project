package cn.dds.entity;

import java.io.Serializable;

//二级目录
public class Catalogue implements Serializable {
    private int catalogue_id;
    private String catalogue_name;
    private Category category;

    public int getCatalogue_id() {
        return catalogue_id;
    }

    public void setCatalogue_id(int catalogue_id) {
        this.catalogue_id = catalogue_id;
    }

    public String getCatalogue_name() {
        return catalogue_name;
    }

    public void setCatalogue_name(String catalogue_name) {
        this.catalogue_name = catalogue_name;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Catalogue{" +
                "catalogue_id=" + catalogue_id +
                ", catalogue_name='" + catalogue_name + '\'' +
                ", category=" + category +
                '}';
    }
}
