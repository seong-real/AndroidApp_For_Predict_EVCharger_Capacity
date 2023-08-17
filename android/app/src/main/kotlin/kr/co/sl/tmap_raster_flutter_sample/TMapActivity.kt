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

class TMapActivity : AppCompatActivity() {

    val API_KEY = "JEK9BypcTk7mELuqYhBxk1XQDzBkAncx38APA3Pv" // 발급받은 API 키

    var tmapView: TMapView? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(R.layout.activity_tmap)
        tmapView = TMapView(this)

        val container = findViewById<FrameLayout>(R.id.tmapContainer)
        container.addView(tmapView)

        tmapView?.setSKTMapApiKey(API_KEY)
        addMarkerAtLocation(37.570841, 126.985302)

        val vectorImageView = findViewById<ImageView>(R.id.vectorImageView)
        val vectorDrawable = VectorDrawableCompat.create(resources, R.drawable.ui1, null)
        vectorImageView.setImageDrawable(vectorDrawable)


    }

    private fun addMarkerAtLocation(latitude: Double, longitude: Double) {
        val tItem = TMapMarkerItem()
        val tMapPoint = TMapPoint(latitude, longitude)

        tItem.tMapPoint = tMapPoint
        tItem.icon = BitmapFactory.decodeResource(resources, R.drawable.marker_icon) // 마커 아이콘 설정

        tmapView?.addMarkerItem("marker1", tItem)
    }
}
