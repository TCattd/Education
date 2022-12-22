/**
* Simple EvenOrOdd calculation
* AIEP - PRO201, Week 04.
*
* @author Esteban Cuevas
* Date: 2022-09-08
* License: MIT https://opensource.org/licenses/MIT
**/

namespace AIEP_PRO201_S04_EvenOrOdd
{
    internal static class Program
    {
        /// <summary>
        ///  The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            // To customize application configuration such as set high DPI settings or default font,
            // see https://aka.ms/applicationconfiguration.
            ApplicationConfiguration.Initialize();
            Application.Run(new Form1());
        }
    }
}
