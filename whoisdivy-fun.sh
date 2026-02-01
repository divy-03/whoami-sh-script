#!/usr/bin/env bash

# whoisdivy-fun.sh — A tiny, playful interactive intro for Divy
# Short, simple, and terminal-friendly

NAME="Divy Pathak"
ROLE="Full Stack Dev & Football Fanatic"
TWITCH="Not streaming — yet 🚀"
GITHUB="https://github.com/divy-03"
LINKEDIN="https://linkedin.com/in/pathakdivy03"
EMAIL="pathakdivy03@gmail.com"

# Colors
RESET=$'\033[0m'
BOLD=$'\033[1m'
CYAN=$'\033[36m'
GREEN=$'\033[32m'
YELLOW=$'\033[33m'
MAGENTA=$'\033[35m'
WHITE=$'\033[97m'

typewriter() {
  text="$1"
  delay="${2:-0.01}"
  i=0
  len=${#text}
  while [ $i -lt $len ]; do
    ch="${text:$i:1}"
    # Handle real ESC sequences (actual escape byte)
    if [ "$ch" = $'\033' ]; then
      seq="$ch"
      j=$((i+1))
      while [ $j -lt $len ]; do
        c="${text:$j:1}"
        seq="${seq}$c"
        if [ "$c" = "m" ]; then
          break
        fi
        j=$((j+1))
      done
      printf "%s" "$seq"
      i=$((j+1))
      continue
    fi
    # Handle literal backslash-escaped sequences like \033[1m
    if [ "$ch" = '\\' ]; then
      rem="${text:$i}"
      if [[ "$rem" == \\033\[* ]]; then
        seq=""
        j=0
        len_rem=${#rem}
        while [ $j -lt $len_rem ]; do
          c="${rem:$j:1}"
          seq="${seq}$c"
          if [ "$c" = "m" ]; then
            break
          fi
          j=$((j+1))
        done
        printf "%b" "$seq"
        i=$((i+${#seq}))
        continue
      fi
    fi
    printf "%s" "$ch"
    i=$((i+1))
    sleep "$delay"
  done
  echo
}

clear_screen() { clear || printf "\n%.0s" {1..3}; }

header() {
  echo -e "${CYAN}${BOLD}⎯⎯⎯⎯ Who is Divy? ⎯⎯⎯⎯${RESET}\n"
}

pause() {
  echo
  read -n1 -s -r -p "Press any key to return to the menu..."
  echo
}

about() {
  typewriter "Hey! I'm ${BOLD}${NAME}${RESET} — ${ROLE}."
  typewriter "I build backends that defend like a solid back four and frontends that score in style."
  typewriter "I love databases, distributed systems, and mapping playbooks for code and football tactics alike."
}

projects() {
  typewriter "Some toys and tools: MatchStat (real-time match stats), DocAI, Carido, a JSON-RPC load balancer."
  echo -e "${MAGENTA}Tech:${RESET} Node.js, TypeScript, FastAPI, PostgreSQL, Docker, Next.js"
}

fun_fact() {
  facts=(
    "I once solved a bug during halftime at a match."
    "I celebrate green builds with a little goal dance. 🕺"
    "I track match stats like I track metrics — obsessively."
    "My terminal has a 'matchday' theme for important deploys. ⚽️"
  )
  idx=$((RANDOM % ${#facts[@]}))
  typewriter "Fun fact: ${facts[$idx]}"
}

contact() {
  echo -e "${GREEN}GitHub:${RESET} ${WHITE}$GITHUB${RESET}"
  echo -e "${GREEN}LinkedIn:${RESET} ${WHITE}$LINKEDIN${RESET}"
  echo -e "${GREEN}Email:${RESET} ${WHITE}$EMAIL${RESET}"
}

fav_team() {
  echo -e "${YELLOW}${BOLD}Favorite team:${RESET} The FC Codebreakers ⚽️"
  typewriter "Chant: 'One code, one goal!' — sometimes the best strategy."
  typewriter "Stadium prediction: 3-1 for the codebase."
}

# Simple ASCII pitch drawer
draw_pitch() {
  echo -e "\n${GREEN}   ╔════════════════════════════════╗${RESET}"
  echo -e "${GREEN}   ║  .─────────────.    .────────. ║${RESET}"
  echo -e "${GREEN}   ║  |             |    |        | ║${RESET}"
  echo -e "${GREEN}   ║  |   ⚽️ Pitch   |    |  ☕️   | ║${RESET}"
  echo -e "${GREEN}   ║  '─────────────'    '────────' ║${RESET}"
  echo -e "${GREEN}   ╚════════════════════════════════╝${RESET}\n"
}

goal_animation() {
  echo
  echo -e "${BOLD}${YELLOW}GOAL!!!${RESET}"
  for i in 1 2 3; do
    printf "${MAGENTA}*** %s ***\n${RESET}" "Goal!"
    sleep 0.15
  done
  echo
}

play_match() {
  team="FC Codebreakers"
  opponent="The Bug Bashers"
  score_ours=0
  score_theirs=0
  minute=0
  typewriter "Kick-off: ${team} vs ${opponent}!" 0.01
  draw_pitch
  while [ $minute -lt 90 ]; do
    # Increment minute by a small random amount
    minute=$((minute + (RANDOM % 12) + 1))
    sleep 0.35
    event=$((RANDOM % 100))
    if [ $event -lt 18 ]; then
      # goal
      who=$((RANDOM % 2))
      if [ $who -eq 0 ]; then
        score_ours=$((score_ours+1))
        typewriter "Minute $minute: GOAL for ${team}! Divy threads a perfect pass and strikes! ⚽️" 0.01
        goal_animation
        # tie a bio line into the commentary
        typewriter "Divy (${ROLE}): 'Code, coffee, and clever passes.'" 0.01
      else
        score_theirs=$((score_theirs+1))
        typewriter "Minute $minute: GOAL for ${opponent}! They found a gap in the defense." 0.01
      fi
    elif [ $event -lt 40 ]; then
      typewriter "Minute $minute: Close chance — the crowd goes quiet..." 0.01
    else
      typewriter "Minute $minute: Midfield tussle; tactics over flair." 0.01
    fi
    typewriter "Score: ${team} ${score_ours} — ${score_theirs} ${opponent}" 0.01
    # Let player press a key to speed up or just continue
    read -n1 -t 0.6 -s key
  done
  typewriter "Full time! Final score: ${team} ${score_ours} — ${score_theirs} ${opponent}" 0.01
  if [ $score_ours -gt $score_theirs ]; then
    typewriter "Result: ${team} win! Celebration in the repo. 🎉" 0.01
  elif [ $score_ours -lt $score_theirs ]; then
    typewriter "Result: ${opponent} win. Time for more training and tests." 0.01
  else
    typewriter "Result: Draw. Both teams call for a rematch." 0.01
  fi
  pause
}

surprise() {
  echo -n "${YELLOW}Booting surprise module "
  for i in {1..6}; do echo -n "."; sleep 0.12; done
  echo -e " ${RESET}\n"
  echo -e "${BOLD}Secret:${RESET} Divy codes best with a playlist and a mildly alarming snack. 🍪"
  echo -e "${MAGENTA}Random tip:${RESET} Teach the computer, then teach your future self."
}

menu() {
  clear_screen
  header
  echo -e "${WHITE}${BOLD}1) About${RESET}        2) What I build"
  echo -e "${WHITE}${BOLD}3) Fun fact${RESET}     4) Contact"
  echo -e "${WHITE}${BOLD}5) Play Match${RESET}    6) Favorite team"
  echo -e "${WHITE}${BOLD}7) Surprise${RESET}     q) Quit"
  echo
  read -n1 -s -r -p "Pick an option: " opt
  echo
  case "$opt" in
    1) clear_screen; header; about; pause;;
    2) clear_screen; header; projects; pause;;
    3) clear_screen; header; fun_fact; pause;;
    4) clear_screen; header; contact; pause;;
    5) clear_screen; header; play_match; pause;;
    6) clear_screen; header; fav_team; pause;;
    7) clear_screen; header; surprise; pause;;
    q|Q) echo -e "\n${CYAN}Bye — go build something cool. 🚀${RESET}"; exit 0;;
    *) echo "Hmm, that's not on the menu."; sleep 0.6;;
  esac
}

# Run
trap "echo -e \"${RESET}\"; exit" INT TERM EXIT

clear_screen
# quick intro
echo
echo -e "${BOLD}${CYAN}Hi! I'm ${NAME}.${RESET} (type to meet me)\n"
for i in {3..1}; do
  echo -n "."; sleep 0.25
done

typewriter "Welcome to the tiny interactive 'whois' for Divy. Choose away!" 0.02

while true; do
  menu
done
