Since there is no APK yet. This markdown will explain how to have a makeshift APK instead.

## Step 1
Get this app called

[**AutoPie**](https://github.com/cryptrr/AutoPie)

Its an app that is all about shortcuts. This will make putting in

`cd ~/where/ever/your/Kic-Checker/is`

&

`python3 -m http.server -d www 8000`

a thing of the past.

> I personally use it for other repos that have a web or editing files.

## Step 2 (Skip this if you have AutoPie already)
Go to:
- Settings
- Terminal
```bash
# Have AutoPie access to storage
termux-setup-storage
# Get python
pkg install python -y
# Copies the most recent repo
git clone --depth 1 https://github.com/HuevosKicker/Kic-Checkers
```
- Close terminal
- Go back to command section
## Step 3
- Hit create
- Tap "Raw JSON"
- Paste this JSON below
```json
{
  "Start Kic-Checkers & Open Browser": {
    "description": "Starts python server and opens it in the web browser.",
    "path": "",
    "exec": "",
    "command": "#@SHELL\ncd /data/data/com.autopi/files/home/repos/Kic-Checkers\nnohup python3 -m http.server -d www 8000 > /dev/null 2>&1 &\n\nsleep 2\n\necho \"Launching Browser...\"\nam start -a android.intent.action.VIEW -d \"http://[::]:8000\"\n\nwait $FLASK_PID",
    "type": "SHARE"
  }
}
```
- Smack that create button
- Search launch
- Find "Start Kic-Checkers & Open Browser"
- Click both Runs button
- Enjoy

**Showcase of final results**:
<video controls><source src="vids/AutoPie-showcase.mp4" type="video/mp4"></video>
https://github.com/user-attachments/assets/6615c778-3a93-45e9-bed0-7844998a7f4b