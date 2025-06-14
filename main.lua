SMODS.Atlas{
    key='atlasjoker',
    path='atlasjoker.png',
    px=71,
    py=95
}

SMODS.Joker{
    key='jokerino',
    loc_txt={
        name = 'jokerjoker',
        text = {'polla'},

    }
}

SMODS.Joker {
    key = "FalsoWee",
    unlocked = true,
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 3,
    cost = 8,
    pos = { x = 0, y = 0 },
    display_size = { w = 71 * 0.7, h = 95 * 0.7 },
    config = { extra = { chips = 0, chip_mod = 8 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 2 and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod

            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
                message_card = card
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    locked_loc_vars = function(self, info_queue, card)
        return { vars = { 18 } }
    end,
    check_for_unlock = function(self, args) -- equivalent to `unlock_condition = { type = 'win', n_rounds = 18 }`
        return args.type == 'win' and 18 >= G.GAME.round
    end
}