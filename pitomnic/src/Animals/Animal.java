package Animals;

import java.util.ArrayList;
import java.util.List;

// Класс животного
public class Animal {
    private String      name;                         // Имя животного
    private String      species;                      // Вид животного
    private int         age;                          // Возраст животного
    private List<String> commands;// = {"Есть", "Спать"}; // Список команд животного

    // конструктор класса
    public Animal(String name, String species, int age) {
        this.name = name;
        this.species = species;
        this.age = age;
        this.commands = new ArrayList<>();
        this.commands.add("Есть");
        this.commands.add("Спать");
    }

    // получение имени животного
    public String getName(){
        return this.name;
    }

    public void setName(String name){
        this.name = name;
    }

    // получение вида животного
    public String getSpecies(){
        return this.species;
    }

    public void setSpecies(String species){
        this.species = species;
    }

    // получение возраста животного
    public int getAge(){
        return this.age;
    }

    public void setAge(int age){
        this.age = age;
    }

    // Выводит список команд животного
    public void printCommands() {
        for (int i = 0; i < commands.size(); i++) {
            System.out.println(this.commands.get(i));
        }
    }

    // Добавление команды
    public void addCommand(String command) {
        this.commands.add(command);
    }

}