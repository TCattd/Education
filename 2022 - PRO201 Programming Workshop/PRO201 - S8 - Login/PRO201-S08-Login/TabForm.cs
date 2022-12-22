namespace PRO201_ENE_Registro_Requerimientos
{
    public partial class TabForm : Form
    {
        // Attributes
        public static int userId;
        public static string userName;
        public int user;
        
        AppBusiness appBusiness = new AppBusiness();

        public TabForm(int userId, string userName)
        {
            // Set the user id and role to the attributes
            TabForm.userId = userId;
            TabForm.userName = userName;

            InitializeComponent();
            
            ShowUserName( userName );
        }
        
        // Show user role
        private void ShowUserName( string userName )
        {
            // Set label3 text
            label3.Text = userName;
        }

    }
}