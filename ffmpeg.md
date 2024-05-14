一些常用的ffmpeg命令：

## 生产视频关键针
ffmpeg -i input.mp4 -vf "select='eq(pict_type,I)'" -vsync 0 keyframes_%03d.png

## 设备列表
.\ffmpeg.exe  -list_devices true -f dshow -i dummy

## 通过 screen-capture-recorder进行录制
ffmpeg -f dshow  -i video="screen-capture-recorder"  -s 800x600 -offset_x 0 -offset_y 0   -r 20  screen-capture.mp4

ffmpeg -f dshow  -i video="screen-capture-recorder"   -r 20  screen-capture.mp4

## 其他命令
 -f dshow -i audio="麦克风 (Realtek(R) Audio)" -f dshow -i audio="virtual-audio-capturer" -filter_complex amix=inputs=2:duration=first:dropout_transition=2 -f gdigrab -i desktop  -vcodec libx264 -r 60.97 -b:v 1500K -codec:a aac -ac 2 -ar 44100  -pix_fmt yuv420p -tune zerolatency -preset ultrafast -f flv "rtmp://192.168.8.156:1935"


 -f gdigrab -i desktop -f dshow -i audio=\"麦克风 (Realtek(R) Audio)\"  -f dshow -i audio=\"virtual-audio-capturer\" -filter_complex amix=inputs=2:duration=first:dropout_transition=2 -vcodec libx264 -preset ultrafast -acodec libmp3lame

 ffmpeg -re -i in.mp4 -c copy -f flv rtmp://localhost:1935/live/stream


 ffmpeg -f dshow -i audio="麦克风 (Realtek High Definition Au" -f dshow -i audio="virtual-audio-capturer" -filter_complex amix=inputs=2:duration=first:dropout_transition=2 -f gdigrab -i desktop  -vcodec libx264 -r 60.97 -b:v 1500K -codec:a aac -ac 2 -ar 44100  -pix_fmt yuv420p -tune zerolatency -preset ultrafast -f flv "rtmp://localhost/live/livestream"

 -codec:a aac


 ffmpeg.exe -f dshow -i audio="麦克风 (Realtek(R) Audio)" -thread_queue_size 512 -f dshow -i audio="virtual-audio-capturer" -filter_complex amix=inputs=2:duration=first:dropout_transition=2 -thread_queue_size 64 -f gdigrab -i desktop -vcodec libx264 -preset ultrafast -codec:a aac -ac 2 -ar 44100 -tune zerolatency -q:a 0 abc.pm4


ffmpeg.exe -f dshow -i audio="麦克风 (Realtek(R) Audio)" -thread_queue_size 512 -f dshow -i audio="virtual-audio-capturer" -filter_complex amix=inputs=2:duration=first:dropout_transition=2 -thread_queue_size 64 -f gdigrab -i desktop -vcodec libx264 -preset ultrafast -codec:a aac -ac 2 -ar 44100 -tune zerolatency -q:a 0 abc.mp4

ffmpeg.exe -f dshow -i audio="麦克风 (Realtek(R) Audio)" -thread_queue_size 512 -f dshow -i audio="virtual-audio-capturer" -filter_complex amix=inputs=2:duration=first:dropout_transition=2 -thread_queue_size 64 -f gdigrab -i desktop -vcodec libx264 -preset ultrafast -codec:a aac -ac 2 -ar 44100 -tune zerolatency -q:a 0 abc.mp4

ffmpeg.exe -f dshow -i audio="麦克风 (Realtek(R) Audio)" -thread_queue_size 512 -f dshow -i audio="virtual-audio-capturer" -filter_complex amix=inputs=2:duration=first:dropout_transition=2 -codec:a aac -ac 2 -ar 44100 -tune zerolatency -q:a 0 abc.wav


ffmpeg.exe -f dshow -i audio="麦克风 (Realtek(R) Audio)"  -f dshow -i audio="virtual-audio-capturer" -filter_complex amix=inputs=2:duration=first:dropout_transition=2  123.wav

ffmpeg.exe -f dshow -i audio="麦克风 (Realtek(R) Audio)" -thread_queue_size 512  11.wav

ffmpeg.exe -f dshow -i audio="麦克风 (Realtek(R) Audio)" -thread_queue_size 512 -f dshow -i audio="virtual-audio-capturer" -filter_complex amix=inputs=2:duration=first:dropout_transition=2  124.wav
