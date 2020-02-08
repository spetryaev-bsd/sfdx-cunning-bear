public class BusScheduleCache {
	private Cache.OrgPartition part;
    
    public BusScheduleCache(){
        this.part = new Cache.OrgPartition('local.BusSchedule');
    }
    
    public void putSchedule(String busLine, Time[] schedule){
        this.part.put(busLine, schedule);
    }
    
    public Time[] getSchedule(String busLine){
        Time[] schedule = (Time[]) this.part.get(busLine);
        if(schedule != null){
            return schedule;
        } else{
            //return default
            schedule = new Time[]{
                Time.newInstance(8, 0, 0, 0), 
                Time.newInstance(17, 0, 0, 0)
                    };
            return schedule;
        }
    }
}