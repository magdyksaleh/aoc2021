with open("../data.txt", 'r') as f:
    lines = f.readlines()
speeds = [int(l.strip()) for l in lines]

num_increase = 0
for i,s in enumerate(speeds):
    if i < 1:
        continue
    if s > speeds[i-1]:
        num_increase += 1

print("num_single:", num_increase)

num_triple_increase = 0
for i,s in enumerate(speeds):
    if i < 3:
        continue
    prev_triple_sum = speeds[i-1] + speeds[i-2] + speeds[i-3]
    cur_triple_sum = s + speeds[i-1] + speeds[i-2]
    if cur_triple_sum > prev_triple_sum:
        num_triple_increase += 1

print("num_triple_increase:", num_triple_increase)
