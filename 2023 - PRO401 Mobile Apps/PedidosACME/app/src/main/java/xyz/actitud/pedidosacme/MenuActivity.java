package xyz.actitud.pedidosacme;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.GeoPoint;

import org.osmdroid.api.IGeoPoint;
import org.osmdroid.api.IMapController;
import org.osmdroid.config.Configuration;
import org.osmdroid.events.MapListener;
import org.osmdroid.events.ScrollEvent;
import org.osmdroid.events.ZoomEvent;
import org.osmdroid.tileprovider.tilesource.TileSourceFactory;
import org.osmdroid.views.MapView;
import org.osmdroid.views.overlay.Marker;
import org.osmdroid.views.overlay.mylocation.GpsMyLocationProvider;
import org.osmdroid.views.overlay.mylocation.MyLocationNewOverlay;

public class MenuActivity extends AppCompatActivity implements View.OnClickListener, LocationListener {

    public LocationManager locationManager;
    public double latitude;
    public double longitude;

    private MapView map = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Hidden card
        CardView cardViewResult = (CardView) findViewById(R.id.cardViewResult);
        cardViewResult.setVisibility(View.GONE);

        // On tap buttonUseCurrentLocation
        Button buttonUseCurrentLocation = (Button) findViewById(R.id.buttonUseCurrentLocation);
        buttonUseCurrentLocation.setOnClickListener(this);

        // On tap buttonClear
        Button buttonClear = (Button) findViewById(R.id.buttonClear);
        buttonClear.setOnClickListener(this);

        // On tap buttonCalculateDelivery
        Button buttonCalculateDelivery = (Button) findViewById(R.id.buttonCalculateDelivery);
        buttonCalculateDelivery.setOnClickListener(this);

        // buttonLogout
        findViewById(R.id.buttonLogout).setOnClickListener(this);

        // Get intent extras from LoginActivity
        Bundle extras = getIntent().getExtras();

