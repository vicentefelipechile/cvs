// IncludeScript("vs_library")

::cvs = {}
::cvs_prefix = "."
::cvs_commands = {}


::cvs.findPlayerByName <- function (name) {
	local target = null
	local name = name.tolower()

	while( target = Entities.FindByClassname(target, "player") ) {
		local ply = NetProps.GetPropString(target,"m_szNetname").tostring().tolower()
		if( ply.find(name) == 0 ) {
			return target
		}
	}

	return null
}

::cvs.sendCommand <- function(msg) {
    local prefix = msg.slice(0, 1)
    local userid = msg.userid
    if ( prefix != ::cvs_prefix ) { return }

    local cmds = split( strip(msg.slice(1)), " " )
    local cmd = cmds[0]

    printl(cmds.len())

    if ( cmds.len() >= 1 ) { return }


    if ( cmd == "kill" ) {
        printl("Hola")
    }
}


function OnGameEvent_player_chat(msg) {
    ::cvs.sendCommand(msg)
}