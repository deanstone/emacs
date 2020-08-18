export all_proxy=socks5://10.0.0.1:1281
export http_proxy=http://10.0.0.1:1282

export MAVEN_OPTS="-Xms1024m -Xmx4096m -DsocksProxyHost=10.0.0.1 -DsocksProxyPort=1281"
export HOMEBREW_NO_AUTO_UPDATE=true
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
