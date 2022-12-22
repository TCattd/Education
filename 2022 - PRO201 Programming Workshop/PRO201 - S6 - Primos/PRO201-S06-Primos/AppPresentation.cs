using System.Data;

namespace PRO201_S06_Primos
{
    public partial class AppPresentation : Form
    {
        // Init our Business class
        AppBusiness appBusiness = new AppBusiness();
        
        public AppPresentation()
        {
            InitializeComponent();

            // Populate our table's header
            dataGridHeader();
        }

        private void dataGridHeader()
        {
            // Add columns to dataGridView2 as header columns
            dataGridView2.Columns.Add("c1", "Desde");
            dataGridView2.Columns.Add("c2", "Hasta");
            dataGridView2.Columns.Add("c3", "Primo menor");
            dataGridView2.Columns.Add("c4", "Primo mayor");
            dataGridView2.Columns.Add("c5", "Cantidad");
            dataGridView2.Columns.Add("c6", "Tiempo (milisegundos)");
            dataGridView2.Columns.Add("c6", "Observaciones");
        }
        
        private void button2_Click(object sender, EventArgs e)
        {
            // Check if comboBox value is empty
            if (comboBox2.SelectedItem == null)
            {
                MessageBox.Show("Debe seleccionar una opción");
                
                // Exit and don't continue
                return;
            }
            
            // Try catch to catch any exception in the process, to avoid crashing the app
            try
            {
                // Process and retrieve the results from ProcessOption method, at our Business class
                List<string> results = appBusiness.ProcessOption(comboBox2.SelectedItem.ToString());
                
                // Set the comboBox value to null
                comboBox2.SelectedItem = null;
            
                // Add the results to the dataGridView2
                AddRowToGridView(results);
            }
            catch (Exception ex)
            {
                // Catch any exception and show it
                MessageBox.Show(ex.Message);

                // Exit and don't continue
                return;
            }
        }
        
        public void AddRowToGridView(List<string> values)
        {
            // Add a new row to the dataGridView2, from a List of values
            dataGridView2.Rows.Add(values.ToArray());
        }

        // Clear all the results from dataGridView2, except the header
        private void button1_Click(object sender, EventArgs e)
        {
            // Clear all the rows from dataGridView2
            dataGridView2.Rows.Clear();
            
            // Add back the header
            dataGridHeader();
        }
    }
}