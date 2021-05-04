#
# mvn增强
#
function msw()
{
  if [[ $1 == "ali" ]]; then
    cp ~/.m2/settings.xml.aliyun ~/.m2/settings.xml
  fi

  if [[ $1 == "xiaomi" ]]; then
    cp ~/.m2/settings.xml.xiaomi ~/.m2/settings.xml
  fi
}
