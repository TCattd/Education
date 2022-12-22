/**
* Simple EvenOrOdd calculation
* AIEP - PRO201, Week 04.
*
* @author Esteban Cuevas
* Date: 2022-09-08
* License: MIT https://opensource.org/licenses/MIT
**/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AIEP_PRO201_S04_EvenOrOdd
{
    internal class Operations
    {
        public bool EvenOrOdd(int number)
        {
            // We don't need to use conditionals here, because we can use the modulo operator to directly return the value
            /*if (number % 2 == 0)
            {
                // 0 as division remainder, means it's even
                return true;
            }
            else
            {
                // Anything different from 0 as the division remainder, means it's odd
                return false;
            }*/
            
            return number % 2 == 0;
        }

        // Return a message if number is odd or even
        public string EvenOrOddMessage(int number)
        {
            // If number zero, don't calculate anything
            if (number == 0)
            {
                return "El número es par";
            }

            // Use our method to do the calculation and return the message
            if (EvenOrOdd(number))
            {
                return "El número es par";
            }
            else
            {
                return "El número es impar";
            }
        }

        public bool IsNumeric(string numberText)
        {
            // Check if numberText is a number
            int number;
            
            return int.TryParse(numberText, out number);
        }
    }
}
