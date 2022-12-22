/**
* Simple EvenOrOdd calculation
* AIEP - PRO201, Week 04.
*
* @author Esteban Cuevas
* Date: 2022-09-08
* License: MIT https://opensource.org/licenses/MIT
**/

using System.Windows.Forms;

namespace AIEP_PRO201_S04_EvenOrOdd
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        
        private void Form1_Load_1(object sender, EventArgs e)
        {

        }

        private void Evaluar_Click(object sender, EventArgs e)
        {
            // Initialize our Class
            Operations OpsObject = new Operations();

            // Instead of changing the text of the button, we will change the text of the label
            // And will do some fail-safe checks on the way
            //Evaluar.Text = Convert.ToString(OpsObject.EvenOrOdd(Convert.ToInt32(number.Text)));

            // If the textbox is empty, show a message
            if (number.Text == "")
            {
                MessageBox.Show("Por favor, ingrese un número");
            }
            // If label2 is not a number, show a message
            else if (!OpsObject.IsNumeric(number.Text))
            {
                MessageBox.Show("Por favor, ingrese un número válido");
            }
            else
            {
                // Set the label2 with the message returned by the method EvenOrOddMessage
                label2.Text = OpsObject.EvenOrOddMessage(Convert.ToInt32(number.Text));
            }
        }
    }
}
