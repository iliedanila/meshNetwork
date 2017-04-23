##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Release
ProjectName            :=nodeLib
ConfigurationName      :=Release
WorkspacePath          :=/home/ilie/workspace/nodes
ProjectPath            :=/home/ilie/workspace/nodes/nodeLib
IntermediateDirectory  :=./Release
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Ilie Danila
Date                   :=23/04/17
CodeLitePath           :=/home/ilie/.codelite
LinkerName             :=/usr/bin/g++
SharedObjectLinkerName :=/usr/bin/g++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/lib$(ProjectName).a
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="nodeLib.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)/usr/include 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /usr/bin/ar rcu
CXX      := /usr/bin/g++
CC       := /usr/bin/gcc
CXXFLAGS :=   $(Preprocessors)
CFLAGS   :=   $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=$(IntermediateDirectory)/nodeLib_connection.cpp$(ObjectSuffix) $(IntermediateDirectory)/nodeLib_node.cpp$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(IntermediateDirectory) $(OutputFile)

$(OutputFile): $(Objects)
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(AR) $(ArchiveOutputSwitch)$(OutputFile) @$(ObjectsFileList) $(ArLibs)
	@$(MakeDirCommand) "/home/ilie/workspace/nodes/.build-release"
	@echo rebuilt > "/home/ilie/workspace/nodes/.build-release/nodeLib"

MakeIntermediateDirs:
	@test -d ./Release || $(MakeDirCommand) ./Release


./Release:
	@test -d ./Release || $(MakeDirCommand) ./Release

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/nodeLib_connection.cpp$(ObjectSuffix): nodeLib/connection.cpp $(IntermediateDirectory)/nodeLib_connection.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ilie/workspace/nodes/nodeLib/nodeLib/connection.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/nodeLib_connection.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/nodeLib_connection.cpp$(DependSuffix): nodeLib/connection.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/nodeLib_connection.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/nodeLib_connection.cpp$(DependSuffix) -MM nodeLib/connection.cpp

$(IntermediateDirectory)/nodeLib_connection.cpp$(PreprocessSuffix): nodeLib/connection.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/nodeLib_connection.cpp$(PreprocessSuffix) nodeLib/connection.cpp

$(IntermediateDirectory)/nodeLib_node.cpp$(ObjectSuffix): nodeLib/node.cpp $(IntermediateDirectory)/nodeLib_node.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ilie/workspace/nodes/nodeLib/nodeLib/node.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/nodeLib_node.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/nodeLib_node.cpp$(DependSuffix): nodeLib/node.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/nodeLib_node.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/nodeLib_node.cpp$(DependSuffix) -MM nodeLib/node.cpp

$(IntermediateDirectory)/nodeLib_node.cpp$(PreprocessSuffix): nodeLib/node.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/nodeLib_node.cpp$(PreprocessSuffix) nodeLib/node.cpp


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Release/

