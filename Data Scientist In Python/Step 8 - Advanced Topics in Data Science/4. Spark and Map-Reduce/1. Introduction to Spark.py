## 10. Filter ##

def filter_year(line):
    # Write your logic here
    return True

filtered_daily_show = daily_show.filter(lambda line: filter_year(line))
def filter_year(line):
    if line[0] == 'YEAR':
        return False
    else:
        return True

filtered_daily_show = daily_show.filter(lambda line: filter_year(line))