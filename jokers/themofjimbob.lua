SMODS.Joker{ --The M of Jimbob
    key = "themofjimbob",
    config = {
        extra = {
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'The M of Jimbob',
        ['text'] = {
            [1] = 'All cards retrigger',
            [2] = 'when hand contains a {C:attention}Pair{}',
            [3] = '{C:inactive,s:0.75}(this has NOTHING to do with cryptid){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["kylomask_kylomask_jokers"] = true, ["kylomask_jimbob"] = true },

    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if next(context.poker_hands["Pair"]) then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}