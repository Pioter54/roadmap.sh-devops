#!/bin/bash

#cpu usage
echo "CPU"
cat /proc/stat |grep cpu |tail -1|awk '{print ($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}'|awk '{print "Usage: " 100-$1 "%\n"}' 

#memory usage
echo "Memory:"
awk '/MemTotal/ {t=$2} END {printf "Total: %.2f GB\n", (t)/1024/1024}' /proc/meminfo
awk '/MemTotal/ {t=$2} /MemAvailable/ {a=$2} END {printf "Used: %.1f GB (%.2f%%)\n", (t-a)/1024/1024, ((t-a)/t)*100}' /proc/meminfo
awk '/MemTotal/ {t=$2} /MemFree/ {f=$2} END {printf "Free: %.1f GB (%.2f%%)\n\n", (f)/1024/1024, (f/t)*100}' /proc/meminfo

#disk usage
echo "Disk:"
df -h |grep / -w |awk '{print "Used: " $3 " (" $5 ")\nFree: " $4 " (" 100-$5 "%)\n"}'

#top 5 cpu
echo "Top 5 cpu usage:"
ps aux --sort -pcpu |awk '{print $1 "\t" $2 "\t" $3}' | head -6
printf "\n"

#top 5 meomory
echo "Top 5 memory usage:"
ps aux --sort -pmem |awk '{print $1 "\t" $2 "\t" $4}' | head -6
printf "\n"


##################
#Additional goals#
##################

#os version
echo "OS version:"
cat /etc/os-release | grep PRETTY_NAME= |awk -F'=' '{gsub(/"/, "", $2); print $2}'
printf "\n"

#uptime
echo "Uptime:"
uptime -p
printf "\n"

#load average
echo "Average load:"
uptime | awk -F'[a-z]:' '{print $2 }' | awk -F ',' '{print "In 1 minute:" $1 "\nIn 5 minute:" $2 "\nIn 15 minute:" $3}'
printf "\n"

#logged in users
echo "Logged in users:"
w | tail -n +2
printf "\n"

#failed login attempts (SSH)
echo "Failed login attempts:"
cat /var/log/auth.log | grep -E "Failed|Failure" || echo "none"