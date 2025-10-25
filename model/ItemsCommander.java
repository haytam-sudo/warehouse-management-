package model;

import java.util.HashMap;

public class ItemsCommander {
    private String items_commander_id;
    private HashMap<String, Integer> items;

    // Constructor
    public ItemsCommander(String items_commander_id, HashMap<String, Integer> items) {
        this.items_commander_id = items_commander_id;
        this.items = items != null ? items : new HashMap<>();
    }

    // Add an item
    public void addItem(String itemId, int quantity) {
        items.put(itemId, quantity);
    }

    // Remove an item
    public void removeItem(String itemId) {
        items.remove(itemId);
    }

    // Update quantity of an existing item
    public void updateQuantity(String itemId, int quantity) {
        if (items.containsKey(itemId)) {
            items.put(itemId, quantity);
        }
    }

    // Getters and Setters
    public String getItems_commander_id() {
        return items_commander_id;
    }

    public void setItems_commander_id(String items_commander_id) {
        this.items_commander_id = items_commander_id;
    }

    public HashMap<String, Integer> getItems() {
        return items;
    }

    public void setItems(HashMap<String, Integer> items) {
        this.items = items;
    }

}
