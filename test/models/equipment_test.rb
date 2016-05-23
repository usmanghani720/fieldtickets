require 'test_helper'

class EquipmentTest < ActiveSupport::TestCase
  def equipment
    @equipment ||= Equipment.new
  end
  
  def test_blank_name
    assert equipment.to_s == 'Unnumbered Vehicle'
  end
  
  def test_internal_number
    equipment.internal_number = '42'
    assert equipment.to_s == '42'
  end
  
  def test_name_and_number
    equipment.description = 'F-150'
    equipment.internal_number = '42'
    assert equipment.to_s == '42 — F-150'
  end
  
  def test_name
    equipment.description = 'F-150'
    assert equipment.to_s == 'Unnumbered Vehicle — F-150'
  end
end
