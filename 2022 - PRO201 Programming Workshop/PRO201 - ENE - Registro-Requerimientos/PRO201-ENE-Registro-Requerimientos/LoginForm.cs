namespace PRO201_ENE_Registro_Requerimientos
{
    public partial class LoginForm : Form
    {
        // Attributes
        public static int userId;
        public static string? userRole;
        AppBusiness appBusiness = new AppBusiness();
        
        public LoginForm()
        {
            InitializeComponent();
        }

        private void LoginButtonClick(object sender, EventArgs e)
        {
            // Validate user using appBusiness
            int validateUser = appBusiness.ValidateUser(textBox1.Text, textBox2.Text);
            
            if (validateUser > 0)
            {
                // Hide current window 
                this.Hide();
                
                TabForm tabForm = new TabForm(validateUser, appBusiness.GetUserRole(validateUser));
                
                // Show TabForm
                tabForm.Show();
            }
            else
            {
                // Show error message
                MessageBox.Show("Usuario o contraseña incorrectos");
                
                // Clean password
                textBox2.Text = "";
                
                // Show current window
                this.Show();
            }
        }
    }
}
