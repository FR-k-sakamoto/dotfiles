#!/usr/bin/env bash
# Claude Code statusline
# Line 1: model | directory | git branch + status
# Line 2: 5h rate limit bar (+ reset) | weekly rate limit bar (+ reset)

set -u
input=$(cat)

MODEL=$(printf '%s' "$input" | jq -r '.model.display_name // "Claude"')
DIR=$(printf '%s' "$input" | jq -r '.workspace.current_dir // "."')
DIR_NAME=$(basename "$DIR")

CTX_PCT=$(printf '%s' "$input" | jq -r '.context_window.used_percentage // empty')
CTX_SIZE=$(printf '%s' "$input" | jq -r '.context_window.context_window_size // empty')
FIVE_H_PCT=$(printf '%s' "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
FIVE_H_RESET=$(printf '%s' "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
WEEK_PCT=$(printf '%s' "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
WEEK_RESET=$(printf '%s' "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

RESET=$'\033[0m'
BOLD=$'\033[1m'
DIM=$'\033[2m'
CYAN=$'\033[38;5;81m'
YELLOW=$'\033[38;5;220m'
GREEN=$'\033[38;5;114m'
RED=$'\033[38;5;203m'
ORANGE=$'\033[38;5;215m'
MAGENTA=$'\033[38;5;176m'
BLUE=$'\033[38;5;111m'
GREY=$'\033[38;5;245m'

BRANCH=""
GIT_STATUS=""
if git -C "$DIR" rev-parse --git-dir >/dev/null 2>&1; then
    BRANCH=$(git -C "$DIR" branch --show-current 2>/dev/null)
    STAGED=$(git -C "$DIR" diff --cached --numstat 2>/dev/null | wc -l | tr -d ' ')
    MODIFIED=$(git -C "$DIR" diff --numstat 2>/dev/null | wc -l | tr -d ' ')
    UNTRACKED=$(git -C "$DIR" ls-files --others --exclude-standard 2>/dev/null | wc -l | tr -d ' ')
    [ "$STAGED" -gt 0 ]    && GIT_STATUS+="${GREEN}+${STAGED}${RESET} "
    [ "$MODIFIED" -gt 0 ]  && GIT_STATUS+="${YELLOW}~${MODIFIED}${RESET} "
    [ "$UNTRACKED" -gt 0 ] && GIT_STATUS+="${RED}?${UNTRACKED}${RESET} "
fi

# $1 = integer 0..100  -> echoes colored bar (12 chars wide)
make_bar() {
    local pct=$1 width=12
    local filled=$(( pct * width / 100 ))
    [ "$filled" -gt "$width" ] && filled=$width
    local empty=$(( width - filled ))
    local color
    if   [ "$pct" -ge 90 ]; then color="$RED"
    elif [ "$pct" -ge 70 ]; then color="$ORANGE"
    elif [ "$pct" -ge 50 ]; then color="$YELLOW"
    else                         color="$GREEN"
    fi
    local fill_str="" empty_str="" pad
    if [ "$filled" -gt 0 ]; then printf -v pad "%${filled}s" ""; fill_str="${pad// /█}"; fi
    if [ "$empty"  -gt 0 ]; then printf -v pad "%${empty}s"  ""; empty_str="${pad// /░}"; fi
    printf '%s%s%s%s%s' "$color" "$fill_str" "${GREY}" "$empty_str" "$RESET"
}

# $1 = epoch seconds; "" if missing -> "MM/DD HH:MM"
format_reset() {
    local epoch=$1
    [ -z "$epoch" ] && return
    date -r "$epoch" "+%m/%d %H:%M" 2>/dev/null
}

# Line 1
LINE1="${CYAN}󰚩 ${BOLD}${MODEL}${RESET}  ${GREY}│${RESET}  ${YELLOW} ${DIR_NAME}${RESET}"
if [ -n "$BRANCH" ]; then
    LINE1+="  ${GREY}│${RESET}  ${MAGENTA} ${BRANCH}${RESET}"
    [ -n "$GIT_STATUS" ] && LINE1+="  ${GIT_STATUS%% }"
fi
printf '%b\n' "$LINE1"

# Line 2 — context window usage and/or rate limits
if [ -n "$CTX_PCT" ] || [ -n "$FIVE_H_PCT" ] || [ -n "$WEEK_PCT" ]; then
    LINE2=""
    if [ -n "$CTX_PCT" ]; then
        C_INT=$(printf '%.0f' "$CTX_PCT")
        C_BAR=$(make_bar "$C_INT")
        # Show "/1M" or "/200K" suffix so 1M-context sessions are obvious
        CTX_LABEL="ctx"
        if [ -n "$CTX_SIZE" ]; then
            if   [ "$CTX_SIZE" -ge 1000000 ]; then CTX_LABEL="ctx/1M"
            elif [ "$CTX_SIZE" -ge 200000 ];  then CTX_LABEL="ctx/200K"
            fi
        fi
        LINE2+="${CYAN}${CTX_LABEL}${RESET} ${C_BAR} ${BOLD}$(printf '%3d' "$C_INT")%${RESET}"
    fi
    if [ -n "$FIVE_H_PCT" ]; then
        [ -n "$LINE2" ] && LINE2+="  ${GREY}│${RESET}  "
        F_INT=$(printf '%.0f' "$FIVE_H_PCT")
        F_BAR=$(make_bar "$F_INT")
        LINE2+="${BLUE}5h${RESET} ${F_BAR} ${BOLD}$(printf '%3d' "$F_INT")%${RESET}"
        F_RESET_FMT=$(format_reset "$FIVE_H_RESET")
        [ -n "$F_RESET_FMT" ] && LINE2+=" ${DIM}↻ ${F_RESET_FMT}${RESET}"
    fi
    if [ -n "$WEEK_PCT" ]; then
        W_INT=$(printf '%.0f' "$WEEK_PCT")
        W_BAR=$(make_bar "$W_INT")
        [ -n "$LINE2" ] && LINE2+="  ${GREY}│${RESET}  "
        LINE2+="${MAGENTA}7d${RESET} ${W_BAR} ${BOLD}$(printf '%3d' "$W_INT")%${RESET}"
        W_RESET_FMT=$(format_reset "$WEEK_RESET")
        [ -n "$W_RESET_FMT" ] && LINE2+=" ${DIM}↻ ${W_RESET_FMT}${RESET}"
    fi
    printf '%b\n' "$LINE2"
fi
