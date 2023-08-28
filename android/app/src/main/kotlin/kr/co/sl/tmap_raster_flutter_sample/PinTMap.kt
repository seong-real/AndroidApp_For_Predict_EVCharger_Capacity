package kr.co.sl.tmap_raster_flutter_sample

import android.os.Bundle
import android.widget.FrameLayout
import androidx.appcompat.app.AppCompatActivity
import com.skt.Tmap.TMapView
import com.skt.Tmap.TMapMarkerItem
import com.skt.Tmap.TMapPoint
import android.graphics.BitmapFactory
import androidx.core.content.ContextCompat
import androidx.vectordrawable.graphics.drawable.VectorDrawableCompat
import android.widget.ImageView
import android.view.View
import android.widget.Toast
import androidx.appcompat.widget.Toolbar
import android.content.Intent
import kotlinx.android.synthetic.main.pin_tmap.*
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.embedding.engine.FlutterEngine
import java.io.FileReader
import java.io.BufferedReader
import java.io.InputStreamReader
import android.content.Context 
import java.io.BufferedWriter 
import java.io.OutputStreamWriter




class PinTMap : AppCompatActivity() {

    val API_KEY = "JEK9BypcTk7mELuqYhBxk1XQDzBkAncx38APA3Pv" // 발급받은 API 키

    var tmapView: TMapView? = null
    private val CHANNEL = "service"


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(R.layout.pin_tmap)
        tmapView = TMapView(this)

        val container = findViewById<FrameLayout>(R.id.tmappinContainer)
        container.addView(tmapView)
        val toolbar = findViewById<Toolbar>(R.id.toolbar)
        setSupportActionBar(toolbar)
        val desiredZoomLevel = 13
        tmapView?.setZoomLevel(desiredZoomLevel)
        tmapView?.setSKTMapApiKey(API_KEY)
        //tmapView?.setUserScrollZoomEnable(true); 
        val csvFile = "location.csv"
        readCsvAndAddMarkers(csvFile)
    }

    private fun readCsvAndAddMarkers(csvFileName: String) {
        val inputStream = assets.open(csvFileName)
        val reader = BufferedReader(InputStreamReader(inputStream))
        var line: String?
        
        while (reader.readLine().also { line = it } != null) {
            val parts = line!!.split(",")
            if (parts.size >= 2) {
                val latitude = parts[1].toDouble()
                val longitude = parts[0].toDouble()
                addMarkerAtLocation(latitude, longitude)
            }
        }
        reader.close()
    }
    private fun addMarkerAtLocation(latitude: Double, longitude: Double) {
        val tItem = TMapMarkerItem()
        val tMapPoint = TMapPoint(latitude, longitude)

        tItem.tMapPoint = tMapPoint
        tItem.icon = BitmapFactory.decodeResource(resources, R.drawable.marker_icon)

        tmapView?.addMarkerItem("marker_${latitude}_${longitude}", tItem)
    }
    private fun clearAndAddLocationToCsv(csvFileName: String, latitude: Double, longitude: Double) {
        // Clear the existing contents of the CSV file
        val outputStream = openFileOutput(csvFileName, Context.MODE_PRIVATE)
        outputStream.close()
    
        // Add the new data to the CSV file
        val appendStream = openFileOutput(csvFileName, Context.MODE_APPEND)
        val writer = BufferedWriter(OutputStreamWriter(appendStream))
    
        // CSV 형식에 맞게 데이터 추가
        val csvData = "$longitude,$latitude\n"
        writer.write(csvData)
    
        writer.close()
    }

    fun onClickFind(view: View) {
        tmapView?.let { mapView ->
            val tpoint = mapView.getCenterPoint()
            val now_lat = tpoint?.getLatitude()
            val now_alt = tpoint?.getLongitude()
            clearAndAddLocationToCsv("loc.csv", now_lat ?: 0.0, now_alt ?: 0.0)
        }


        startActivity(
            FlutterActivity
        .withNewEngine()
        .initialRoute("/find")
        .build(this)
        )
        
    }
   
}



