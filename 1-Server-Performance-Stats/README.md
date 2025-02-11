# Server Performance Stats
> [!NOTE]
>  Prepared for **Debian** based systems.
## Usage:
1. Clone git repository
	```bash
	git clone
	```
2. Make it executable
	```bash
	chmod +x server-stats.sh
	```
3. Run
	```bash
	./server-stats.sh
	```
## Requirements:
- [x] Total CPU usage
- [x] Total memory usage (Free vs Used including percentage)
- [x] Total disk usage (Free vs Used including percentage)
- [x] Top 5 processes by CPU usage
- [x] Top 5 processes by memory usage
## Additional goals:
- [x] os version
- [x] uptime
- [x] load average
- [x] logged in users
- [x] failed login attempts