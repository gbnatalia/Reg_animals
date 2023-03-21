package Animals;

public class Counter {

    private int MyCounter;

    public Counter() {
        this.MyCounter = 0;
    }

    public void add(){
        this.MyCounter++;
    }

    public int value(){
        return this.MyCounter;
    }
}
