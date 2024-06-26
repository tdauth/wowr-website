#include <iostream>
#include <fstream>
#include <sstream>

int main(int argc, char *argv[]) {
    if (argc < 3) {
        std::cerr << "Usage: " << argv[0] << " <HTML file> <Output file> | <formatted HTML>" << std::endl;
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

    // find the first start tag
    while (std::getline(in, line) && !skip)
    {
        sstream << line << "\n";

        std::size_t found = line.find(startTag);

        if (found != std::string::npos) {
            skip = true;

            std::cout << "Found " << startTag << " at line " << l << std::endl;
            //std::cout << "Inserting HTML: " << argv[1] << std::endl;
            int count = 0;

            std::string lineInput;

            while (std::getline(std::cin, lineInput)) {
                sstream << lineInput << '\n';
                ++count;
            }

            std::cout << "Added " << count << " lines to the file." << std::endl;
        }

        ++l;
    }

    // find the final end tag
    if (skip) {
        std::streampos endTagPos = in.tellg();
        std::streampos pos = in.tellg();
        int x = l;

        while (std::getline(in, line))
        {
            std::size_t found = line.find(endTag);

            if (found != std::string::npos) {
                endTagPos = pos;

                std::cout << "Found " << endTag << " at line " << x << std::endl;
            }

            ++x;
            pos = in.tellg();
        }

        in.clear();
        in.seekg(endTagPos);
        x = 0;

        while (std::getline(in, line))
        {
            sstream << line << "\n";

            ++l;
            ++x;
        }

        std::cout << "Added " << x << " remaining lines." << std::endl;
    }

    in.close();


    std::cout << "Writing output file " << argv[2] << std::endl;

    std::ofstream out(argv[2]);
    out << sstream.str();
    out.close();

    return 0;
}
