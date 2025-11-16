SMODS.Joker{ --Brisk Iced Tea
    key = "briskicedtea",
    config = {
        extra = {
            ml = 355,
            Xmult = 5,
            start_dissolve = 0,
            y = 0
        }
    },
    loc_txt = {
        ['name'] = 'Brisk Iced Tea',
        ['text'] = {
            [1] = 'Select this card {X:attention,C:white}before{} scoring to consume {C:attention}71ml{}',
            [2] = 'from this can, and grant {X:red,C:white}X5{} Mult for the hand.',
            [3] = '{C:inactive}({C:attention}#1#{C:inactive}/{C:attention}355ml{} {C:inactive}left before {C:red}self-destruction{}{C:inactive}){}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["kylomask_kylomask_jokers"] = true, ["kylomask_jimbob"] = true },
    in_pool = function(self, args)
          return (
          not args 
            
          or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and not G.GAME.pool_flags.kylomask_brisked
      end,

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.ml}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if #G.jokers.highlighted == 1 then
                card.ability.extra.ml = math.max(0, (card.ability.extra.ml) - 71)
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
        if context.after and context.cardarea == G.jokers  then
            if card.ability.extra.ml <= 0 then
                return {
                    func = function()
                        card:start_dissolve()
                        return true
                        end,
                        message = "Empty!"
                    }
                end
            end
        end
}