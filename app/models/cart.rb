class Cart
  attr_accessor :cart_items

  def initialize(cart_items)
    @cart_items = cart_items || Hash.new
  end

  def add_job(job_id)
    @cart_items[job_id] ||= 0
    @cart_items[job_id] += 1
  end

  def cart_items_and_quantity
    jobs = Hash.new
    cart_items.select { |job_id, quantity| jobs[Job.find(job_id)] = quantity }
    jobs
  end

  def delete_job(job_id)
    @cart_items.delete(job_id)
  end

  def increase_job_quantity(job_id)
    @cart_items[job_id] += 1
  end

  def decrease_job_quantity(job_id)
    if @cart_items[job_id] > 1
      @cart_items[job_id] -= 1
    else
      @cart_items.delete(job_id)
    end
  end
end
