package dexguard.me.chago.dexguard;

/**
 * Created by chago on 2017-04-13.
 */
public class Man {
    private String name = "Jack";
    private int age = -1;

    public Man(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public Man() {
        name = "The man is no one";
        age = 0;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }
}
