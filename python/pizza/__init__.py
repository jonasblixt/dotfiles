"""
    Pizza calculator, based on Hendrik Kleinwaechter recipe
        https://github.com/hendricius/pizza-dough

    Usage:

    calc function takes one argument, which is flour in grams
"""

def calc(flour_grams):
    water_grams = flour_grams*0.65
    salt_grams = flour_grams*0.02
    dry_yeast_grams = flour_grams*0.0005
    fresh_yeast_grams = flour_grams*0.0015

    total_weight = water_grams+salt_grams+flour_grams

    print ("Pizza dough:")
    print ("")
    print (" o %.2f g Flour"%(flour_grams))
    print (" o %.2f g Water"%(water_grams))
    print (" o %.2f g Salt"%(salt_grams))
    print (" o %.2f g dry yest OR %.2f g fresh yest"%(dry_yeast_grams,fresh_yeast_grams))
    print ("")
    print ("Total weight %.0f g"%(total_weight))
