function check(yearC, monthC, dayC)
    local now_date = os.time()
    local date_burned = os.time{year=yearC, month=monthC, day=dayC}
    local date_f = now_date - date_burned
    print(os.date("Вы прожили "..date_f// 60 // 60 // 24 .." дней"))
end
    
check(1999, 4, 20)