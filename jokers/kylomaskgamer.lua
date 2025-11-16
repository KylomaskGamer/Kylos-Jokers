SMODS.Joker { --KylomaskGamer
    key = "kylomaskgamer",
    config = {
        extra = {
            pow = 0,
            flushplayed = 0,
            repetitions = 2,
            repetitions2 = 4
        }
    },
    loc_txt = {
        ['name'] = 'KylomaskGamer',
        ['text'] = {
            [1] = 'All {C:attention}cards in hand{} retrigger {C:attention}2{} times if',
            [2] = 'hand contains a {C:attention}Straight{} or a {C:attention}Flush{},',
            [3] = 'and an additional {C:attention}2{} times if hand contains',
            [4] = 'a {C:attention}Five of a Kind{} or a {C:attention}Straight Flush{}',
            [5] = 'Also, {X:chips,C:white}X1{} Chips for every {C:purple}POW 4{} Flushes',
            [6] = '{C:inactive,s:0.85}Don\'t know math? I won\'t explain,{} {X:tarot,C:white,s:0.85}Nope!{}',
            [7] = '(Currently {C:attention}#1#{} Flushes, therefore {X:chips,C:white}X#2#{} Chips)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
    },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["kylomask_kylomask_jokers"] = true, ["kylomask_legendary"] = true },
    soul_pos = {
        x = 0,
        y = 3
    },
    in_pool = function(self, args)
        return (
                not args
                or args.source ~= 'sho'
                or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
            )
            and true
    end,

    loc_vars = function(self, info_queue, card)
        local flushes = G.GAME.hands['Flush'].played or 0
        local pow = 1 + math.log(1 + flushes, 4) -- log base 4, min 1
        return { vars = { flushes, pow } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if ((next(context.poker_hands["Flush"]) or next(context.poker_hands["Straight"])) and (not (next(context.poker_hands["Straight Flush"])) and not (next(context.poker_hands["Flush Five"])))) then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            elseif (next(context.poker_hands["Straight Flush"]) or next(context.poker_hands["Five of a Kind"])) then
                return {
                    repetitions = card.ability.extra.repetitions2,
                    message = localize('k_again_ex')
                }
            end
        end

        if context.cardarea == G.jokers and context.joker_main then
            local flushes = G.GAME.hands['Flush'].played or 0
            card.ability.extra.pow = 1 + math.log(1 + flushes, 4) -- pow = X1 Chips, min 1, log base 4
            return {
                x_chips = card.ability.extra.pow
            }
        end
    end


}
