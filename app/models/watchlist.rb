class Watchlist
  attr_accessor :watchlist_jobs

  def initialize(watchlist_items)
    @watchlist_jobs = watchlist_jobs || Hash.new
  end

  def add_job(job_id)
    @watchlist_jobs[job_id] ||= 0
    @watchlist_jobs[job_id] += 1
  end

  def watchlist_jobs_and_quantity
    jobs = Hash.new
    watchlist_jobs.select { |job_id, quantity| jobs[Job.find(job_id)] = quantity }
    jobs
  end

  def delete_job(job_id)
    @watchlist_jobs.delete(job_id)
  end

  def increase_job_quantity(job_id)
    @watchlist_jobs[job_id] += 1
  end

  def decrease_job_quantity(job_id)
    if @watchlist_jobs[job_id] > 1
      @watchlist_jobs[job_id] -= 1
    else
      @watchlist_jobs.delete(job_id)
    end
  end
end
