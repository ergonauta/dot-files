# Custom Operations
```bash
# First remove *all* keybindings
# unbind-key -a
# Now reinsert all the regular tmux keys
bind ^X lock-server
bind ^C new-window -c "$HOME"
bind ^D detach
bind * list-clients

bind H previous-window
bind L next-window

bind r command-prompt "rename-window %%"
bind R source-file ~/.config/tmux/tmux.conf
bind ^A last-window
bind ^W list-windows
bind w list-windows
bind z resize-pane -Z
bind ^L refresh-client
bind l refresh-client
bind | split-window
bind s split-window -v -c "#{pane_current_path}"
bind v split-window -h -c "#{pane_current_path}"
bind '"' choose-window
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
bind -r -T prefix , resize-pane -L 20
bind -r -T prefix . resize-pane -R 20
bind -r -T prefix - resize-pane -D 7
bind -r -T prefix = resize-pane -U 7
bind : command-prompt
bind * setw synchronize-panes
bind P set pane-border-status
bind c kill-pane
bind x swap-pane -D
bind S choose-session
bind R source-file ~/.config/tmux/tmux.conf
bind K send-keys "clear"\; send-keys "Enter"
bind-key -T copy-mode-vi v send-keys -X begin-selection
```
# 🔧 Essential Tmux Operations

## 🪟 Session Management
- `tmux new -s <name>` — create new session  
- `tmux ls` — list sessions  
- `tmux attach -t <name>` — attach to session  
- `tmux kill-session -t <name>` — kill session  

## 📐 Pane Management
- `Ctrl-b %` — split **vertically**  
- `Ctrl-b "` — split **horizontally**  
- `Ctrl-b o` — switch to next pane  
- `Ctrl-b x` — close current pane  

## 🧭 Pane Navigation
- `Ctrl-b h/j/k/l` — move left/down/up/right  

## 🖼️ Window Management
- `Ctrl-b c` — create new window  
- `Ctrl-b n` / `p` — next / previous window  
- `Ctrl-b ,` — rename window  
- `Ctrl-b &` — close window  
- `Ctrl-b s` — list sessions

## 🔢 Jump Between Windows
- `Ctrl-b <num>` — jump to window number  

## 📋 Copy Mode (Scroll & Copy)
- `Ctrl-b [` — enter copy mode  
- Use arrow keys / `vi` keys to move  
- `Space` to start selection, `Enter` to copy  
- `Ctrl-b ]` — paste

## 🚀 Tips
- Prefix is `Ctrl-b` by default (can be remapped to `Ctrl-a` for efficiency)
- Use `tmux-resurrect` to save/restore sessions