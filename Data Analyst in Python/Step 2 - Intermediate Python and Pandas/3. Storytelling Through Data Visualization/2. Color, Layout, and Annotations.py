## 3. Setting Line Color Using RGB ##

# fig = plt.figure(figsize=(12, 12))

# for sp in range(0,4):
#     ax = fig.add_subplot(2,2,sp+1)
#     # The color for each line is assigned here.
#     ax.plot(women_degrees['Year'], women_degrees[major_cats[sp]], c='blue', label='Women')
#     ax.plot(women_degrees['Year'], 100-women_degrees[major_cats[sp]], c='green', label='Men')
#     for key,spine in ax.spines.items():
#         spine.set_visible(False)
#     ax.set_xlim(1968, 2011)
#     ax.set_ylim(0,100)
#     ax.set_title(major_cats[sp])
#     ax.tick_params(bottom="off", top="off", left="off", right="off")

# plt.legend(loc='upper right')
# plt.show()
cb_dark_blue = (0/255, 107/255, 164/255)
cb_orange = (255/255, 128/255, 14/255)

fig = plt.figure(figsize=(12, 12))

for sp in range(0,4):
    ax = fig.add_subplot(2,2,sp+1)
    # The color for each line is assigned here.
    ax.plot(women_degrees['Year'], women_degrees[major_cats[sp]], c=cb_dark_blue, label='Women')
    ax.plot(women_degrees['Year'], 100-women_degrees[major_cats[sp]], c=cb_orange, label='Men')
    for key,spine in ax.spines.items():
        spine.set_visible(False)
    ax.set_xlim(1968, 2011)
    ax.set_ylim(0,100)
    ax.set_title(major_cats[sp])
    ax.tick_params(bottom="off", top="off", left="off", right="off")

plt.legend(loc='upper right')
plt.show()

## 4. Setting Line Width ##

# cb_dark_blue = (0/255, 107/255, 164/255)
# cb_orange = (255/255, 128/255, 14/255)

# fig = plt.figure(figsize=(12, 12))

# for sp in range(0,4):
#     ax = fig.add_subplot(2,2,sp+1)
#     # Set the line width when specifying how each line should look.
#     ax.plot(women_degrees['Year'], women_degrees[major_cats[sp]], c=cb_dark_blue, label='Women')
#     ax.plot(women_degrees['Year'], 100-women_degrees[major_cats[sp]], c=cb_orange, label='Men')
#     for key,spine in ax.spines.items():
#         spine.set_visible(False)
#     ax.set_xlim(1968, 2011)
#     ax.set_ylim(0,100)
#     ax.set_title(major_cats[sp])
#     ax.tick_params(bottom="off", top="off", left="off", right="off")

# plt.legend(loc='upper right')
# plt.show()
cb_dark_blue = (0/255, 107/255, 164/255)
cb_orange = (255/255, 128/255, 14/255)

fig = plt.figure(figsize=(12, 12))

for sp in range(0,4):
    ax = fig.add_subplot(2,2,sp+1)
    # Set the line width when specifying how each line should look.
    ax.plot(women_degrees['Year'], women_degrees[major_cats[sp]], c=cb_dark_blue, label='Women', linewidth=3)
    ax.plot(women_degrees['Year'], 100-women_degrees[major_cats[sp]], c=cb_orange, label='Men', linewidth=3)
    for key,spine in ax.spines.items():
        spine.set_visible(False)
    ax.set_xlim(1968, 2011)
    ax.set_ylim(0,100)
    ax.set_title(major_cats[sp])
    ax.tick_params(bottom="off", top="off", left="off", right="off")

plt.legend(loc='upper right')
plt.show()

## 5. Improve the Layout and Ordering ##

stem_cats = ['Engineering', 'Computer Science', 'Psychology', 'Biology', 'Physical Sciences', 'Math and Statistics']

# fig = plt.figure(figsize=(12, 12))

# for sp in range(0,4):
#     ax = fig.add_subplot(2,2,sp+1)
#     ax.plot(women_degrees['Year'], women_degrees[major_cats[sp]], c=cb_dark_blue, label='Women', linewidth=3)
#     ax.plot(women_degrees['Year'], 100-women_degrees[major_cats[sp]], c=cb_orange, label='Men', linewidth=3)
#     for key,spine in ax.spines.items():
#         spine.set_visible(False)
#     ax.set_xlim(1968, 2011)
#     ax.set_ylim(0,100)
#     ax.set_title(major_cats[sp])
#     ax.tick_params(bottom="off", top="off", left="off", right="off")

# plt.legend(loc='upper right')
# plt.show()
fig = plt.figure(figsize=(18, 3))

for sp in range(0,6):
    ax = fig.add_subplot(1,6,sp+1)
    ax.plot(women_degrees['Year'], women_degrees[stem_cats[sp]], c=cb_dark_blue, label='Women', linewidth=3)
    ax.plot(women_degrees['Year'], 100-women_degrees[stem_cats[sp]], c=cb_orange, label='Men', linewidth=3)
    for key,spine in ax.spines.items():
        spine.set_visible(False)
    ax.set_xlim(1968, 2011)
    ax.set_ylim(0,100)
    ax.set_title(stem_cats[sp])
    ax.tick_params(bottom="off", top="off", left="off", right="off")

plt.legend(loc='upper right')
plt.show()

## 7. Annotating in Matplotlib ##

# fig = plt.figure(figsize=(18, 3))

# for sp in range(0,6):
#     ax = fig.add_subplot(1,6,sp+1)
#     ax.plot(women_degrees['Year'], women_degrees[stem_cats[sp]], c=cb_dark_blue, label='Women', linewidth=3)
#     ax.plot(women_degrees['Year'], 100-women_degrees[stem_cats[sp]], c=cb_orange, label='Men', linewidth=3)
#     for key,spine in ax.spines.items():
#         spine.set_visible(False)
#     ax.set_xlim(1968, 2011)
#     ax.set_ylim(0,100)
#     ax.set_title(stem_cats[sp])
#     ax.tick_params(bottom="off", top="off", left="off", right="off")
# plt.legend(loc='upper right')
# plt.show()
fig = plt.figure(figsize=(18, 3))

for sp in range(0,6):
    ax = fig.add_subplot(1,6,sp+1)
    ax.plot(women_degrees['Year'], women_degrees[stem_cats[sp]], c=cb_dark_blue, label='Women', linewidth=3)
    ax.plot(women_degrees['Year'], 100-women_degrees[stem_cats[sp]], c=cb_orange, label='Men', linewidth=3)
    for key,spine in ax.spines.items():
        spine.set_visible(False)
    ax.set_xlim(1968, 2011)
    ax.set_ylim(0,100)
    ax.set_title(stem_cats[sp])
    ax.tick_params(bottom="off", top="off", left="off", right="off")
    
    if sp == 0:
        ax.text(2005, 87, 'Men')
        ax.text(2002, 8, 'Women')
    elif sp == 5:
        ax.text(2005, 62, 'Men')
        ax.text(2001, 35, 'Women')
plt.show()