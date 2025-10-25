package model;

import folderjavaconection.*;

import java.util.HashMap;

public class Order {
    private String command_id;
    private int prix_total;
    private String order_date;
    private ItemsCommander items_comm;
    private boolean order_finished = false;

    public Order(String command_id, int prix_total, String order_date, HashMap<String, Integer> items_map) {
        this.command_id = command_id;
        this.prix_total = prix_total;
        this.order_date = order_date;
        this.items_comm = new ItemsCommander(command_id, items_map);
    }

    // Getters and Setters
    public String getCommand_id() {
        return command_id;
    }

    public void setCommand_id(String command_id) {
        this.command_id = command_id;
    }

    public int getPrix_total() {
        return prix_total;
    }

    public void setPrix_total(int prix_total) {
        this.prix_total = prix_total;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public ItemsCommander getItems_comm() {
        return items_comm;
    }

    public void setItems_comm(ItemsCommander items_comm) {
        this.items_comm = items_comm;
    }

    public void setOrder_finished() {
        this.order_finished = true;
    }

    public boolean getOrder_finished() {
        return this.order_finished;
    }

    // Calcul prix total
    private int calculPrixTotal() {
        this.prix_total = 0;
        HashMap<String, Integer> items = items_comm.getItems();
        for (String i : items.keySet()) {
            prix_total += get_item_price(i) * items.get(i); // to add
        }
        return prix_total;
    }

}
