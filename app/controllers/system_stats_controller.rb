class SystemStatsController < ApplicationController
    def index
      stats = system_stats
      render json: stats
    end
  
    private
  
    def system_stats
      vmstat_output = `vmstat`
      vmstat_lines = vmstat_output.split("\n")
      stats = vmstat_lines[2].split
  
      cpu_user = stats[12].to_f
      cpu_system = stats[13].to_f
      cpu_idle = stats[14].to_f
  
      memory_free = stats[3].to_i / 1024
      memory_used = stats[2].to_i / 1024
  
      {
        cpu_user: cpu_user,
        cpu_system: cpu_system,
        cpu_idle: cpu_idle,
        memory_free: memory_free,
        memory_used: memory_used
      }
    end
end
  