
GitUpload()
{
  if git -C $(pwd) rev-parse ; then
    #each line below require error check
    echo "error check not implemented, weired output is expected. "

    if [ $# -ne 2 ]; then
      echo "Usage: GitUpload <filename> <comment-string>. "
    fi

    git add $1
    MSG=$(date +%Y:%m:%d:%H:%M:%S)+$T
    git commit -m $MSG
    git push $(git remote) $(git branch --show-current)

    echo "End."
  else
    echo "Not a git repository"
  fi
}

GitCreateRepo()
{
    echo "Coming soon"
}

#if [ $1 == 'u' ]; then
#  GitUpload $2 $3
#else
#  echo option not supported.
#fi
