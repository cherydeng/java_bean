package entity;
import java.util.*;
import java.io.*;

public class Car implements Serializable{

    Hashtable list =  new Hashtable();
    String item = "welcome";
    int mount = 0;
    String unit = null;

    public Car(){}

    public void setItem(String item) {
        this.item = item;
    }

    public String getItem() {
        return item;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getUnit() {
        return unit;
    }

    public int getMount() {
        return mount;
    }

    public void setMount(int mount) {
        this.mount = mount;
    }

    public void add(){
        String str = "Name:"+item+" Mount:"+mount+"  Unit:"+unit;

        list.put(item,str);

    }

    public Hashtable List() {
        return list;
    }

    public void delete(String s){
        list.remove(s);
    }
}
