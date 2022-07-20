# Simple Score Menu Based Calculator
# AIEP - PRO101, Week 05.
#
# @author Esteban Cuevas
# Date: 2022-04-21
# License: MIT https://opensource.org/licenses/MIT

import numpy as np

class ScoreCalculator:
    # Default attributes.
    grade1      = 0.0
    grade2      = 0.0
    grade3      = 0.0
    gradesArray = np.array([])

    # Calculate final grade.
    def calculateFinalGrade(self):
        try:

            print("Calculo de promedio (3 notas).")
            print("Notas válidas: 1.0 al 7.0")
            print("Presione CTRL+C para salir")
            print("--------------------------------")

            # Ask for a number until a valid grade is given.
            # Will replace comma for a dot, for Chile. It shoul not be like this.
            # TODO: use locale.
            while (self.grade1 < 1.0) or (self.grade1 > 7.0):
                self.grade1 = float(input("Ingrese nota 1: ").replace(',', '.'))

            while (self.grade2 < 1.0) or (self.grade2 > 7.0):
                self.grade2 = float(input("Ingrese nota 2: ").replace(',', '.'))

            while (self.grade3 < 1.0) or (self.grade3 > 7.0):
                self.grade3 = float(input("Ingrese nota 3: ").replace(',', '.'))

            # Merge our grades into an array.
            self.gradesArray = np.append(self.gradesArray, [self.grade1, self.grade2, self.grade3])

            print("--------------------------------")
            self.showAverage()
            print("")
            self.showHighScore()
            self.showLowerScore()

        # If user interrupts, get out with a jump line.
        except KeyboardInterrupt:
            print("")
            pass

    # Calculare average.
    def showAverage(self):
        # You can do this:
        # average = (self.grade1 + self.grade2 + self.grade3) / 3
        # But... thanks universe for numpy:
        average = np.average(self.gradesArray)
        print(f"El promedio es: {average:.2f}")

    # Show highest grade.
    def showHighScore(self):
        highScore = np.max(self.gradesArray)
        print(f"Nota más alta: {highScore:.1f}")

    # Show lowest grade.
    def showLowerScore(self):
        lowerScore = np.min(self.gradesArray)
        print(f"Nota más baja: {lowerScore:.1f}")

# Init Class and go go go!
userScore = ScoreCalculator()
userScore.calculateFinalGrade()
