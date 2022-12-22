namespace PRO201_ENE_Registro_Requerimientos
{
    public partial class LoginForm : Form
    {
        // Attributes
        public static int userId;
        public static string? userRole;
        public static int loginAttempts = 0;
        AppBusiness appBusiness = new AppBusiness();
        
        public LoginForm()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // Check if user and password where filled
            if (textBox1.Text == "" || textBox2.Text == "")
            {
                MessageBox.Show("Por favor, ingrese un usuario y contraseña.");
                
                return;
            }
            
            // Check if user is blocked
            if (appBusiness.IsUserBlocked(textBox1.Text))
            {
                MessageBox.Show("Usuario bloqueado, contacte al administrador.");
                
                return;
            }
            
            // Validate user using appBusiness
            int validateUser = appBusiness.ValidateUser(textBox1.Text, textBox2.Text);
            
            if (validateUser > 0)
            {
                // Hide current window 
                this.Hide();
                
                // Reset login attempts
                loginAttempts = 0;
                appBusiness.ResetUserAttempts(textBox1.Text);
                
                TabForm tabForm = new TabForm(validateUser, textBox1.Text);
                
                // Show TabForm
                tabForm.Show();
            }
            else
            {
                // Show error message
                MessageBox.Show("Usuario o contraseña incorrectos.");
                
                // Increment login attempts
                loginAttempts++;
                
                // If login attempts are greater than 3, show a message and block the user
                if (loginAttempts > 3)
                {
                    MessageBox.Show("Ha excedido el número máximo de intentos. Su cuenta ha sido bloqueada. Por favor, contacte al administrador.");
                    
                    // Block user account
                    appBusiness.BlockUser(textBox1.Text);
                }
                
                // Clean password
                textBox2.Text = "";
                
                // Show current window
                this.Show();
            }
        }
    }
}
