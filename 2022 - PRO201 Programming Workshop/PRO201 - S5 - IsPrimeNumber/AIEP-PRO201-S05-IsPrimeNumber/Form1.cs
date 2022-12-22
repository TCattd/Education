using AIEP_PRO201_S05_IsPrimeNumber_Business;

namespace AIEP_PRO201_S05_IsPrimeNumber
{
    public partial class Form1 : Form
    {
        AppBusiness appBusiness = new AppBusiness();
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // if textBox1 is empty, warn user
            if (textBox1.Text == "")
            {
                MessageBox.Show("Por favor, ingresa un número");
                
                return;
            }
            
            // if textBox1 is not a number, stop
            if (!appBusiness.IsNumber(textBox1.Text))
            {
                MessageBox.Show("Por favor, ingresa un número válido");
                
                // clear the textBox1
                textBox1.Text = "";
                
                return;
            }
            
            // Get the number, converted to int
            int number = Convert.ToInt32(textBox1.Text);
            
            // Set the number to the business layer
            appBusiness.numberToEvaluate = number;
            
            // Call the business layer method to check if the number is prime
            bool result = appBusiness.checkIfPrimeNumber();

            if (result == true)
            {
                MessageBox.Show(number + " es número primo");
            }
            else
            {
                MessageBox.Show(number + " NO es número primo");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            // Clear textBox1
            textBox1.Text = "";
        }
    }
}