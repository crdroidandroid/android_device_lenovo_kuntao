#
# vendor.prop for kuntao
#

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1 \
    audio.deep_buffer.media=true \
    audio.offload.min.duration.secs=30 \
    audio.offload.video=true \
    persist.vendor.audio.fluence.speaker=true \
    persist.vendor.audio.fluence.voicecall=true \
    persist.vendor.audio.fluence.voicerec=false \
    ro.vendor.audio.sdk.fluencetype=none \
    vendor.audio_hal.period_size=192 \
    vendor.audio.hw.aac.encoder=true \
    vendor.audio.offload.buffer.size.kb=64 \
    vendor.audio.offload.gapless.enabled=true \
    vendor.audio.offload.multiaac.enable=true \
    vendor.audio.offload.multiple.enabled=false \
    vendor.audio.offload.passthrough=false \
    vendor.audio.offload.track.enable=true \
    vendor.audio.parser.ip.buffer.size=262144 \
    vendor.audio.playback.mch.downsample=true \
    vendor.audio.safx.pbe.enabled=true \
    vendor.voice.path.for.pcm.voip=true \
    ro.af.client_heap_size_kbyte=7168 \
    persist.vendor.audio.hw.binder.size_kbyte=1024

# Bluetooh
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.qcom.bluetooth.soc=smd

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera.hal1.packagelist=com.skype.raider,com.android.facelock,com.google.android.talk \
    persist.vendor.camera.display.umax=1920x1080 \
    persist.vendor.camera.display.lmax=1280x720 \
    vidc.enc.dcvs.extra-buff-count=2 \
    camera.lowpower.record.enable=1 \
    persist.camera.HAL3.enabled=1

# Cne
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.cne.feature=1

# Charger
PRODUCT_PROPERTY_OVERRIDES += \
    log.tag.smart_charger=W

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=288m \
    dalvik.vm.heapsize=768m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196610 \
    ro.vendor.display.cabl=0 \
    ro.sf.lcd_density=480 \
    vendor.display.disable_rotator_downscale=1

# Miracast
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.enable_hwc_vds=1 \
    persist.hwc.enable_vds=1 \
    persist.sys.wfd.nohdcp=1 \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    vendor.gralloc.disable_wb_ubwc=1 \
    vendor.gralloc.enable_fb_ubwc=1

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Factory reset protection
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/platform/soc/7824900.sdhci/by-name/config

# Fp Gestures
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.fp.navigation=1

# Fingerprint
PRODUCT_PROPERTY_OVERRIDES += \
    log.tag.synaFpHal=W \
    log.tag.SynapticsLIB=W \
    log.tag.synaTransport=W

# IMS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.vendor.qti.telephony.vt_cam_interface=1

# Gps
PRODUCT_PROPERTY_OVERRIDES += \
    ro.gps.agps_provider=1

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.audio.sink=280 \
    vendor.vidc.dec.downscalar_width=1920 \
    vendor.vidc.dec.downscalar_height=1088 \
    vendor.vidc.disable.split.mode=1 \
    vendor.vidc.enc.disable_bframes=1 \
    vendor.vidc.enc.disable_pframes=1 \
    vendor.vidc.enc.narrow.searchrange=1

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so \
    vendor.iop.enable_uxe=1 \
    vendor.perf.iop_v3.enable=1

# Qualcomm
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    debug.qc.hardware=true

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
    persist.radio.multisim.config=dsds \
    ro.telephony.default_network=9,1 \
    persist.vendor.radio.custom_ecc=1 \
    persist.vendor.radio.rat_on=combine \
    persist.vendor.radio.sib16_support=1 \
    persist.vendor.radio.add_power_save=1 \
    persist.radio.aosp_usr_pref_sel=true

# Netmgrd
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.use_data_netmgrd=true \
    persist.data.netmgrd.qos.enable=true \
    persist.vendor.data.mode=concurrent

# Fling velocities
PRODUCT_PROPERTY_OVERRIDES += \
    ro.min.fling_velocity=160 \
    ro.max.fling_velocity=20000

# RescueParty
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.disable_rescue=true

# Time Services
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.delta_time.enable=true

# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0
