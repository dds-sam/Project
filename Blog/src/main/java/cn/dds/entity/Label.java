package cn.dds.entity;

public class Label {
    private int label_id;
    private String label_name;
    private int label_number;

    public int getLabel_id() {
        return label_id;
    }

    public void setLabel_id(int label_id) {
        this.label_id = label_id;
    }

    public String getLabel_name() {
        return label_name;
    }

    public void setLabel_name(String label_name) {
        this.label_name = label_name;
    }

    public int getLabel_number() {
        return label_number;
    }

    public void setLabel_number(int label_number) {
        this.label_number = label_number;
    }

    @Override
    public String toString() {
        return "Label{" +
                "label_id=" + label_id +
                ", label_name='" + label_name + '\'' +
                ", label_number=" + label_number +
                '}';
    }
}
