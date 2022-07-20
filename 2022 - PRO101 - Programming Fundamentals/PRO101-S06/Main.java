/**
 * Simple menu based Java Calculator.
 * AIEP - PRO101, Week 06.
 *
 * @author Esteban Cuevas
 * Date: 2022-04-28
 * License: MIT https://opensource.org/licenses/MIT
 */

import java.util.Scanner;
import java.lang.Math;

public class Main {
    public static void main(String[] args) {
        int option = 0;

        // Main menu.
        System.out.println("Calculadora Básica. Ingrese una opción:");
        System.out.println("------------------");
        System.out.println("1. Sumar dos números");
        System.out.println("2. Restar dos números");
        System.out.println("3. Multiplicar dos números");
        System.out.println("4. Dividir dos números");
        System.out.println("5. Calcular equación de segundo grado");
        System.out.println("6. Salir de la Calculadora");
        System.out.println("------------------");

        // Init Scanner.
        Scanner scanner = new Scanner(System.in);

        try {
            // Make sure a valid option is selected.
            while (option < 1 || option > 6) {
                option = scanner.nextInt();

                if (option < 1 || option > 6) {
                    System.out.println("Opción inválida. Intente nuevamente.");
                }
            }
        } catch (Exception e) {
            // Error, what happened?
            // TODO: better error handling. Show the error and get back to the main menu?
            System.out.println("Ocurrió un error. Saliendo.");
        }

        // Switch for every option, with their own methods.
        switch (option) {
            case 1:
                // Sum.
                addNumbers();
                break;

            case 2:
                // Substract.
                subtractNumbers();
                break;

            case 3:
                // Multiply.
                multiplyNumbers();
                break;

            case 4:
                // Divide.
                divideNumbers();
                break;

            case 5:
                // Second grade equation.
                solveSecondGradeEq();
                break;

            case 6:
                // Out of the program.
                System.out.println("Saliendo de la Calculadora.");
                break;

            default:
                break;
        }

        scanner.close();
    }

    public static void addNumbers() {
        double num1 = 0, num2 = 0;

        Scanner scanner = new Scanner(System.in);

        System.out.print("## Suma de dos números.\n");

        System.out.print("Ingrese el primer número: ");
        num1 = scanner.nextDouble();
        System.out.print("Ingrese segundo número: ");
        num2 = scanner.nextDouble();

        // Sum, direct output.
        System.out.println("El resultado de la suma es: " + (num1 + num2));

        System.out.println("------------------");

        // Go back to the main menu.
        String[] args = new String[0];
        main(args);

        scanner.close();
    }

    public static void subtractNumbers() {
        double num1 = 0, num2 = 0;

        Scanner scanner = new Scanner(System.in);

        System.out.print("## Resta de dos números.\n");

        System.out.print("Ingrese el primer número: ");
        num1 = scanner.nextDouble();
        System.out.print("Ingrese segundo número: ");
        num2 = scanner.nextDouble();

        // Substract, direct output.
        System.out.println("El resultado de la resta es: " + (num1 - num2));

        System.out.println("------------------");

        // Go back to the main menu.
        String[] args = new String[0];
        main(args);

        scanner.close();
    }

    public static void multiplyNumbers() {
        double num1 = 0, num2 = 0;

        Scanner scanner = new Scanner(System.in);

        System.out.print("## Multiplicación de dos números.\n");

        System.out.print("Ingrese el primer número: ");
        num1 = scanner.nextDouble();
        System.out.print("Ingrese segundo número: ");
        num2 = scanner.nextDouble();

        // Multiply, direct output.
        System.out.println("El resultado de la multiplicación es: " + (num1 * num2));

        System.out.println("------------------");

        // Go back to the main menu.
        String[] args = new String[0];
        main(args);

        scanner.close();
    }

    public static void divideNumbers() {
        double num1 = 0, num2 = 0;

        Scanner scanner = new Scanner(System.in);

        System.out.print("## División de dos números.\n");

        System.out.print("Ingrese el primer número: ");
        num1 = scanner.nextDouble();
        System.out.print("Ingrese segundo número: ");
        num2 = scanner.nextDouble();

        // Can't allow a division by zero.
        if (num2 == 0) {
            System.out.println("Error: no es posible dividir por cero.");
        } else {
            // Divide, direct output.
            System.out.println("El resultado de la división es: " + (num1 / num2));
        }

        System.out.println("------------------");

        // Go back to the main menu.
        String[] args = new String[0];
        main(args);

        scanner.close();
    }

    public static void solveSecondGradeEq() {
        double a = 0, b = 0, c = 0, x1 = 0, x2 = 0, discriminant, squareRoot;

        Scanner scanner = new Scanner(System.in);

        System.out.print("## Resolver una ecuación de segundo grado.\n");

        System.out.print("Ingrese el valor de A: ");
        a = scanner.nextDouble();
        System.out.print("Ingrese el valor de B: ");
        b = scanner.nextDouble();
        System.out.print("Ingrese el valor de C: ");
        c = scanner.nextDouble();

        // Calculate the discriminant. We will need it to know how many solutions we should have.
        discriminant = (b * b) - (4 * a * c);

        // Square root. Needed to.
        squareRoot = Math.sqrt(discriminant);

        if (a != 0) {
            System.out.println("Discriminante: " + discriminant);
        }

        if (a == 0) {
            System.out.println("Error: no es posible dividir por cero.");
        } else if (discriminant > 0) {
            // If discriminant greater than zero, we have two solutions.
            x1 = (-b + squareRoot) / (2 * a);
            x2 = (-b - squareRoot) / (2 * a);
            System.out.println("Las soluciones son: " + x1 + " y " + x2);
        } else if (discriminant == 0) {
            // One solution only.
            x1 = (-b + squareRoot) / (2 * a);
            System.out.println("La solución es: " + x1);
        } else {
            // No solution.
            System.out.println("No tiene solución.");
        }

        System.out.println("------------------");

        // Go back to the main menu.
        String[] args = new String[0];
        main(args);

        scanner.close();
    }
}
