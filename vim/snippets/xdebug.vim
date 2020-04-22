" Project Specific Settings for Vdebug
let g:vdebug_options = {
\    "port" : 9041,
\    "timeout" : 20,
\    "server" : '',
\    "on_close" : 'stop',
\    "break_on_open" : 0,
\    "ide_key" : 'xdebug',
\    "debug_window_level" : 0,
\    "debug_file_level" : 1,
\    "debug_file" : "~/.vdebug.log",
\    "path_maps" : {"/var/www" : "/Users/Paul/www/your_projects_root_dir"},
\    "watch_window_style" : 'expanded',
\    "marker_default" : '⬦',
\    "marker_closed_tree" : '▸',
\    "marker_open_tree" : '▾',
\    "continuous_mode"  : 0
\}
