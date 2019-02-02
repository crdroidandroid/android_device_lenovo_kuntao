#!/vendor/bin/sh
# Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

#
# start ril-daemon only for targets on which radio is present
#
baseband=`getprop ro.baseband`
datamode=`getprop persist.vendor.data.mode`

case "$baseband" in
    "apq")
    setprop ro.vendor.radio.noril yes
    stop ril-daemon
    stop vendor.ril-daemon
esac

case "$baseband" in
    "msm" | "unknown")
    start vendor.ipacm-diag
    start vendor.ipacm

    multisim=`getprop persist.radio.multisim.config`

    if [ "$multisim" = "dsds" ] || [ "$multisim" = "dsda" ]; then
        start vendor.ril-daemon2
    fi

    case "$datamode" in
        "tethered")
            start vendor.dataqti
            ;;
        "concurrent")
            start vendor.dataqti
            start vendor.netmgrd
            ;;
        *)
            start vendor.netmgrd
            ;;
    esac
esac
 
start_copying_prebuilt_qcril_db()
{
    if [ -f /vendor/radio/qcril_database/qcril.db -a ! -f /data/vendor/radio/qcril.db ]; then
        cp /vendor/radio/qcril_database/qcril.db /data/vendor/radio/qcril.db
        chown -h radio.radio /data/vendor/radio/qcril.db
    fi
}

#
# Make modem config folder and copy firmware config to that folder for RIL
#
if [ -f /data/vendor/modem_config/ver_info.txt ]; then
    prev_version_info=`cat /data/vendor/modem_config/ver_info.txt`
else
    prev_version_info=""
fi

cur_version_info=`cat /vendor/firmware_mnt/verinfo/ver_info.txt`
if [ ! -f /vendor/firmware_mnt/verinfo/ver_info.txt -o "$prev_version_info" != "$cur_version_info" ]; then
    rm -rf /data/vendor/modem_config
    mkdir /data/vendor/modem_config
    chmod 770 /data/vendor/modem_config
    cp /vendor/firmware_mnt/image/modem_pr/mcfg/configs/mbn_ota.txt /data/vendor/modem_config/mbn_ota.txt
    cp /vendor/firmware_mnt/image/modem_pr/mcfg/configs/mcfg_sw/generic/apac/reliance/commerci/mcfg_sw.mbn /data/vendor/modem_config/rjil.mbn
    cp /vendor/firmware_mnt/image/modem_pr/mcfg/configs/mcfg_sw/generic/eu/3uk/3uk/mcfg_sw.mbn /data/vendor/modem_config/3uk_gb.mbn
    cp /vendor/firmware_mnt/image/modem_pr/mcfg/configs/mcfg_sw/generic/sea/smartfre/commerci/mcfg_sw.mbn /data/vendor/modem_config/smartfren.mbn
    cp /vendor/firmware_mnt/image/modem_pr/mcfg/configs/mcfg_sw/generic/sea/ytl/gen_3gpp/mcfg_sw.mbn /data/vendor/modem_config/ytl.mbn
    cp /vendor/firmware_mnt/image/modem_pr/mcfg/configs/mcfg_sw/generic/common/gcf/gen_3gpp/mcfg_sw.mbn /data/vendor/modem_config/gcf.mbn
    cp /vendor/firmware_mnt/image/modem_pr/mcfg/configs/mcfg_sw/generic/row/default/gen_3gpp/mcfg_sw.mbn /data/vendor/modem_config/row.mbn
    chown -hR radio.radio /data/vendor/modem_config
    cp /vendor/firmware_mnt/verinfo/ver_info.txt /data/vendor/modem_config/ver_info.txt
    chown radio.radio /data/vendor/modem_config/ver_info.txt
fi
cp /vendor/firmware_mnt/image/modem_pr/mbn_ota.txt /data/vendor/modem_config
chown radio.radio /data/vendor/modem_config/mbn_ota.txt
echo 1 > /data/vendor/radio/copy_complete

#
# Copy qcril.db if needed for RIL
#
start_copying_prebuilt_qcril_db
echo 1 > /data/vendor/radio/db_check_done

if [ -f /data/system/users/0/settings_global.xml ]; then
    sed -i 's/"multi_sim_data_call" value="1"/"multi_sim_data_call" value="-1"/g' /data/system/users/0/settings_global.xml
    restorecon /data/system/users/0/settings_global.xml
fi
