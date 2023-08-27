package kr.co.sl.tmap_raster_flutter_sample
import androidx.appcompat.app.AppCompatActivity

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import android.os.Bundle 
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.view.FlutterView
import android.util.Log



class NavFlutter: AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        startActivity(
            FlutterFragmentActivity
                .withNewEngine()
                .initialRoute("/root")
                .build(this)
        )
    }

}