        if (extras != null) {
            String email = extras.getString("email");

            // Set textViewWelcome to "Hola email"
            TextView textViewWelcome = (TextView) findViewById(R.id.textViewWelcome);
            textViewWelcome.setText("Hola " + email);
        }
    }

    /**
     * Request permission result
     *
     * Return boolean
     */
    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        // Check if location permission is granted
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);

        if (requestCode == 1) {
            if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                // Permission granted
                Toast.makeText(MenuActivity.this, "Permiso de ubicación concedido.", Toast.LENGTH_SHORT).show();
            } else {
                // Permission denied
                Toast.makeText(MenuActivity.this, "Permiso de ubicación denegado.", Toast.LENGTH_SHORT).show();
            }
        }
    }

    /**
     * Get user current latitude
     *
     * Return latitude as double
     */
    public double getLatitude() {
        latitude = 0.0;

        if (ContextCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED) {
            // Permission granted
            locationManager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
            String bestProvider = locationManager.getBestProvider(new android.location.Criteria(), false);
            Location location = locationManager.getLastKnownLocation(LocationManager.GPS_PROVIDER);

            // If not null, get latitude
            if (location != null) {
                // Toast message
                latitude = location.getLatitude();
                Toast.makeText(MenuActivity.this, "Ubicación GPS obtenida", Toast.LENGTH_SHORT).show();
            } else {
                // Else, get latitude from network
                location = locationManager.getLastKnownLocation(LocationManager.NETWORK_PROVIDER);
                if (location != null) {
                    latitude = location.getLatitude();
                    Toast.makeText(MenuActivity.this, "Ubicación de Network obtenida", Toast.LENGTH_SHORT).show();
                } else {
                    // No network?
                    Toast.makeText(MenuActivity.this, "No se pudo obtener ubicación", Toast.LENGTH_SHORT).show();
                    latitude = 0.0;
                }
            }
        } else {
            // Permission denied. Request permission, only once.
            ActivityCompat.requestPermissions(MenuActivity.this, new String[]{android.Manifest.permission.ACCESS_FINE_LOCATION}, 1);
            // Request WRITE_EXTERNAL_STORAGE for OSM
            ActivityCompat.requestPermissions(MenuActivity.this, new String[]{android.Manifest.permission.WRITE_EXTERNAL_STORAGE}, 1);
        }

        return latitude;
    }

    /**
     * Get user current longitude
     *
     * Return longitude as double
     */
    public double getLongitude() {
        longitude = 0.0;

        if (ContextCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED) {
            // Permission granted
            locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 5000, 10, this);

            // Get user current location
            locationManager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
            String bestProvider = locationManager.getBestProvider(new android.location.Criteria(), false);
            Location location = locationManager.getLastKnownLocation(LocationManager.GPS_PROVIDER);

            // If not null, get longitude
            if (location != null) {
                // Set longitude from GPS
                longitude = location.getLongitude();
            } else {
                // Else, get longitude from mobile Network
                location = locationManager.getLastKnownLocation(LocationManager.NETWORK_PROVIDER);
                if (location != null) {
                    longitude = location.getLongitude();
                } else {
                    // No network?
                    longitude = 0.0;
                }
            }
        }

        return longitude;
    }

    /**
     * Button click handler
     */
    @Override
    public void onClick(View view) {
        // Button: buttonUseCurrentLocation
        if (view.getId() == R.id.buttonUseCurrentLocation) {
            // Call buttonUseCurrentLocation method
            buttonUseCurrentLocation(view);
        }

        // Button: buttonClear
        if (view.getId() == R.id.buttonClear) {
            // Call buttonClear method
            buttonClear(view);
        }

        // Button: buttonCalculateDelivery
        if (view.getId() == R.id.buttonCalculateDelivery) {
            // Call buttonCalculate method
            buttonCalculateDelivery(view);
        }

        // Button: buttonLogout
        if (view.getId() == R.id.buttonLogout) {
            // Call buttonLogout method
            buttonLogout(view);
        }
    }

    /**
     * Button click: Logout
     *
     * Return to LoginActivity
     */
    public void buttonLogout(View view) {
        // Confirm logout
        // Show AlertDialog with error message
        AlertDialog.Builder builder = new AlertDialog.Builder(MenuActivity.this);
        builder.setTitle("Confirmar");
        builder.setMessage("¿Desea cerrar sesión?");
        builder.setPositiveButton("Aceptar", (dialog, which) -> {
            // Show LoginActivity
            Intent intent = new Intent(MenuActivity.this, LoginActivity.class);
            startActivity(intent);

            // Finish MenuActivity
            finish();

            // Show Toast message
            Toast.makeText(MenuActivity.this, "Sesión cerrada.", Toast.LENGTH_SHORT).show();
        });
        builder.setNegativeButton("Cancelar", null);
        builder.create();
        builder.show();
    }

    /**
     * Button click: get user current location
     */
    public <MapView> void buttonUseCurrentLocation(View view) {
        // Check if location permission is granted
        if (ActivityCompat.checkSelfPermission(MenuActivity.this, android.Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            // Request location permission
            ActivityCompat.requestPermissions(MenuActivity.this, new String[]{android.Manifest.permission.ACCESS_FINE_LOCATION}, 1);

            // Show AlertDialog with error message
            AlertDialog.Builder builder = new AlertDialog.Builder(MenuActivity.this);
            builder.setTitle("Error");
            builder.setMessage("Por favor, otorgue permiso de ubicación para poder obtener su ubicación actual.");
            builder.setPositiveButton("Aceptar", null);
            builder.create();
            builder.show();

            return;
        }

        // Get user current location
        latitude  = getLatitude();
        longitude = getLongitude();

        // Get intent extras from LoginActivity
        Bundle extras = getIntent().getExtras();

        if (extras != null) {
            // Get user email
            String email = extras.getString("email");
            String documentId = extras.getString("documentId");

            // Set our GeoPoint
            GeoPoint location = new GeoPoint(latitude, longitude);

            // Update user current location in Firestore
            FirebaseFirestore db = FirebaseFirestore.getInstance();

            db.collection("users").document(documentId).update("location", location).addOnSuccessListener(new OnSuccessListener<Void>() {
                @Override
                public void onSuccess(Void unused) {
                    // Show Toast message
                    Toast.makeText(MenuActivity.this, "Ubicación actualizada en Firestore para " + email , Toast.LENGTH_SHORT).show();
                }
            }).addOnFailureListener(new OnFailureListener() {
                @Override
                public void onFailure(@NonNull Exception e) {
                    // Show Toast message
                    Toast.makeText(MenuActivity.this, "Error al actualizar ubicación en Firestore para " + email , Toast.LENGTH_SHORT).show();
                }
            });
        }

        // Set user current location to EditText
        EditText editTextLatitude = (EditText) findViewById(R.id.editTextDeliveryLat);
        EditText editTextLongitude = (EditText) findViewById(R.id.editTextDeliveryLong);
        editTextLatitude.setText(String.valueOf(latitude));
        editTextLongitude.setText(String.valueOf(longitude));

        // Show map
        showOpenStreetMap(latitude, longitude, 17.0);
    }

    /**
     * Show OpenStreetMap
     *
     * Params:
     * - latitude: double
     * - longitude: double
     * - zoom: int
     *
     * Return void
     */
    public void showOpenStreetMap(double latitude, double longitude, double zoom) {
        // Open map (OpenStreetMap with osmdroid) overlay with pin on user current location

        // osmdroid configuration
        Context ctx = getApplicationContext();
        Configuration.getInstance().load(ctx, PreferenceManager.getDefaultSharedPreferences(ctx));

        // Inflate osm_view layout
        LayoutInflater inflater = getLayoutInflater();
        View osm_view = inflater.inflate(R.layout.osm_view, null);

        // Create map
        map = osm_view.findViewById(R.id.map);

        // Set map tile source
        map.setTileSource(TileSourceFactory.MAPNIK);
        map.setBuiltInZoomControls(true);
        map.setMultiTouchControls(true);

        // latitude and longitude to Double
        Double lat = Double.parseDouble(String.valueOf(latitude));
        Double lon = Double.parseDouble(String.valueOf(longitude));

        // Set map location
        IMapController mapController = map.getController();
        mapController.setZoom(zoom);
        IGeoPoint startPoint = new org.osmdroid.util.GeoPoint(lat, lon);
        mapController.setCenter(startPoint);

        // startPoint to org.osmdroid.util.GeoPoint
        org.osmdroid.util.GeoPoint geoPoint = new org.osmdroid.util.GeoPoint(lat, lon);

        // Show pin Marker on user current location
        Marker startMarker = new Marker(map);
        startMarker.setPosition(geoPoint);
        startMarker.setAnchor(Marker.ANCHOR_CENTER, Marker.ANCHOR_BOTTOM);
        startMarker.setTitle("Tu estás aquí");

        // Add marker to map
        map.getOverlays().add(startMarker);

        // Open a custom dialog, with layout osm_view, to show map
        AlertDialog.Builder builder = new AlertDialog.Builder(MenuActivity.this);

        builder.setView(osm_view)
                .setPositiveButton("Cerrar",
                        new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int id) {
                                map.onPause();
                            }
                        }
                )
                .setTitle("Tu ubicación");

        builder.create();
        builder.show();
    }

    /**
     * Button click: Clear EditTexts
     */
    public void buttonClear(View view) {
        // Clear EditTexts
        EditText editTextLatitude = (EditText) findViewById(R.id.editTextDeliveryLat);
        EditText editTextLongitude = (EditText) findViewById(R.id.editTextDeliveryLong);
        EditText editTextPurchaseAmount = (EditText) findViewById(R.id.editTextPurchaseAmount);

        // Clear cardViewResult and textViewResult
        CardView cardViewResult = (CardView) findViewById(R.id.cardViewResult);
        TextView textViewResult = (TextView) findViewById(R.id.textViewResult);

        editTextLatitude.setText("");
        editTextLongitude.setText("");
        editTextPurchaseAmount.setText("");

        cardViewResult.setVisibility(View.GONE);
        textViewResult.setText("");
    }

    /**
     * Button click: Calculate delivery
     */
    public void buttonCalculateDelivery(View view) {
        // Four Cases to consider
        // 1: editTextPurchaseAmount < 25000 = KM * 300
        // 2: editTextPurchaseAmount >= 25000 && editTextPurchaseAmount <= 49999 = KM * 150
        // 3: editTextPurchaseAmount >= 50000 && distance <= 20 KM = free delivery
        // 4: editTextPurchaseAmount >= 50000 && distance > 20 KM = (KM - 20) * 150

        // Get store location from EditTexts
        EditText editTextStoreLatitude = (EditText) findViewById(R.id.editTextStoreLat);
        EditText editTextStoreLongitude = (EditText) findViewById(R.id.editTextStoreLong);

        // Get user current location from EditTexts
        EditText editTextLatitude = (EditText) findViewById(R.id.editTextDeliveryLat);
        EditText editTextLongitude = (EditText) findViewById(R.id.editTextDeliveryLong);

        // Get purchase amount from EditText
        EditText editTextPurchaseAmount = (EditText) findViewById(R.id.editTextPurchaseAmount);

        // If any of the EditTexts are empty, show alert and return nothing
        if (editTextStoreLatitude.getText().toString().isEmpty() || editTextStoreLongitude.getText().toString().isEmpty() || editTextLatitude.getText().toString().isEmpty() || editTextLongitude.getText().toString().isEmpty() || editTextPurchaseAmount.getText().toString().isEmpty()) {
            // Show AlertDialog with error message
            AlertDialog.Builder builder = new AlertDialog.Builder(MenuActivity.this);
            builder.setTitle("Error");
            builder.setMessage("Por favor, ingrese todos los datos.");
            builder.setPositiveButton("Aceptar", null);
            builder.create();
            builder.show();

            return;
        }

        // Do the math
        // Get distance between store and user current location
        double distanceToTravel = haversineDistance(Double.parseDouble(editTextStoreLatitude.getText().toString()), Double.parseDouble(editTextStoreLongitude.getText().toString()), Double.parseDouble(editTextLatitude.getText().toString()), Double.parseDouble(editTextLongitude.getText().toString()));

        // Purchase amount
        double purchaseAmount = Double.parseDouble(editTextPurchaseAmount.getText().toString());

        // Calculate delivery cost
        double deliveryCost = 0.0;

        if (purchaseAmount < 25000) {
            deliveryCost = distanceToTravel * 300;
        } else if (purchaseAmount >= 25000 && purchaseAmount <= 49999) {
            deliveryCost = distanceToTravel * 150;
        } else if (purchaseAmount >= 50000 && distanceToTravel <= 20) {
            deliveryCost = 0.0;
        } else if (purchaseAmount >= 50000 && distanceToTravel > 20) {
            deliveryCost = (distanceToTravel - 20) * 150;
        }

        // Round up delivery cost to no decimals
        deliveryCost = Math.round(deliveryCost);

        // Show detailed delivery cost, with distance to travel, purchased amount and delivery cost
        CardView cardViewResult = (CardView) findViewById(R.id.cardViewResult);
        TextView textViewResult = (TextView) findViewById(R.id.textViewResult);

        cardViewResult.setVisibility(View.VISIBLE);

        String result = "Distancia a recorrer: " + distanceToTravel + " KM\n" +
                "Monto de la compra: $" + String.format("%.0f", purchaseAmount) + "\n" +
                "Costo de envío: $" + String.format("%.0f", deliveryCost) + "\n" +
                "Total a pagar: $" + String.format("%.0f", (purchaseAmount + deliveryCost));


        textViewResult.setText(result);
    }

    /**
     * Haversine formula to calculate distance between two points (latitude and longitude)
     *
     * Return distance as double
     */
    public double haversineDistance(double lat1, double lon1, double lat2, double lon2) {
        // Calculate distance
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);

        lat1 = Math.toRadians(lat1);
        lat2 = Math.toRadians(lat2);

        double a = Math.pow(Math.sin(dLat / 2), 2) + Math.pow(Math.sin(dLon / 2), 2) * Math.cos(lat1) * Math.cos(lat2);

        double rad = 6371;

        double c = 2 * Math.asin(Math.sqrt(a));

        // Distance in KM
        double distance = rad * c;

        // Round up distance to 2 decimals
        distance = Math.round(distance * 100.0) / 100.0;

        return distance;
    }

    @Override
    protected void onPause() {
        super.onPause();

        // If location permission is granted, remove location updates
        if (ContextCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED) {
            locationManager.removeUpdates(this);
        }

        //map.onPause();
    }

    @Override
    public void onLocationChanged(@NonNull Location location) {
    }

    // On resume
    @Override
    protected void onResume() {
        super.onResume();

        //map.onResume();
    }
}