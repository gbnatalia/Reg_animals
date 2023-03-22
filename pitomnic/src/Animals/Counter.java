package Animals;

public class Counter {

    private int MyCounter;

    public Counter() {
        MyCounter = 0;
    }

    public void add(){
        MyCounter++;
    }

    public int value(){
        return MyCounter;
    }
}
