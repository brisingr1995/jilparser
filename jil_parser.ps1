rm storage.txt

$job_counter=0;
$att_counter=0;

$insert_job=''
$job_type=''
$command=''
$machine=''
$owner=''
$permission=''
$date_conditions=''
$days_of_week=''
$start_times=''
$description=''
$std_out_file=''
$std_err_file=''
$alarm_if_fail=''
$end=''
$box_name=''
$condition=''
$run_window=''
$n_retrys=''
$term_run_time=''
$box_terminator=''
$job_terminator=''
$min_run_alarm=''
$max_run_alarm=''
$profile_name=''





foreach($line in Get-Content .\a.txt) {
    if($line -match '^end$'){
        $job_counter++;
    }
}

echo "File has $job_counter jobs"

$job_counter=0;

foreach($line in Get-Content .\a.txt) {
    if($line -NotMatch  '^end$')
    {
      $line_header=( $line.split(":")[0])
      $line_value=( $line.split(":")[1])
        switch ($line_header)
           {
            insert_job {$insert_job=$line_value.trim();break}
            job_type {$job_type=$line_value.trim();break}
            command {$command=$line_value.trim();break}
            machine {$machine=$line_value.trim();break}
            owner {$owner=$line_value.trim();break}
            permission {$permission=$line_value.trim();break}
            date_conditions {$date_conditions=$line_value.trim();break}
            days_of_week {$days_of_week=$line_value.trim();break}
            start_times {$start_times=$line_value.trim();break}
            description {$description=$line_value.trim();break}
            std_out_file {$std_out_file=$line_value.trim();break}
            std_err_file {$std_err_file=$line_value.trim();break}
            alarm_if_fail {$alarm_if_fail=$line_value.trim();break}
            end {$end=$line_value.trim();break}
            box_name {$box_name=$line_value.trim();break}
            condition {$condition=$line_value.trim();break}
            run_window {$run_window=$line_value.trim();break}
            n_retrys {$n_retrys=$line_value.trim();break}
            term_run_time {$term_run_time=$line_value.trim();break}
            box_terminator {$box_terminator=$line_value.trim();break}
            job_terminator {$job_terminator=$line_value.trim();break}
            min_run_alarm {$min_run_alarm=$line_value.trim();break}
            max_run_alarm {$max_run_alarm=$line_value.trim();break}
            profile {$profile_name=$line_value.trim();break} 
            
            }
        
        
        
        $att_counter++;
    }
    
    else {
    $job_counter++
    echo "encountered job number $job_counter, it has $att_counter attributes"
    echo "'$insert_job','$job_type','$command','$machine','$owner','$permission','$date_conditions','$days_of_week','$start_times','$description','$std_out_file','$std_err_file','$alarm_if_fail','$end','$box_name','$condition','$run_window','$n_retrys','$term_run_time','$box_terminator','$job_terminator','$min_run_alarm','$max_run_alarm','$profile_name'" >>storage.txt
    
    Clear-variable -Name "insert_job";Clear-variable -Name "job_type";Clear-variable -Name "command";Clear-variable -Name "machine";Clear-variable -Name "owner";Clear-variable -Name "permission";Clear-variable -Name "date_conditions";Clear-variable -Name "days_of_week";Clear-variable -Name "start_times";Clear-variable -Name "description";Clear-variable -Name "std_out_file";Clear-variable -Name "std_err_file";Clear-variable -Name "alarm_if_fail";Clear-variable -Name "end";Clear-variable -Name "box_name";Clear-variable -Name "condition";Clear-variable -Name "run_window";Clear-variable -Name "n_retrys";Clear-variable -Name "term_run_time";Clear-variable -Name "box_terminator";Clear-variable -Name "job_terminator";Clear-variable -Name "min_run_alarm";Clear-variable -Name "max_run_alarm";Clear-variable -Name "profile_name";
       
    
    $att_counter=0;
    }
}

