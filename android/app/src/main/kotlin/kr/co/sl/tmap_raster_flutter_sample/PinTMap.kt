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


class PinTMap : AppCompatActivity() {

    val API_KEY = "JEK9BypcTk7mELuqYhBxk1XQDzBkAncx38APA3Pv" // 발급받은 API 키

    var tmapView: TMapView? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(R.layout.pin_tmap)
        tmapView = TMapView(this)

        val container = findViewById<FrameLayout>(R.id.tmappinContainer)
        container.addView(tmapView)
        val toolbar = findViewById<Toolbar>(R.id.toolbar)
        setSupportActionBar(toolbar)

        tmapView?.setSKTMapApiKey(API_KEY)
        addMarkerAtLocation(37.570841, 126.985302)
    }

    private fun addMarkerAtLocation(latitude: Double, longitude: Double) {
        val tItem = TMapMarkerItem()
        val tMapPoint = TMapPoint(latitude, longitude)

        tItem.tMapPoint = tMapPoint
        tItem.icon = BitmapFactory.decodeResource(resources, R.drawable.marker_icon) // 마커 아이콘 설정

        tmapView?.addMarkerItem("marker1", tItem)
    }
}