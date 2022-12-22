/**
* A console Hello World
* AIEP - PRO201, Week 04.
*
* @author Esteban Cuevas
* Date: 2022-09-08
* License: MIT https://opensource.org/licenses/MIT
**/

namespace AIEP_PRO201_S04_ConsoleOnline
{
    class Program
    {
        static void Main(string[] args)
        {
            // Greet object initialization
            Greet GreetObject = new Greet();

            // We can skip this whole variable assigment.
            // That allows us to avoid using more memory for it.
            //string message;
            //message = GreetObject.HelloWorld();

            // We can just print the message directly into
            // the console.
            Console.Write(GreetObject.HelloWorld());
            Console.Read();
        }
    }
}
