SMODS.Joker{ --Avocado
    key = "avocado",
    config = {
        extra = {
            pb_mult_1872ad3d = 2,
            perma_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Avocado',
        ['text'] = {
            [1] = 'Played cards gain {C:red}+2 {}Mult,',
            [2] = '{C:attention}permanently{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 2
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
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["kylomask_kylomask_jokers"] = true, ["kylomask_jimbob"] = true },

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
            context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.pb_mult_1872ad3d
            return {
                extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
            }
        end
    end
}
