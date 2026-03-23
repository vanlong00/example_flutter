package io.pamg.file.archiver

import android.graphics.Outline
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.util.TypedValue
import android.view.LayoutInflater
import android.view.View
import android.view.ViewOutlineProvider
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import com.google.android.gms.ads.nativead.MediaView
import com.google.android.gms.ads.nativead.NativeAd
import com.google.android.gms.ads.nativead.NativeAdView
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin

class NativeAdFactory(private val layoutInflater: LayoutInflater) :
    GoogleMobileAdsPlugin.NativeAdFactory {

    override fun createNativeAd(
        nativeAd: NativeAd,
        customOptions: MutableMap<String, Any>?,
    ): NativeAdView {
        val adView = layoutInflater.inflate(R.layout.native_ad_view, null) as NativeAdView

        // ── Wire ad views ─────────────────────────────────────────────────────
        adView.mediaView = adView.findViewById<MediaView>(R.id.ad_media)
        adView.headlineView = adView.findViewById(R.id.ad_headline)
        adView.bodyView = adView.findViewById(R.id.ad_body)
        adView.callToActionView = adView.findViewById(R.id.ad_call_to_action)
        adView.iconView = adView.findViewById(R.id.ad_app_icon)

        // ── Ad badge — always bold Roboto ─────────────────────────────────────
        adView.findViewById<TextView>(R.id.ad_badge).typeface =
            Typeface.create("Roboto", Typeface.BOLD)

        // ── Apply customOptions styles ────────────────────────────────────────
        val opts = customOptions ?: emptyMap<String, Any>()

        val bgColor = (opts["backgroundColor"] as? Long)?.toInt()
        if (bgColor != null) adView.setBackgroundColor(bgColor)

        val headlineView = adView.headlineView as TextView
        val bodyView = adView.bodyView as TextView

        (opts["headlineFontSize"] as? Double)?.let { headlineView.textSize = it.toFloat() }
        (opts["headlineFontColor"] as? Long)?.let { headlineView.setTextColor(it.toInt()) }
        headlineView.typeface = typefaceFor(opts["headlineFontWeight"] as? String)

        (opts["bodyFontSize"] as? Double)?.let { bodyView.textSize = it.toFloat() }
        (opts["bodyFontColor"] as? Long)?.let { bodyView.setTextColor(it.toInt()) }
        bodyView.typeface = typefaceFor(opts["bodyFontWeight"] as? String)

        val ctaButton = adView.callToActionView as Button
        val ctaCornerPx = TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP, 8f, adView.resources.displayMetrics
        )
        val ctaBg = GradientDrawable().apply {
            shape = GradientDrawable.RECTANGLE
            cornerRadius = ctaCornerPx
            (opts["ctaBackgroundColor"] as? Long)?.let { setColor(it.toInt()) }
        }
        ctaButton.background = ctaBg
        (opts["ctaFontSize"] as? Double)?.let { ctaButton.textSize = it.toFloat() }
        (opts["ctaFontColor"] as? Long)?.let { ctaButton.setTextColor(it.toInt()) }
        ctaButton.typeface = typefaceFor(opts["ctaFontWeight"] as? String)

        // ── Icon: 5dp rounded corners via outline clipping ────────────────────
        val iconView = adView.iconView as ImageView
        val cornerPx = TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP, 5f, adView.resources.displayMetrics
        )
        iconView.outlineProvider = object : ViewOutlineProvider() {
            override fun getOutline(view: View, outline: Outline) {
                outline.setRoundRect(0, 0, view.width, view.height, cornerPx)
            }
        }
        iconView.clipToOutline = true

        // ── Populate guaranteed assets ────────────────────────────────────────
        headlineView.text = nativeAd.headline
        adView.mediaView!!.mediaContent = nativeAd.mediaContent

        // ── Populate optional assets ──────────────────────────────────────────
        if (nativeAd.body == null) {
            bodyView.visibility = View.INVISIBLE
        } else {
            bodyView.visibility = View.VISIBLE
            bodyView.text = nativeAd.body
        }

        if (nativeAd.callToAction == null) {
            ctaButton.visibility = View.INVISIBLE
        } else {
            ctaButton.visibility = View.VISIBLE
            ctaButton.text = nativeAd.callToAction
        }

        if (nativeAd.icon == null) {
            iconView.visibility = View.GONE
        } else {
            iconView.setImageDrawable(nativeAd.icon!!.drawable)
            iconView.visibility = View.VISIBLE
        }

        adView.setNativeAd(nativeAd)
        return adView
    }

    private fun typefaceFor(weight: String?): Typeface = when (weight) {
        "bold" -> Typeface.create("Roboto", Typeface.BOLD)
        "italic" -> Typeface.create("Roboto", Typeface.ITALIC)
        "monospace" -> Typeface.MONOSPACE
        else -> Typeface.create("Roboto", Typeface.NORMAL)
    }
}
