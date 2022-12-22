/**
 * Airport Control
 * AIEP - PRO101, Week 07.
 *
 * @author Esteban Cuevas
 * Date: 2022-05-05
 * License: MIT https://opensource.org/licenses/MIT
 */

import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

public class Airport {
    // attributes
    private String airportName = "";
    private static ArrayList<Plane> planesList;
    private int numberOfPlanes = 5; // for testing purposes, change to 100 for production (per assignment requirements)

    // constructor
    public Airport(String name) {
        airportName = name;
        planesList = new ArrayList<Plane>();

        // add random planes up to numberOfPlanes
        for (int i = 0; i < numberOfPlanes; i++) {
            addPlane(new Plane());
        }
    }

    // add plane to the airport
    private void addPlane(Plane plane) {
        planesList.add(plane);
    }

    // get number of planes in the airport
    public int getNumberOfPlanes() {
        return planesList.size();
    }

    // get number of passengers in the airport (planes combined)
    public void listNumberOfTotalPassengers() throws IOException {
        int numberOfPassengers = 0;

        System.out.println("Número combinado de Pasajeros (entre todos los aviones):");

        for (Plane plane : planesList) {
            numberOfPassengers += plane.getCurrentPassengers();
        }

        System.out.println( numberOfPassengers );

        // press enter to continue
        System.out.println("Presione ENTER para continuar...");

        System.in.read();
    }

    // get free seats in all planes (planes combined)
    public void listNumberOfAvailableSeats() throws IOException {
        int freeSeats = 0;

        System.out.println("Número combinado de asientos disponibles (entre todos los aviones):");

        for (Plane plane : planesList) {
            freeSeats += plane.getFreeSeats();
        }

        System.out.println( freeSeats );

        // press enter to continue
        System.out.println("Presione ENTER para continuar...");

        System.in.read();
    }

    // get Airport's name
    public String getAirportName() {
        return airportName;
    }

    // get plane info by id
    public Object[] getPlaneInfo(int id) throws IOException {
        // because the array starts at 0
        id = id - 1;

        // get plane info
        String[] planeData = planesList.get(id).getPlaneData();

        return planeData;
    }

    // list plane info by id
    public void listPlaneInfoById() throws IOException {
        // use a scanner to get the id
        int id = 0;
        boolean idFound = false;
        Scanner scanner = new Scanner(System.in);

        // enter the id of the plane
        System.out.println("Ingrese la ID del avión:");

        while (!idFound) {
            id = scanner.nextInt();
            idFound = true;
        }

        // because the array starts at 0
        id = id - 1;

        // list the plane info
        planesList.get(id).listPlaneData();

        // press enter to continue
        System.out.println("Presione ENTER para continuar...");

        System.in.read();
    }

    // list all planes in the airport
    public void listAllPlanes() throws IOException {
        System.out.println("Listado de Aviones:");

        String pt_return = "";
        int pt_id = 0;
        int pt_currentPassengers = 0;
        int pt_maxPassengers = 0;

        for (int i = 0; i < planesList.size(); i++) {
            pt_id = planesList.get(i).getId();
            pt_currentPassengers = planesList.get(i).getCurrentPassengers();
            pt_maxPassengers = planesList.get(i).getMaxPassengers();

            pt_return = pt_return + "ID " + pt_id + ": " + pt_currentPassengers + " de " + pt_maxPassengers + " pasajeros.\n";
        }

        System.out.println( pt_return );

        // press enter to continue
        System.out.println("Presione ENTER para continuar...");

        System.in.read();
    }

    // add passengers to the plane
    public void addPassengersToPlane() throws IOException {
        // use a scanner to get the id
        int id = 0;
        int newPassengers = 0;
        Scanner scanner = new Scanner(System.in);

        // enter the id of the plane
        System.out.println("Ingrese la ID del avión:");

        id = scanner.nextInt();
        id = id - 1; // because the array starts at 0

        // if plane bordable status is false, then the plane is full
        if (!planesList.get(id).getBordableStatus()) {
            System.out.println("El avión está lleno. No se pueden agregar más pasajeros.");
        } else {
            // enter the number of passengers to add
            System.out.println("Ingrese el número de pasajeros a agregar:");
            newPassengers = scanner.nextInt();

            // if number is below 0, then it is not allowed
            if (newPassengers < 0) {
                System.out.println("No se puede agregar un número negativo de pasajeros.");
            } else {
                // if newPassengers plus currentPassengers is greater than maxPassengers, then it is not allowed
                if (newPassengers + planesList.get(id).getCurrentPassengers() > planesList.get(id).getMaxPassengers()) {
                    System.out.println("No se puede agregar más pasajeros que el número máximo de pasajeros permitidos por avión.");
                } else {
                    // add the passengers
                    planesList.get(id).addPassengers(newPassengers);
                    System.out.println(newPassengers + " pasajero(s) agregado(s) al avión.");

                    // new total passengers on this plane
                    int newTotalPassengers = planesList.get(id).getCurrentPassengers();
                    System.out.println("Nuevo total de pasajeros en el avión: " + newTotalPassengers);
                }
            }
        }

        // press enter to continue
        System.out.println("Presione ENTER para continuar...");

        System.in.read();
    }

    // remove passengers from the plane
    public void removePassengersFromPlane() throws IOException {
        // use a scanner to get the id
        int id = 0;
        int removedPassengers = 0;
        Scanner scanner = new Scanner(System.in);

        // enter the id of the plane
        System.out.println("Ingrese la ID del avión:");

        id = scanner.nextInt();
        id = id - 1; // because the array starts at 0

        // if the current plane passengers is 0, then there is no passengers to remove
        if (planesList.get(id).getCurrentPassengers() == 0) {
            System.out.println("Actualmente no hay pasajeros en el avión. No se puede remover ningún pasajero.");
        } else {
            // enter the number of passengers to remove
            System.out.println("Ingrese el número de pasajeros a remover:");
            removedPassengers = scanner.nextInt();

            // if number is below 0, then it is not allowed
            if (removedPassengers < 0) {
                System.out.println("No se puede remover un número negativo de pasajeros.");
            } else if (removedPassengers > planesList.get(id).getCurrentPassengers()) {
                // if removedPassengers is greater than maxPassengers, then it is not allowed
                System.out.println("No se puede remover más pasajeros que el número actual de pasajeros en el avión.");
            } else {
                // remove the passengers
                planesList.get(id).removePassengers(removedPassengers);
                System.out.println(removedPassengers + " pasajero(s) removidos(s) del avión.");

                // new total passengers on this plane
                int newTotalPassengers = planesList.get(id).getCurrentPassengers();
                System.out.println("Nuevo total de pasajeros en el avión: " + newTotalPassengers);
            }
        }

        // press enter to continue
        System.out.println("Presione ENTER para continuar...");

        System.in.read();
    }
}
