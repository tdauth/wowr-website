#include <iostream>
#include <fstream>
#include <sstream>

int main(int argc, char *argv[]) {
    if (argc < 2) {
        std::cerr << "Usage: " << argv[0] << " <HTML file> | <formatted HTML>" << std::endl;
        std::cerr << "Replaces all the content between the <tbody>...</tbody> tags in the given HTML file with the given formatted HTML." << std::endl;
        
        return 1;
    }
    
    std::string fileName = argv[1];
    std::string tag = "tbody";
    std::string startTag = "<" + tag + ">";
    std::string endTag = "</" + tag + ">";
    
    std::cout << "Adding formatted HTML to file " << fileName << " at tag " << tag << std::endl;
    
    std::ifstream in(fileName);
    std::stringstream sstream;
    
    int l = 1;
    bool skip = false;
    std::string line;
    
    while (std::getline(in, line))
    {
        if (!skip) {
            sstream << line << "\n";
            
            std::size_t found = line.find(startTag);
            if (found!=std::string::npos) {
                    skip = true;
                    
                    std::cout << "Found " << startTag << " at line " << l << std::endl;
                    //std::cout << "Inserting HTML: " << argv[1] << std::endl;
                    
                    std::string lineInput;

                    while (std::getline(std::cin, lineInput)) {
                        sstream << lineInput << '\n';
                    }
            }
        }
        
        if (skip) {
            std::size_t found = line.find(endTag);
            if (found!=std::string::npos) {
                    skip = false;
                    
                    std::cout << "Found " << endTag << " at line " << l << std::endl;
                    
                    
                    sstream  << line << "\n";
            }
        }
        
        ++l;
    }
    
    in.close();
    
    
    std::ofstream out(argv[2]);
    out << sstream.str();
    out.close();
    
    return 0;
}
