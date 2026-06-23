# 打印常用测试数据。
function print_dev()
{
    echo "My UID: 75212470474"
    echo "My DID Prod: 833905831709292"
    echo "My DID Test: 2118136866833772"
    echo "Se DID Test: 376495608697627"
    echo "Test Pair UID: 108315688949"
    echo "Ano UID: 108315688949"
    echo "Min Int64:-9223372036854775808"
    echo "Max Int64:9223372036854775807"
}

# 打开脚本日志页。
function slog()
{
    echo $1
    open "https://cloud.bytedance.net/argos/streamlog/info_overview/log_id_search?logId=$1&psm=aweme.script.im_group_chat&region=cn"
}
