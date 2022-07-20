/**
 * Airport Control
 * AIEP - PRO101, Week 07.
 *
 * @author Esteban Cuevas
 * Date: 2022-05-05
 * License: MIT https://opensource.org/licenses/MIT
 */

import java.io.IOException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws InterruptedException, IOException {
        // New Airport
        Airport airport = new Airport("Washington Dulles");

        int option = 0;
        boolean exit = false;
        Scanner scanner = new Scanner(System.in);

        do {
            // Number of planes
            System.out.println("---------------------");
            System.out.println("Aeropuerto " + airport.getAirportName());
            System.out.println("Número de aviones en el Aeropuerto: " + airport.getNumberOfPlanes());

            // Main menu
            System.out.println("---------------------");
            System.out.println("1. Listar ID aviones");
            System.out.println("2. Cantidad de pasajeros entre todos los aviones");
            System.out.println("3. Cantidad de asientos disponibles entre todos los aviones");
            System.out.println("4. Mostrar datos de avión, por ID");
            System.out.println("5. Subir pasajeros a avión, por ID");
            System.out.println("6. Bajar pasajeros a avión, por ID");
            System.out.println("7. Salir");
            System.out.println("---------------------");
            System.out.println("Ingrese una opción:");

            option = scanner.nextInt();

            // Switch over option
            switch (option) {
                case 1:
                    // list all planes IDs.
                    airport.listAllPlanes();
                    break;

                case 2:
                    // list current passengers.
                    airport.listNumberOfTotalPassengers();
                    break;

                case 3:
                    // list current available seats.
                    airport.listNumberOfAvailableSeats();
                    break;

                case 4:
                    // list plane data by ID.
                    airport.listPlaneInfoById();
                    break;

                case 5:
                    // add passengers to plane.
                    airport.addPassengersToPlane();
                    break;

                case 6:
                    // remove passengers from plane.
                    airport.removePassengersFromPlane();
                    break;

                case 7:
                    // exit.
                    System.out.println("Cerrando el sistema.");
                    exit = true;
                    break;

                default:
                    break;
            }
        } while (!exit);
    }
}
