# 下载输入链接的音频。
function dydw() {
    read url
    echo "处理后:$url"
    directory="/tmp/"
    curl -L -o "$directory/audio.mpeg" "$url"

    open "$directory/audio.mpeg"
}

# 打开 Argos 日志页。
function sargos() {
    echo "即将访问:$1"
    url="https://cloud.bytedance.net/argos/streamlog/info_overview/log_id_search?isCustomTime=false&logId=$1&log_search=true&psm=maya.voip.voip&psmList=&region=cn&timeSpan=10&trace_search=true&x-resource-account=public"
    open $url
}
