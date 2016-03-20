# ensure at most one A57 is online when thermal hotplug is disabled
echo 0 > /sys/devices/system/cpu/cpu5/online
# in case CPU4 is online, limit its frequency
echo 960000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
# Limit A57 max freq from msm_perf module in case CPU 4 is offline
echo "4:960000 5:960000" > /sys/module/msm_performance/parameters/cpu_max_freq
# disable thermal bcl hotplug to switch governor
echo 0 > /sys/module/msm_thermal/core_control/enabled
for mode in /sys/devices/soc.0/qcom,bcl.*/mode
do
    echo -n disable > $mode
done
for hotplug_mask in /sys/devices/soc.0/qcom,bcl.*/hotplug_mask
do
    bcl_hotplug_mask=`cat $hotplug_mask`
    echo 0 > $hotplug_mask
done
for hotplug_soc_mask in /sys/devices/soc.0/qcom,bcl.*/hotplug_soc_mask
do
    bcl_soc_hotplug_mask=`cat $hotplug_soc_mask`
    echo 0 > $hotplug_soc_mask
done
for mode in /sys/devices/soc.0/qcom,bcl.*/mode
do
    echo -n enable > $mode
done

# Disable CPU retention
echo 0 > /sys/module/lpm_levels/system/a53/cpu0/retention/idle_enabled
echo 0 > /sys/module/lpm_levels/system/a53/cpu1/retention/idle_enabled
echo 0 > /sys/module/lpm_levels/system/a53/cpu2/retention/idle_enabled
echo 0 > /sys/module/lpm_levels/system/a53/cpu3/retention/idle_enabled
echo 0 > /sys/module/lpm_levels/system/a57/cpu4/retention/idle_enabled
echo 0 > /sys/module/lpm_levels/system/a57/cpu5/retention/idle_enabled

# Disable L2 retention
echo 0 > /sys/module/lpm_levels/system/a53/a53-l2-retention/idle_enabled
echo 0 > /sys/module/lpm_levels/system/a57/a57-l2-retention/idle_enabled

# configure governor settings for little cluster
echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif
echo 19000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 90 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 20000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 960000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy
echo 80 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo 40000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 80000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis
echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
# online CPU4
echo 1 > /sys/devices/system/cpu/cpu4/online
# Best effort limiting for first time boot if msm_performance module is absent
echo 960000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
# configure governor settings for big cluster
echo "interactive" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif
echo 19000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 90 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 20000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 1248000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/io_is_busy
echo 85 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo 40000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 80000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis
echo 384000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
# restore A57's max
cat /sys/devices/system/cpu/cpu4/cpufreq/cpuinfo_max_freq > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
# re-enable thermal and BCL hotplug
echo 1 > /sys/module/msm_thermal/core_control/enabled
for mode in /sys/devices/soc.0/qcom,bcl.*/mode
do
    echo -n disable > $mode
done
for hotplug_mask in /sys/devices/soc.0/qcom,bcl.*/hotplug_mask
do
    echo $bcl_hotplug_mask > $hotplug_mask
done
for hotplug_soc_mask in /sys/devices/soc.0/qcom,bcl.*/hotplug_soc_mask
do
    echo $bcl_soc_hotplug_mask > $hotplug_soc_mask
done
for mode in /sys/devices/soc.0/qcom,bcl.*/mode
do
    echo -n enable > $mode
done
# plugin remaining A57s
echo 1 > /sys/devices/system/cpu/cpu5/online
echo 0 > /sys/module/lpm_levels/parameters/sleep_disabled
# Restore CPU 4 max freq from msm_performance
echo "4:4294967295 5:4294967295" > /sys/module/msm_performance/parameters/cpu_max_freq
# input boost configuration
echo 0:1248000 > /sys/module/cpu_boost/parameters/input_boost_freq
echo 40 > /sys/module/cpu_boost/parameters/input_boost_ms
# core_ctl module
insmod /system/lib/modules/core_ctl.ko
echo 2 > /sys/devices/system/cpu/cpu4/core_ctl/min_cpus
echo 60 > /sys/devices/system/cpu/cpu4/core_ctl/busy_up_thres
echo 30 > /sys/devices/system/cpu/cpu4/core_ctl/busy_down_thres
echo 100 > /sys/devices/system/cpu/cpu4/core_ctl/offline_delay_ms
echo 1 > /sys/devices/system/cpu/cpu4/core_ctl/is_big_cluster
echo 2 > /sys/devices/system/cpu/cpu4/core_ctl/task_thres
# Setting b.L scheduler parameters
echo 1 > /proc/sys/kernel/sched_migration_fixup
echo 30 > /proc/sys/kernel/sched_small_task

# android background processes are set to nice 10. Never schedule these on the a57s.
echo 9 > /proc/sys/kernel/sched_upmigrate_min_nice
for i in cpu0 cpu1 cpu2 cpu3 cpu4 cpu5 cpu6 cpu7
do
    echo 20 > /sys/devices/system/cpu/$i/sched_mostly_idle_load
    echo 3 > /sys/devices/system/cpu/$i/sched_mostly_idle_nr_run
done
echo 99 > /proc/sys/kernel/sched_upmigrate
echo 85 > /proc/sys/kernel/sched_downmigrate
echo 400000 > /proc/sys/kernel/sched_freq_inc_notify
echo 400000 > /proc/sys/kernel/sched_freq_dec_notify
#enable rps static configuration
echo 8 >  /sys/class/net/rmnet_ipa0/queues/rx-0/rps_cpus
for devfreq_gov in /sys/class/devfreq/qcom,cpubw*/governor
do
    echo "bw_hwmon" > $devfreq_gov
done
for devfreq_gov in /sys/class/devfreq/qcom,mincpubw*/governor
do
    echo "cpufreq" > $devfreq_gov
done
# Disable sched_boost
echo 0 > /proc/sys/kernel/sched_boost

# change GPU initial power level from 305MHz(level 4) to 180MHz(level 5) for power savings
echo 5 > /sys/class/kgsl/kgsl-3d0/default_pwrlevel

# change GPU initial power level from 305MHz(level 4) to 180MHz(level 5) for power savings
+echo 5 > /sys/class/kgsl/kgsl-3d0/default_pwrlevel

rm /data/system/perfd/default_values
setprop ro.min_freq_0 384000
setprop ro.min_freq_4 384000
start perfd

# Let kernel know our image version/variant/crm_version
image_version="10:"
image_version+=`getprop ro.build.id`
image_version+=":"
image_version+=`getprop ro.build.version.incremental`
image_variant=`getprop ro.product.name`
image_variant+="-"
image_variant+=`getprop ro.build.type`
oem_version=`getprop ro.build.version.codename`
echo 10 > /sys/devices/soc0/select_image
echo $image_version > /sys/devices/soc0/image_version
echo $image_variant > /sys/devices/soc0/image_variant
echo $oem_version > /sys/devices/soc0/image_crm_version
