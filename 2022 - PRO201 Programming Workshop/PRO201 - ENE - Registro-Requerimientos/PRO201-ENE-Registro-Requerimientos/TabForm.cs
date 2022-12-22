namespace PRO201_ENE_Registro_Requerimientos
{
    public partial class TabForm : Form
    {
        // Attributes
        public static int userId;
        public static string? userRole;
        public List<List<string>> requirements;
        public int user;
        
        AppBusiness appBusiness = new AppBusiness();

        public TabForm(int userId, string userRole)
        {
            // Set the user id and role to the attributes
            TabForm.userId = userId;
            TabForm.userRole = userRole;

            InitializeComponent();

            // Loads an initial set of records from the DB
            ListInitialRequirements();

            // Populare ComboBox with users from the DB
            PopulateUsersComboBox();

            // Show current user Role
            ShowUserRole();
        }
        
        // Show user role
        private void ShowUserRole()
        {
            if (userRole == "admin")
            {
                // Set label9 text
                label9.Text = "Admin";
            }
            
            if (userRole == "user")
            {
                // Set label9 text
                label9.Text = "User";
            }
        }

        // Clear our search tab status
        private void ResetSearchStatus()
        {
            // Clear comboBoxes
            comboBox1.SelectedIndex = -1;
            comboBox2.SelectedIndex = -1;
            
            // Clear the data grid view
            ClearDataGridView();
        }
        
        // Clear our dataGridView1
        private void ClearDataGridView()
        {
            dataGridView1.DataSource = null;
            dataGridView1.Rows.Clear();
            dataGridView1.Refresh();
        }
        
        // List initial requirements (placeholder)
        private void ListInitialRequirements()
        {
            // Get our initial requirements from AppBusiness
            List<List<string>> requirements = appBusiness.GetInitialRequirements(userId, userRole);
            
            // Add it to our GridView, foreach item
            foreach (List<string> requirement in requirements)
            {
                dataGridView1.Rows.Add(requirement.ToArray());
            }
        }

        // Clear button
        private void ClearButtonClick(object sender, EventArgs e)
        {
            ResetSearchStatus();
        }

        // Search button
        private void SearchButtonClick(object sender, EventArgs e)
        {
            string type = "Todos";
            string priority = "Todas";
            string status = "Pendiente";

            ClearDataGridView();
            
            // Get comboBox1 selected item
            if (comboBox1.SelectedItem != null)
            {
                type = comboBox1.SelectedItem.ToString();
            }
            
            // Get comboBox2 selected item
            if (comboBox2.SelectedItem != null)
            {
                priority = comboBox2.SelectedItem.ToString();
            }
            
            // Check if checkBox1 is checked
            if (checkBox1.Checked && !checkBox2.Checked )
            {
                status = "Pendiente";
            } else if (checkBox1.Checked && checkBox2.Checked)
            {
                status = "Cualquiera";
            } else if (!checkBox1.Checked && checkBox2.Checked)
            {
                status = "Resuelto";
            } else if (!checkBox1.Checked && !checkBox2.Checked)
            {
                // User didn't select any status
                MessageBox.Show("Por favor, seleccione al menos un estado");
                
                return;
            }
            
            // If type, priority or status are our default, ListInitialRequirements
            if (type == "Todos" && priority == "Todas" && status == "Pendiente")
            {
                ListInitialRequirements();

                return;
            }

            // Get our requirements from AppBusiness
            List<List<string>> requirements = appBusiness.GetRequirements(userId, userRole, type, priority, status);
            
            // If empty, show message
            if (requirements.Count == 0)
            {
                MessageBox.Show("No se encontraron requerimientos");
                
                return;
            }
            
            // Add it to our GridView, foreach item
            foreach (List<string> requirement in requirements)
            {
                dataGridView1.Rows.Add(requirement.ToArray());
            }
        }

        // Button marked as resolved
        private void MarkAsResolvedClick(object sender, EventArgs e)
        {
            // If a row isn't selected, show message
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Por favor, selecciona una fila completa");
                
                return;
            }
            
            // Get dataGridView1 selected row
            DataGridViewRow selectedRow = dataGridView1.SelectedRows[0];
            
            // Get selected row id
            int id = Convert.ToInt32(selectedRow.Cells[0].Value);
            
            // Get selected row status
            string status = selectedRow.Cells[5].Value.ToString();
            
            // If status is Resuelto, show message
            if (status == "Resuelto")
            {
                MessageBox.Show("El requerimiento ya está resuelto");
                
                return;
            }
            
            // Update status to Resuelto
            appBusiness.UpdateRequerimentStatus(id, "Resuelto");
            
            // Clear dataGridView1
            ResetSearchStatus();
            
            // List initial requirements
            ListInitialRequirements();
        }
        
        // Button marked as pending
        private void MarkAsPendingClick(object sender, EventArgs e)
        {
            // If a row isn't selected, show message
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Por favor, selecciona una fila completa");
                
                return;
            }

            // Get dataGridView1 selected row
            DataGridViewRow selectedRow = dataGridView1.SelectedRows[0];
            
            // Get selected row id
            int id = Convert.ToInt32(selectedRow.Cells[0].Value);
            
            // Get selected row status
            string status = selectedRow.Cells[5].Value.ToString();
            
            // If status is Resuelto, show message
            if (status == "Pendiente")
            {
                MessageBox.Show("El requerimiento ya está pendiente");
                
                return;
            }
            
            // Update status to Resuelto
            appBusiness.UpdateRequerimentStatus(id, "Pendiente");
            
            // Clear dataGridView1
            ResetSearchStatus();
            
            // List initial requirements
            ListInitialRequirements();
        }

        // Delete row button
        private void DeleteRowClick(object sender, EventArgs e)
        {
            // If a row isn't selected, show message
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Por favor, selecciona una fila completa");
                
                return;
            }
            
            // Show a confirmation message
            DialogResult dialogResult = MessageBox.Show("¿Estás seguro de eliminar el requerimiento seleccionado?", "Eliminar requerimiento", MessageBoxButtons.YesNo);
            
            // If user clicked Yes, delete the row
            if (dialogResult == DialogResult.Yes)
            {
                // Get dataGridView1 selected row
                DataGridViewRow selectedRow = dataGridView1.SelectedRows[0];
                
                // Get selected row id
                int id = Convert.ToInt32(selectedRow.Cells[0].Value);
                
                // Delete row
                bool result = appBusiness.DeleteRequirementById(id);
                
                // Clear dataGridView1
                ResetSearchStatus();
                
                // List initial requirements
                ListInitialRequirements();
            }
        }

        // Button clear new requirement form
        private void ClearReqFormClick(object sender, EventArgs e)
        {
            // clear all comboBoxes in this tab
            foreach (Control control in tabPage2.Controls)
            {
                if (control is ComboBox)
                {
                    ComboBox comboBox = (ComboBox) control;
                    
                    comboBox.SelectedIndex = -1;
                }
            }
            
            // clear richTextBox1
            richTextBox1.Text = "";
        }
        
        // Populate comboBox4 with all users
        private void PopulateUsersComboBox()
        {
            // Get all users from AppBusiness
            List<List<string>> users = appBusiness.GetAllUsers();
            
            // Set our comboBox4 DataSource
            comboBox4.DisplayMember = "Text";
            comboBox4.ValueMember = "Value";
            
            // Loop through users and add them to our comboBox4
            foreach (List<string> user in users)
            {
                // Add id and name
                comboBox4.Items.Add(new { Text = user[1], Value = user[0] });
            }
        }

        // Button save requirement
        private void SaveReqClick(object sender, EventArgs e)
        {
            // Ensure all fields in this tab are filled
            if (comboBox3.SelectedIndex == -1 || comboBox4.SelectedIndex == -1  || comboBox5.SelectedIndex == -1 || richTextBox1.Text == "")
            {
                MessageBox.Show("Todos los campos son obligatorios");
                
                return;
            }
            
            // Get all fields in this tab
            string type = comboBox3.SelectedItem.ToString();
            int user = Convert.ToInt32(((dynamic) comboBox4.SelectedItem).Value);
            string description = richTextBox1.Text;
            string priority = comboBox5.SelectedItem.ToString();
            string status = "Pendiente";

            // Show confirmation message
            DialogResult dialogResult = MessageBox.Show("¿Estás seguro de guardar el requerimiento?", "Guardar requerimiento", MessageBoxButtons.YesNo);
            
            // If user clicked Yes, save the requirement
            if (dialogResult == DialogResult.Yes)
            {
                // Save requirement
                bool result = appBusiness.SaveRequirement(type, user, description, priority, status);
                
                // If result is true, show message
                if (result)
                {
                    MessageBox.Show("Requerimiento guardado. El plazo de resolución es de " + DaysRemaining(priority));
                    
                    // clear all comboBoxes in this tab
                    foreach (Control control in tabPage2.Controls)
                    {
                        if (control is ComboBox)
                        {
                            ComboBox comboBox = (ComboBox) control;
                            
                            comboBox.SelectedIndex = -1;
                        }
                    }
                    
                    // clear richTextBox1
                    richTextBox1.Text = "";
                    
                    // Clear dataGridView1
                    ResetSearchStatus();
                    
                    // List initial requirements
                    ListInitialRequirements();
                }
            }
        }
        
        private string DaysRemaining(string priority)
        {
            switch (priority)
            {
                case "Baja":
                    return "5 días";
                case "Media":
                    return "4 días";
                case "Alta":
                    return "3 días";
            }
            
            return "NN";
        }
    }
}