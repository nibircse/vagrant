require_relative 'subutai_config'

# For managing VM disks
module SubutaiDisk
  DISK_NAME = "SubutaiDisk"
  DISK_FORMAT = "vdi"

  # Checks disk size for adding new VM disks
  def self.has_grow
    grow_by = SubutaiConfig.get_grow_by

    if grow_by.nil?
      [false, nil]
    elsif grow_by > 0
      [true, grow_by]
    else
      [false, nil]
    end
  end

  # Gives disk port
  def self.port
    port = SubutaiConfig.get(:_DISK_PORT)

    # Default port value is 1
    if port.nil?
      1
    else
      port.to_i + 1 # if
    end
  end

  def self.size(grow_by)
    grow_by.to_i * 1024 + 2 * 1024 # 2 gb for overhead, unit in megabytes
  end

  # Save disk size and port to generated.yml
  def self.save_conf(grow_by)
    SubutaiConfig.put(:_DISK_PORT, port, true)

    generated_disk = SubutaiConfig.get(:_SUBUTAI_DISK)
    if generated_disk.nil?
      SubutaiConfig.put(:_DISK_SIZE, grow_by, true) # we set all size of virtual disks to _SUBUTAI_DISK in unit gb
    else
      SubutaiConfig.put(:_DISK_SIZE, grow_by + generated_disk.to_i, true) # we set all size of virtual disks to _SUBUTAI_DISK in unit gb
    end
  end

  # Gives disk file name
  def self.file(grow_by)
    disk_port = port

    "./#{DISK_NAME}-#{disk_port.to_i}-#{grow_by}.#{DISK_FORMAT}"
  end
end