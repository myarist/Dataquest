## 1. Introduction to the Data ##

raw_hamlet = sc.textFile("hamlet.txt")
raw_hamlet.take(5)

## 2. The Map Method ##

split_hamlet = raw_hamlet.map(lambda line: line.split('\t'))
split_hamlet.take(5)

## 5. Filter Using a Named Function ##

def filter_hamlet_speaks(line):
    return False

hamlet_spoken_lines = split_hamlet.filter(lambda line: filter_hamlet_speaks(line))
hamlet_spoken_lines.take(5)
def filter_hamlet_speaks(line):
    if "HAMLET" in line:
        return True
    else:
        return False
    
hamlet_spoken_lines = split_hamlet.filter(lambda line: filter_hamlet_speaks(line))
hamlet_spoken_lines.take(5)

## 6. Actions ##

spoken_count = 0
spoken_101 = list()
spoken_count = hamlet_spoken_lines.count()
spoken_collect = hamlet_spoken_lines.collect()
spoken_101 = spoken_collect[100]