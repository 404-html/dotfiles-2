
if [ `hostname` = "t560" ];then 
    # Font scaling
    export GDK_DPI_SCALE=1.2
    export ELM_SCALE=1.2
    #export QT_SCALE_FACTOR=1.1 # This breaks kwin

    cat << 'EOF' | xrdb -merge
Xft.dpi: 115 
URxvt.font: xft:inconsolata:pixelsize=16
EOF

fi
