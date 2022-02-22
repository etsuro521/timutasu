module TasksHelper
    def progress(task)
        deadline = task.deadline.to_datetime
        if task.status == '完了'
            progress = 'finish'  
        elsif deadline - DateTime.now <= 0
            progress = 'late'     
        elsif deadline - DateTime.now <= 1
            progress = 'warn'
        
        end        
    end
end