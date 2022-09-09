#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <cmath>
#include <map>


class Student {
  private:
    int group;
    bool isMember;
    std::string fullName;
    std::vector<int> rates;
  public:
    Student() {}
    Student(std::string newName, int newGroup, std::vector<int> newRates, bool newIsMember) {
      fullName = newName; group = newGroup; rates = newRates; isMember = newIsMember;
    }

    std::string getFullName() { return fullName; } //Getters
    bool getIsMember() { return isMember; }
    int getGroup() { return group; }

    bool badRates() { //Check for bad marks
      std::vector<int>::iterator it;
      it = rates.begin();
    	while (it != rates.end()) {
    		if(*it < 4) { return true; }
    		++it;
    	}
      return false;
    }

};


std::vector<std::string> split(const std::string &s, char delim) { //Split string vector with delim symbol
  std::vector<std::string> result;
  std::stringstream ss (s);
  std::string item;

  while (getline (ss, item, delim)) { result.push_back (item); }

  return result;
}


std::vector<int> splitInt(const std::string &s, char delim) {  //Split int vector with delim symbol
  std::vector<int> result;
  std::stringstream ss (s);
  std::string item;

  while (getline (ss, item, delim)) { result.push_back (std::stoi(item)); }

  return result;
}


int main() {

  Student tempStudent;
  int notMemberCounter = 0;
  std::map<std::string, Student> studentsMap;
  std::map<std::string, Student>::iterator it, oldIt;
  std::map<int, std::vector<std::string>> studentsByGroups;
  std::map<int, std::vector<std::string>>::iterator it_;

  std::ifstream inputFile("input");
  std::string line;

  std::getline(inputFile, line);
  int N = std::stoi(line);

  for (int i = 0; i < N; i++) {   //Loading studentsMap from file
    std::getline(inputFile, line);
    std::vector<std::string> student = split(line, '|');
    std::vector<int> studentRates = splitInt(student[2], ' ');
    Student tempStudent(student[0], std::stoi(student[1]), studentRates, student[3]=="1" ? true : false);
    studentsMap.insert(std::make_pair(tempStudent.getFullName(), tempStudent));
  }

  inputFile.close();

  std::cout << "All students: " << std::endl;  //Outputing studentsMap
  it = studentsMap.begin();
	while (it != studentsMap.end()) {
		std::cout << it->second.getFullName() << std::endl;
		++it;
	}
  std::cout << "-----" <<std::endl;
  
	it = studentsMap.begin(); //Erasing students with bad marks
	while (it != studentsMap.end()) {
    oldIt = it;
    ++it;
    if (oldIt->second.badRates()) studentsMap.erase(oldIt);
	}

  std::cout << "Students without bad marks: " << std::endl;  //Outputing studentsMap and finding notMemberCounter
  it = studentsMap.begin();
	while (it != studentsMap.end()) {
		std::cout << it->second.getFullName() << std::endl;
    if (!it->second.getIsMember()) notMemberCounter++;
		++it;
	}

  std::cout << "Count of students, who are not union members: " << notMemberCounter << std::endl;

  it = studentsMap.begin();
	while (it != studentsMap.end()) { //Sorting By Groups
    if (studentsByGroups.find(it->second.getGroup()) == studentsByGroups.end()) {
      std::vector<std::string> tempVector;
      tempVector.push_back(it->second.getFullName());
      studentsByGroups.insert(std::make_pair(it->second.getGroup(), tempVector));
      ++it;
      continue;
    }
    studentsByGroups[it->second.getGroup()].push_back(it->second.getFullName());
		++it;
	}

  std::cout << "-----" <<std::endl;
  it_ = studentsByGroups.begin();
  while (it_ != studentsByGroups.end()) { //Outputing by groups
    std::cout << "Students in group " << it_->first << ": " << std::endl;
    for (auto i : it_->second) { std::cout << i << std::endl; }
    std::cout << "-----" <<std::endl;
    ++it_;
  }

}
