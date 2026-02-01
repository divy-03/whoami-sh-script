#!/bin/bash

# --------- CONFIG ---------
NAME="Divy Pathak"
ROLE="Full Stack Developer | Backend-leaning"
EMAIL="pathakdivy03@gmail.com"
GITHUB="https://github.com/divy-03"
LINKEDIN="https://linkedin.com/in/pathakdivy03"
PORTFOLIO="https://your-portfolio-link"

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
divider

echo -e "${GREEN}${BOLD}🎓 Education${RESET}"
typewriter "B.Tech in Computer Science & Engineering"
typewriter "VIT Bhopal | CGPA: 7.77"
echo
divider

echo -e "${MAGENTA}${BOLD}🚀 Projects${RESET}"

typewriter "• DocAI — Intelligent Document Automation Platform"
echo -e "${DIM}  FastAPI | React | PostgreSQL | Docker | Gemini API${RESET}"
echo

typewriter "• Carido — AI-Powered Car Marketplace"
echo -e "${DIM}  Next.js | TypeScript | Prisma | PostgreSQL | ImageKit${RESET}"
echo

typewriter "• JSON-RPC Load Balancer"
echo -e "${DIM}  Node.js | TypeScript | Distributed Systems${RESET}"
divider

echo -e "${BLUE}${BOLD}🛠 Technical Skills${RESET}"
typewriter "Frontend : Next.js, React, TypeScript, Tailwind, Zustand, GSAP"
typewriter "Backend  : Node.js, Express, FastAPI, Prisma"
typewriter "Databases: PostgreSQL, MongoDB, Redis"
typewriter "DevOps   : Docker, CI/CD, Linux, Nginx"
typewriter "Languages: C++, JavaScript, TypeScript, Python"
divider

echo -e "${YELLOW}${BOLD}🏆 Achievements${RESET}"
typewriter "Hacktoberfest Super Contributor 2025"
typewriter "IBM DevOps Fundamentals"
typewriter "JLPT N5 – Japanese Language Certification"
divider

echo -e "${CYAN}${BOLD}🔗 Links${RESET}"
echo -e "${WHITE}GitHub   : ${GREEN}$GITHUB${RESET}"
echo -e "${WHITE}LinkedIn : ${GREEN}$LINKEDIN${RESET}"
echo -e "${WHITE}Email    : ${GREEN}$EMAIL${RESET}"
echo -e "${WHITE}Portfolio: ${GREEN}$PORTFOLIO${RESET}"
divider

echo -e "${DIM}Thanks for stopping by. Built with ❤️ for the terminal.${RESET}"
echo
