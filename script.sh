#!/bin/bash

# --------- CONFIG ---------
NAME="Divy Pathak"
ROLE="Full Stack Developer | Linux Enthusiast | Njr ⚽❤️"
EMAIL="pathakdivy03@gmail.com"
GITHUB="https://github.com/divy-03"
LINKEDIN="https://linkedin.com/in/pathakdivy03"
PORTFOLIO="https://termfolio-three.vercel.app"

# --------- COLORS ---------
RESET="\033[0m"
BOLD="\033[1m"
DIM="\033[2m"

CYAN="\033[36m"
GREEN="\033[32m"
YELLOW="\033[33m"
MAGENTA="\033[35m"
BLUE="\033[34m"
WHITE="\033[97m"

# --------- FUNCTIONS ---------
typewriter() {
  text="$1"
  delay="${2:-0.02}"
  for ((i = 0; i < ${#text}; i++)); do
    printf "%s" "${text:$i:1}"
    sleep "$delay"
  done
  echo
}

divider() {
  echo -e "${DIM}────────────────────────────────────────────${RESET}"
}

spinner() {
  chars="/-\|"
  for i in {1..20}; do
    printf "\r${DIM}Loading %s${RESET}" "${chars:i%4:1}"
    sleep 0.05
  done
  printf "\r"
}

# --------- START ---------
clear
spinner
echo

echo -e "${CYAN}${BOLD}"
typewriter "👋 Hi, I'm $NAME"
echo -e "${RESET}${WHITE}${ROLE}${RESET}"
echo -e "I build backends that defend like a solid back four and frontends that score in style."
divider

echo -e "${GREEN}${BOLD}🎓 Education${RESET}"
typewriter "B.Tech in Computer Science & Engineering"
echo
divider

echo -e "${MAGENTA}${BOLD}� Who is Divy?${RESET}"

echo -e "${MAGENTA}${BOLD}"
cat <<'ASCII'
________  .__               __________         __  .__            __    
\______ \ |__|__  _____.__. \______   \_____ _/  |_|  |__ _____  |  | __
 |    |  \|  \  \/ <   |  |  |     ___/\__  \\   __\  |  \\__  \ |  |/ /
 |    `   \  |\   / \___  |  |    |     / __ \|  | |   Y  \/ __ \|    < 
/_______  /__| \_/  / ____|  |____|    (____  /__| |___|  (____  /__|_ \
        \/          \/                      \/          \/     \/     \/
ASCII
echo -e "${RESET}"
typewriter "A terminal-first human: I live in TTYs, tweak dotfiles and sip coffee."
echo -e "${DIM}Linux tinkering, learning something new and chasing perfect music.${RESET}"
echo
typewriter "Interests: ⚽ Football watcher | 🎧 Audiophile | 🐧 Linux tinkerer | 🖥️ Terminal nerd"
divider

echo -e "${BLUE}${BOLD}🛠 Tech & Toys${RESET}"
typewriter "Frontend : Next.js, React, TypeScript, Tailwind, Zustand, GSAP"
typewriter "Backend  : Node.js, Express, FastAPI, Prisma, Bun, Elysia"
typewriter "Databases: PostgreSQL, MongoDB, Redis"
typewriter "DevOps   : Docker, CI/CD, Linux, Nginx"
typewriter "Languages: C++, JavaScript, TypeScript, Rust, Python, Bash"
typewriter "Tools    : NeoVim, Git, Postman, n8n, AWS"
divider

echo -e "${CYAN}${BOLD}🔗 Links${RESET}"
echo -e "${WHITE}GitHub   : ${GREEN}$GITHUB${RESET}"
echo -e "${WHITE}LinkedIn : ${GREEN}$LINKEDIN${RESET}"
echo -e "${WHITE}Email    : ${GREEN}$EMAIL${RESET}"
echo -e "${WHITE}Portfolio: ${GREEN}$PORTFOLIO${RESET}"
divider

echo -e "${DIM}Thanks for stopping by. Built with ❤️ and updated at $(date) .${RESET}"

echo
