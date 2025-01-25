seconds = round(current_time/1000)%60
minutes = round(current_time/60000)
seconds_format = string_replace(string_format(seconds, 2, 0), " ", "0")
minutes_format =  string_replace(string_format(minutes, 2, 0), " ", "0")
time_string = string_join("", "Time: ", minutes_format, ":", seconds_format)

score += 1
score_string = string_join("", "Score: ", string_replace_all(string_format(score, 8, 0), " ", "0"))