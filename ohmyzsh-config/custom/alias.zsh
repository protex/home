alias vim="nvim"
alias vi="nvim"
alias ls="ls -lAhHG"
alias resource="source ~/.zshrc"
alias mux="tmuxinator"
alias psgrep="ps aux | grep -v grep | grep"
alias enpass="enpass -vault=/Users/pmggio/Library/Containers/in.sinew.Enpass-Desktop/Data/Documents/Vaults/primary/ -sort"
function dadbod() {
  LIBMYSQL_ENABLE_CLEARTEXT_PLUGIN=1 nvim -u ~/.config/nvim/dadbod.lua +"DBUI"
}

function pdev() {
  if [[ $1 = "start" ]]; then
    aws --profile saml --region us-west-2 ec2 start-instances --instance-ids i-0341611f1c762b70c
  elif [[ $1 = "stop" ]]; then
    aws --profile saml --region us-west-2 ec2 stop-instances --instance-ids i-0341611f1c762b70c
  elif [[ $1 = "status" ]]; then
    aws --profile saml --region us-west-2 ec2 describe-instance-status --instance-ids i-0341611f1c762b70c
  elif [[ $1 = "ssh" ]]; then
    ssh -t pdev < /dev/tty
  elif [[ $1 = "pi-forward" ]]; then
    if [ ! -f $TMPDIR/pdev.pid ]; then
      ssh pdev.pi-forward &
      PID=$!
      echo $PID > ${TMPDIR}pdev.pid
    else
      echo "${TMPDIR}pdev.pid already exists, kill running process using pi-forward-kill or delete the temp file"
    fi
  elif [[ $1 = "pi-forward-kill" ]]; then
    kill -9 $(cat $TMPDIR/pdev.pid)
    rm ${TMPDIR}pdev.pid
  fi
}
