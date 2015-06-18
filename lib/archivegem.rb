require "archivegem/version"

class Archive < Struct.new(:input_directory, :output_file, :skip)
    def zip
        entries = Dir.entries(input_directory)
        entries.delete('.')
        entries.delete('..')

        File.delete(output_file) if File.exist?(output_file)

        io = Zip::File.open(output_file, Zip::File::CREATE)

        write_zip_entries(entries, '', io)
        io.close()
    end

    private

    def write_zip_entries(entries, path, io)
        entries.each do |entry|
            next if skip.include? entry

            zip_file_path  = path == "" ? entry : File.join(path, entry)
            disk_file_path = File.join(input_directory, zip_file_path)

            if File.directory?(disk_file_path)
                io.mkdir(zip_file_path)
                subdir = Dir.entries(disk_file_path); subdir.delete("."); subdir.delete("..")
                write_zip_entries(subdir, zip_file_path, io)
            else
                io.get_output_stream(zip_file_path) { |f| f.print(File.open(disk_file_path, "rb").read())}
            end
        end
    end
end
