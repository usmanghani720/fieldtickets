require 'test_helper'

class JobTest < ActiveSupport::TestCase
  def job
    @job ||= Job.new
  end
  
  # Job is not valid until billing is set.
  # Here, billing is set with .hourly!
  def test_must_input_billing
    refute job.valid?
    job.hourly!
    assert job.valid?
  end
end
