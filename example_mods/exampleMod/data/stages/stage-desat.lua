--Not really a good example for a stage script, but I didn't know what to do with the bg.
--To access sprites created by the stage, just do "stageSprites:get("SPRITE-NAME")".
--The string should be the first parameter of the "newSprite" function that made the sprite you want to get.

local noteStyles = {"normal", "pixel"}
local curNoteStyle = 0

function beatHit()
	if curBeat % 4 > 0 then return; end

	curNoteStyle = 1 - curNoteStyle;
	for i = 0, 3, 1 do
		playerStrums[i]:loadNoteStyle(noteStyles[curNoteStyle + 1]);
		cpuStrums[i]:loadNoteStyle(noteStyles[curNoteStyle + 1]);
	end

	for i = 0, notes.members.length - 1, 1 do
		notes.members[i]:loadNoteStyle(noteStyles[curNoteStyle + 1]);
	end

	for i = 0, unspawnNotes.length - 1, 1 do
		unspawnNotes[i]:loadNoteStyle(noteStyles[curNoteStyle + 1]);
	end
end