# Awk script for OpenFOAM log file extraction
BEGIN {
    Iteration=0
    resetCounters()
    CMDmkdir="mkdir -p logs"
    system(CMDmkdir)
}

# Reset counters used for variable postfix
function resetCounters() {
    CORCnt=0
    SeparatorCnt=0
    OriCnt=0
    # Reset counters for 'Solving for ...'
    for (varName in subIter)
    {
        subIter[varName]=0
    }
}

# Extract value after columnSel
function extract(inLine,columnSel,outVar,a,b)
{
    a=index(inLine, columnSel)
    b=length(columnSel)
    split(substr(inLine, a+b),outVar)
    gsub("[,:]","",outVar[1])
}

function extractVector(inLine,columnSel,outVar,a,b)
{
    a=index(inLine, columnSel)
    b=length(columnSel)
    split(substr(inLine, a+b),outVar)
    gsub("[\\(\\),:]","",outVar[1])
    gsub("[\\(\\),:]","",outVar[3])
    gsub(/\015/, "", outVar[3])
}

# Iteration separator (increments 'Iteration')
/^[ \t]*Time = / {
    Iteration++
    resetCounters()
}

# Time extraction (sets 'Time')
// {
    extract($0, "", val)
    Time=val[1]
}

# Skip whole line with singularity variable
/solution singularity/ {
    next;
}


# Extract: 'Separator'
/^[ \t]*Time = / {
    extract($0, "Time = ", val)
    #file="logs/Separator_" SeparatorCnt
    #print Time "\t" val[1] > file
    time=val[1]
    gsub(/\015/, "", time)
    #SeparatorCnt++
}

# Extract: 'COR'
/^[ \t]*Centre of rotation/ {
    extractVector($0, ":", val)
    file="logs/COR_" CORCnt
    if (Iteration==1)
        print "#Time\tx\ty\tz" > file
    print time "\t" val[1] "\t" val[2] "\t" val[3] > file
    CORCnt++
}

# Extract: 'COR'
/^[ \t]*Orientation/ {
    extractVector($0, ":", val)
    file="logs/Orientation_" OriCnt
    if (Iteration==1)
        print "#Time\tpsi" > file
    print time "\t" val[3] > file
    OriCnt++
}

# End
