module DirTools
    FILE_NAME = "/home/scott/.dirs.txt"
    def self.loadDefs()
        ret = {}
        begin
            IO.foreach(FILE_NAME) { |line|
                elems = line.split(/\t/)
                if (elems.length == 2)
                    ret[elems[0]] = elems[1]
                end
            }
            return ret
        rescue
            return {}
        end
    end

    def self.saveDefs(defs)
      File.open(FILE_NAME, File::CREAT | File::TRUNC|File::RDWR, 0644) { |f|
          defs.keys.each { |k|
              f.puts "#{k}\t#{defs[k]}"
          }
      }
    end
end
