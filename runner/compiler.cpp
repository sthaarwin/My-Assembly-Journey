#include <iostream>
#include <fstream>
#include <cstdlib>
#include <string>

void executeCommand(const std::string& command) {
    int ret = std::system(command.c_str());
    if (ret != 0) {
        std::cerr << "Command failed: " << command << std::endl;
        std::exit(EXIT_FAILURE);
    }
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        std::cerr << "Usage: " << argv[0] << " <assembly_file_without_extension>" << std::endl;
        return EXIT_FAILURE;
    }

    std::string asmFile = argv[1] + std::string(".asm");
    std::string objFile = argv[1] + std::string(".o");
    std::string executable = argv[1];

    // Assemble the assembly code
    std::string assembleCommand = "nasm -f elf64 " + asmFile + " -o " + objFile;
    executeCommand(assembleCommand);

    // Link the object file into an executable
    std::string linkCommand = "ld " + objFile + " -o " + executable;
    executeCommand(linkCommand);

    // Run the executable
    std::string runCommand = "./" + executable;
    executeCommand(runCommand);

    return 0;
}

