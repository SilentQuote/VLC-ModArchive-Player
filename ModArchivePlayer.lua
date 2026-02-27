function descriptor()
  return {
    title = "Mod Archive Player",
    capabilities = { "input-listener" }
  }
end

function activate()
	vlc.msg.dbg("[Mod Archive Player] Mod Archive Player starting. Version 1.0. By Jegneg")
	math.randomseed(os.time())
	local id = math.random(1,213009)
	vlc.playlist.add({{path="https://api.modarchive.org/downloads.php?moduleid=" .. id}})
end

function deactivate()
end

function meta_changed()
end

function input_changed()
	vlc.msg.dbg("[Mod Archive Player]Fetching a new song...")
	if vlc.input.is_playing() and vlc.playlist.status() == "playing" then
		local id = math.random(1,213009)
		vlc.playlist.enqueue({{path="https://api.modarchive.org/downloads.php?moduleid=" .. id}})
	end
end