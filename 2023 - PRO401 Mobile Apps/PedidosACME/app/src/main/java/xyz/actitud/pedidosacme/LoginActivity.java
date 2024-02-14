package xyz.actitud.pedidosacme;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
//import android.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.app.AppCompatDelegate;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.firestore.CollectionReference;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.Query;
import com.google.firebase.firestore.QueryDocumentSnapshot;
import com.google.firebase.firestore.QuerySnapshot;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

public class LoginActivity extends AppCompatActivity implements View.OnClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Force light mode only
        AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_NO);

        setContentView(R.layout.activity_login);

        // buttonLogin
        findViewById(R.id.buttonLogin).setOnClickListener(this);

        // textViewSignUp
        findViewById(R.id.textViewSignUp).setOnClickListener(this);
    }

    /**
     * Authenticate user with Firestore
     *
     * @param email
     * @param password
     *
     * @return boolean
     */
    private void authenticateRemote(String email, String password) {
        // If email or password is empty, show error (alertdialog) and return false
        if (email.isEmpty() || password.isEmpty()) {
            AlertDialog.Builder builder = new AlertDialog.Builder(LoginActivity.this);
            builder.setTitle("Error");
            builder.setMessage("Ingrese su correo y contraseña");
            builder.setPositiveButton("Aceptar", null);
            builder.create();
            builder.show();

            // Enable button
            findViewById(R.id.buttonLogin).setEnabled(true);

            return;
        }

        // Check if email is valid
        if (!isValidEmail(email)) {
            AlertDialog.Builder builder = new AlertDialog.Builder(LoginActivity.this);
            builder.setTitle("Error");
            builder.setMessage("Por favor, ingrese un correo válido");
            builder.setPositiveButton("Aceptar", null);
            builder.create();
            builder.show();

            return;
        }


        // Password to SHA-256
        password = sha256string(password);

        // Init Firebase Firestore
        FirebaseFirestore db = FirebaseFirestore.getInstance();

        // If email and password are not empty, authenticate user with Firestore
        db.collection("users")
                .whereEqualTo("email", email)
                .whereEqualTo("password", password)
                .get()
                .addOnCompleteListener(new OnCompleteListener<QuerySnapshot>() {
                    @Override
                    public void onComplete(@NonNull Task<QuerySnapshot> task) {
                        if (task.isSuccessful()) {
                            String remote_email = null;
                            String remote_password = null;
                            String documentId = null;

                            for (QueryDocumentSnapshot document : task.getResult()) {
                                remote_email    = document.getData().get("email").toString();
                                remote_password = document.getData().get("password").toString();
                                documentId      = document.getId();
                            }

                            // Callback method
                            onLoginResultCompare(remote_email, remote_password, documentId);
                        } else {
                            onLoginFail();
                        }
                    }
                });

        // Enable button
        findViewById(R.id.buttonLogin).setEnabled(true);
    }

    /**
     * Button click handler
     */
    @Override
    public void onClick(View view) {
        // Button: buttonUseCurrentLocation
        if (view.getId() == R.id.buttonLogin) {
            // Disable button
            view.setEnabled(false);

            processLogin();
        }

        // textViewSignUp
        if (view.getId() == R.id.textViewSignUp) {
            showRegisterDialog();
        }
    }

    /**
     * Process login
     */
    private void processLogin() {
        // EditText values
        String email = ((EditText) findViewById(R.id.editTextEmail)).getText().toString().trim();
        String password = ((EditText) findViewById(R.id.editTextPassword)).getText().toString();

        // Authenticate user with Firestore
        authenticateRemote(email, password);
    }

    /**
     * On login fail callback
     *
     * @return void
     */
    private void onLoginFail() {
        // Show ActivityDialog with error message
        AlertDialog.Builder builder = new AlertDialog.Builder(LoginActivity.this);
        builder.setTitle("Error");
        builder.setMessage("Error al iniciar sesión. Datos incorrectos.");
        builder.setPositiveButton("Aceptar", null);
        builder.create();
        builder.show();
    }

    /**
     * Login result callback
     *
     * @param remote_email
     * @param remote_password
     * @param documentId
     *
     * @return void
     */
    private void onLoginResultCompare(String remote_email, String remote_password, String documentId) {
        // EditText values
        String email = ((EditText) findViewById(R.id.editTextEmail)).getText().toString().trim();
        String password = ((EditText) findViewById(R.id.editTextPassword)).getText().toString();

        // Password to SHA-256
        password = sha256string(password);

        // Compare email and password
        boolean result = email.equals(remote_email) && password.equals(remote_password);

        // Correct login
        if (result) {
            // Change activity to MainActivity
            Intent calcIntent = new Intent(this, MenuActivity.class);
            calcIntent.putExtra("email", email);
            calcIntent.putExtra("documentId", documentId);
            startActivity(calcIntent);

            // Clear EditText values
            ((EditText) findViewById(R.id.editTextEmail)).setText("");
            ((EditText) findViewById(R.id.editTextPassword)).setText("");

            // Finish LoginActivity
            finish();
        } else {
            // Invalid login
            onLoginFail();
        }
    }

    /**
     * Register user
     *
     * @return void
     */
    private void showRegisterDialog() {
        // Open Dialog with email and password fields, with cancel or register buttons, using dialog_signup.xml layout
        AlertDialog.Builder builder = new AlertDialog.Builder(LoginActivity.this);
        LayoutInflater inflater = getLayoutInflater();

        // Inflate and set the custom layout for the dialog
        View dialogView = inflater.inflate(R.layout.dialog_signup, null);

        final EditText dialogEmail = dialogView.findViewById(R.id.dialogEmail);
        final EditText dialogPassword = dialogView.findViewById(R.id.dialogPassword);

        builder.setView(dialogView)
                .setPositiveButton("Registrar",
                        new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int id) {
                                // Catch email and password values and register user
                                String emailValue    = dialogEmail.getText().toString().trim();
                                String passwordValue = dialogPassword.getText().toString();

                                registerUser(emailValue, passwordValue);
                            }
                        }
                        )
                .setNegativeButton("Cancelar", null)
                .setTitle("Registro de usuario");

        builder.create();
        builder.show();
    }


    /**
     * Register user to Firestore, positive button click handler
     *
     * @param emailValue
     * @param passwordValue
     *
     * @return void
     */
    private void registerUser(String emailValue, String passwordValue) {
        // If email or password is empty, show error (alertdialog) and return false
        if (emailValue.isEmpty() || passwordValue.isEmpty()) {
            AlertDialog.Builder builder = new AlertDialog.Builder(LoginActivity.this);
            builder.setTitle("Error");
            builder.setMessage("Por favor, rellene todos los campos");
            builder.setPositiveButton("Aceptar", null);
            builder.create();
            builder.show();

            return;
        }

        // Check if email is valid
        if (!isValidEmail(emailValue)) {
            AlertDialog.Builder builder = new AlertDialog.Builder(LoginActivity.this);
            builder.setTitle("Error");
            builder.setMessage("Por favor, ingrese un correo válido");
            builder.setPositiveButton("Aceptar", null);
            builder.create();
            builder.show();

            return;
        }

        // Check if email is already registered
        checkIfEmailExists(emailValue, new OnEmailCheckComplete() {
            @Override
            public void onComplete(boolean emailExists) {
                if (emailExists) {
                    // Email already registered, show error (alertdialog) and return
                    AlertDialog.Builder builder = new AlertDialog.Builder(LoginActivity.this);
                    builder.setTitle("Error");
                    builder.setMessage("El correo ya está registrado");
                    builder.setPositiveButton("Aceptar", null);
                    builder.create();
                    builder.show();

                    return;
                } else {
                    // Everything is ok, push user to Firestore
                    pushUserToFirestore(emailValue, passwordValue);
                }
            }
        });
    }

    /**
     * Push user to Firestore
     *
     * @param emailValue
     * @param passwordValue
     *
     * @return void
     */
    private void pushUserToFirestore(String emailValue, String passwordValue) {
        // Password to SHA-256
        passwordValue = sha256string(passwordValue);

        // Init Firebase Firestore
        FirebaseFirestore db = FirebaseFirestore.getInstance();

        // User
        Map<String, Object> user = new HashMap<>();
        user.put("email", emailValue);
        user.put("password", passwordValue);

        // Push new user to Firestore
        db.collection("users")
                .add(user)
                .addOnCompleteListener(new OnCompleteListener() {
                    @Override
                    public void onComplete(@NonNull Task task) {
                        if (task.isSuccessful()) {
                            // Registration successful
                            AlertDialog alertDialog = new AlertDialog.Builder(LoginActivity.this).create();
                            alertDialog.setTitle("Registro de usuario");
                            alertDialog.setMessage("Usuario registrado. Por favor, conéctese con sus credenciales.");
                            alertDialog.setButton(AlertDialog.BUTTON_NEUTRAL, "Aceptar",
                                    (dialog, which) -> dialog.dismiss());
                            alertDialog.show();
                        } else {
                            Toast.makeText(LoginActivity.this, "Error al registrar usuario", Toast.LENGTH_LONG).show();
                        }
                    }
                }).addOnFailureListener(new OnFailureListener() {
                    @Override
                    public void onFailure(@NonNull Exception e) {
                        Toast.makeText(LoginActivity.this, "Error al registrar usuario", Toast.LENGTH_LONG).show();
                    }
                });

        return;
    }

    /**
     * Check if email is valid
     *
     * @param email
     *
     * @return boolean
     */
    private boolean isValidEmail(String email) {
        return android.util.Patterns.EMAIL_ADDRESS.matcher(email).matches();
    }

    /**
     * Check if email is already registered on Firestore
     *
     * @param userEmail
     *
     * @return boolean
     */
    private void checkIfEmailExists(String userEmail, final OnEmailCheckComplete callback) {
        // Init Firebase Firestore
        FirebaseFirestore db = FirebaseFirestore.getInstance();

        // Query users collection
        CollectionReference usersRef = db.collection("users");
        Query query = usersRef.whereEqualTo("email", userEmail);

        query.get().addOnCompleteListener(new OnCompleteListener<QuerySnapshot>() {
            @Override
            public void onComplete(Task<QuerySnapshot> task) {
                if (task.isSuccessful()) {
                    QuerySnapshot querySnapshot = task.getResult();

                    // Check if any documents match the query
                    if (querySnapshot != null && !querySnapshot.isEmpty()) {
                        callback.onComplete(true); // Email found
                    } else {
                        callback.onComplete(false); // Email not found
                    }
                } else {
                    // Handle errors here
                    // Log.e("Firestore Query", "Error getting documents: " + task.getException());
                    callback.onComplete(false); // Error occurred
                }
            }
        });
    }

    /**
     * Callback interface for checkIfEmailExists
     */
    interface OnEmailCheckComplete {
        void onComplete(boolean emailExists);
    }

    /**
     * Log tag for debugging
     */
    private static final String LOG_TAG = "";

    /**
     * SHA-256 hash function
     * http://www.java2s.com/example/android/java.lang/sha256-hash-string.html
     *
     * @param source String to hash
     *
     * @return String hashCode in SHA-256
     */
    public static String sha256string(String source) {
        byte[] hash     = null;
        String hashCode = null;

        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            hash = digest.digest(source.getBytes());
        } catch (NoSuchAlgorithmException e) {
            Log.wtf(LOG_TAG, "Can't calculate SHA-256");
        }

        if (hash != null) {
            StringBuilder hashBuilder = new StringBuilder();
            for (int i = 0; i < hash.length; i++) {
                String hex = Integer.toHexString(hash[i]);
                if (hex.length() == 1) {
                    hashBuilder.append("0");
                    hashBuilder.append(hex.charAt(hex.length() - 1));
                } else {
                    hashBuilder.append(hex.substring(hex.length() - 2));
                }
            }
            hashCode = hashBuilder.toString();
        }

        return hashCode;
    }
}