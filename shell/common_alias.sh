___count_number_of_files_recursively()
{
  find $1 -type f | wc -l
}

___count_number_of_files()
{
  ls -l | wc -l
}

___output_to_stderr_and_file()
{
  # $1 = filename
  declare -r FILENAME=$1
  shift
  $@ 2>&1 | tee  ${FILENAME}
}

___delete_newline()
{
  tr -s '\n' ' '
}

################################################################################
# Description
# Arguments:
#   
# Returns:
#   
################################################################################
___replace_recursively()
{
  readonly PATH_TO_DIR=$1
  readonly REPLACEE=$2
  readonly REPLACER=$3
  find ${PATH_TO_DIR} -type f | xargs sed -i.bak "s/${REPLACEE}/${REPLACER}/g"
}
