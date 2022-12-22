/**
 * Airport Control
 * AIEP - PRO101, Week 07.
 *
 * @author Esteban Cuevas
 * Date: 2022-05-05
 * License: MIT https://opensource.org/licenses/MIT
 */

public class Plane {
    // attributes
    private static int idCounter = 0;
    private int id = 0;
    private int maxPassengers = 100;
    private int currentPassengers = 0;
    private boolean bordableStatus = true;

    // constructor
    public Plane(int maxPassengers, int currentPassengers, boolean bordableStatus) {
        idCounter++;
        this.id                = idCounter;
        this.maxPassengers     = maxPassengers;
        this.currentPassengers = currentPassengers;
        this.bordableStatus    = bordableStatus;
    }

    // random constructor (per assignment requirements)
    public Plane() {
        // a static counter to keep track of the number of planes created
        // with a correlative id between them
        idCounter++;
        this.id = idCounter;

        //this.maxPassengers = 100;
        //this.bordableStatus = true;

        // random current passengers from 0 to maxPassengers.
        // we will not use Random() class, just to control the min and max values.
        int cpass_min             = 0;
        int cpass_max             = this.maxPassengers;
        int random_passengers  = (int) Math.floor( Math.random() * ( cpass_max - cpass_min + 1 ) + cpass_min );
        this.currentPassengers = random_passengers;
    }

    // getters
    public int getId() {
        return id;
    }

    public int getMaxPassengers() {
        return maxPassengers;
    }

    public int getCurrentPassengers() {
        return currentPassengers;
    }

    // get plane info
    public String[] getPlaneInfoAsArray() {
        String[] planeInfo = {
            "ID del Avión: " + getId(),
            "Máximo Pasajeros: " + getMaxPassengers(),
            "Pasajeros Actuales: " + getCurrentPassengers(),
            "Abordable: " + getBordableStatus()
        };

        return planeInfo;
    }

    // get free seats
    public int getFreeSeats() {
        return getMaxPassengers() - getCurrentPassengers();
    }

    // determines if plane is bordable or not (if you can or can't add more passengers to the plane)
    public boolean getBordableStatus() {
        // If current passengers is less than max passengers, plane is bordable.
        if (currentPassengers < maxPassengers) {
            bordableStatus = true;
            return true;
        } else {
            bordableStatus = false;
            return false;
        }
    }

    // setters
    public void setId(int id) {
        id = id;
    }

    public void setMaxPassengers(int maxPassengers) {
        maxPassengers = maxPassengers;
    }

    public void setCurrentPassengers(int currentPassengers) {
        currentPassengers = currentPassengers;
    }

    public void setBordableStatus(boolean bordableStatus) {
        bordableStatus = bordableStatus;
    }

    // board new passengers
    public void addPassengers(int passengers) {
        currentPassengers += passengers;

        // we will do the rest of the validation at the Airport class
        // because we are creating the Planes there (per assignment requirements)

        // if max passengers exceeded, set to max
        if (currentPassengers > maxPassengers) {
            currentPassengers = maxPassengers;
        }
    }

    // disembark passengers
    public void removePassengers(int passengers) {
        currentPassengers -= passengers;

        // we will do the rest of the validation at the Airport class
        // because we are creating the Planes there (per assignment requirements)

        // if current passengers is less than 0, set to 0
        if (currentPassengers < 0) {
            currentPassengers = 0;
        }
    }

    // list plane data from an array
    public void listPlaneData() {
        String[] planeInfo = getPlaneInfoAsArray();

        for (String info : planeInfo) {
            System.out.println(info);
        }
    }

    // get plane data from an array
    public String[] getPlaneData() {
        String[] planeInfo = getPlaneInfoAsArray();

        return planeInfo;
    }
}
