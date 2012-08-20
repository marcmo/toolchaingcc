cxx_plugin do |cxx,bbs,log|

  require 'errorparser/gcc_compiler_error_parser'
  require 'errorparser/gcc_linker_error_parser'
  gccCompilerErrorParser = Cxxproject::GCCCompilerErrorParser.new

  toolchain "gcc",
    :COMPILER =>
      {
        :CPP =>
          {
            :COMMAND => "g++",
            :DEFINE_FLAG => "-D",
            :OBJECT_FILE_FLAG => "-o",
            :INCLUDE_PATH_FLAG => "-I",
            :COMPILE_FLAGS => "-c -Wall ",
            :DEP_FLAGS => "-MMD -MF ", # empty space at the end is important!
            :DEP_FLAGS_SPACE => true,
            :PREPRO_FLAGS => "-E -P",
            :ERROR_PARSER => gccCompilerErrorParser
          },
        :C =>
          {
            :BASED_ON => :CPP,
            :SOURCE_FILE_ENDINGS => [".c"],
            :COMMAND => "gcc"
          },
        :ASM =>
          {
            :BASED_ON => :C,
            :SOURCE_FILE_ENDINGS => [".asm", ".s", ".S"]
          }
      },
    :LINKER =>
      {
        :COMMAND => "g++",
        :SCRIPT => "-T",
        :USER_LIB_FLAG => "-l:",
        :EXE_FLAG => "-o",
        :LIB_FLAG => "-l",
        :LIB_PATH_FLAG => "-L",
        :ERROR_PARSER => Cxxproject::GCCLinkerErrorParser.new
      },
    :ARCHIVER =>
      {
        :COMMAND => "ar",
        :ARCHIVE_FLAGS => "rc",
        :ERROR_PARSER => gccCompilerErrorParser
      }

end
