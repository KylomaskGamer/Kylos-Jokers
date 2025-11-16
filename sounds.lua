function jokerExists(abilityname)
    local _check = false
    if G.jokers and G.jokers.cards then
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].ability.name == abilityname then _check = true end
            --if G.jokers.cards[i].ability.name == 'j_yahimod_subwaysurfers' then _check = true end
        end
    end
    return _check
end

SMODS.Sound{
    key="music_banger1",
    path="music_banger1.ogg",
    pitch=1,
    volume=0.6,
    select_music_track = function()
        if jokerExists("j_kylomask_thebangercard") then
		    return true end
	end,
}