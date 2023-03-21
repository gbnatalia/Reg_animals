/*
13, 14. Написать программу в стиле ООП, имитирующую работу реестра домашних животных.
В программе должен быть реализован следующий функционал:
    14.1 Завести новое животное
    14.2 определять животное в правильный класс
    14.3 увидеть список команд, которое выполняет животное
    14.4 обучить животное новым командам
    14.5 Реализовать навигацию по меню

15. Создайте класс Счетчик, у которого есть метод add(), увеличивающий̆
значение внутренней̆ int переменной̆ на 1 при нажатии “Завести новое
животное” Сделайте так, чтобы с объектом такого типа можно было работать
в блоке try-with-resources.
Нужно бросить исключение, если работа с объектом типа счетчик была не в ресурсном
try и/или ресурс остался открыт. Значение считать в ресурсе try, если при заведении
животного заполнены все поля.
 */

import Animals.Animal;
import Animals.Counter;


import java.util.Scanner;

public class AnimalRegistry {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        // Создаем переменную-счетчик для подсчета количества заведенных животныхВ
        Counter counter = new Counter();

        // Создаем пустой массив для хранения животных
        Animal[] animals = new Animal[10];

        // Запускаем бесконечный цикл меню
        while (true) {

            System.out.println("=== Регистрация домашних животных ===");
            System.out.println("1. Завести новое животное");
            System.out.println("2. Определить животное в правильный класс");
            System.out.println("3. Увидеть список команд, которые выполняет животное");
            System.out.println("4. Обучить животное новым командам");
            System.out.println("5. Выйти из программы");
            System.out.print("Выберите пункт меню: ");

            int choice = Integer.parseInt(scanner.nextLine());

            switch (choice) {
                case 1:
                    try {

                        // Создаем новое животное
                        System.out.print("Введите имя животного: ");
                        String name = scanner.nextLine();

                        System.out.print("Введите вид животного: ");
                        String species = scanner.nextLine();

                        System.out.print("Введите возраст животного: ");
                        int age = Integer.parseInt(scanner.nextLine());

                        Animal animal = new Animal(name, species, age);
                        animals[counter.value()] = animal;

                        // Увеличиваем счетчик на 1 при успешном заведении нового животного
                        counter.add();

                        System.out.println("Животное успешно зарегистрировано!");

                    } catch (IllegalStateException e) {

                        System.out.println("Ошибка: " + e.getMessage());

                    }
                    break;

                case 2:

                    System.out.print("Введите номер животного, чтобы определить его вид: ");
                    int index = Integer.parseInt(scanner.nextLine());

                    if (animals[index] != null) {
                        System.out.println("Вид животного: " + animals[index].getSpecies());
                    } else {
                        System.out.println("Ошибка: животное с таким номером не найдено.");
                    }


                    break;

                case 3:
                    System.out.print("Введите номер животного, чтобы увидеть список команд: ");
                    int index2 = Integer.parseInt(scanner.nextLine());

                    if (animals[index2] != null) {
                        System.out.println("Список команд для животного:");
                        animals[index2].printCommands();
                    } else {
                        System.out.println("Ошибка: животное с таким номером не найдено.");
                    }
                    break;

                case 4:

                    System.out.print("Введите номер животного, чтобы обучить его новым командам: ");
                    int index3 = Integer.parseInt(scanner.nextLine());

                    if (animals[index3] != null) {
                        System.out.print("Введите новую команду для животного: ");
                        String command = scanner.nextLine();

                        animals[index3].addCommand(command);

                        System.out.println("Новая команда успешно добавлена!");
                    } else {
                        System.out.println("Ошибка: животное с таким номером не найдено.");
                    }
                    break;

                case 5:

                    System.out.println("Выход из программы...");
                    return;

                default:

                    System.out.println("Ошибка: некорректный выбор.");
            }
            System.out.println();
        }
    }
}