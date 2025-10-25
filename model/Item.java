package model;

public class Item {
    private String item_name = "";
    private int quantity = 0; // quantity in the warhouse
    private String warehouse_name = "";
    private int prix = 0;

    public Item(String item_name, int quantity, String warehouse_name, int prix) {
        this.item_name = item_name;
        this.quantity = quantity;
        this.warehouse_name = warehouse_name;
    }

    // setters and getters
    public String get_item_name() {
        return item_name;
    }

    public int get_quantity() {
        return quantity;
    }

    public String get_warhouse_name() {
        return warehouse_name;
    }

    public int get_price() {
        return price;
    }
}
