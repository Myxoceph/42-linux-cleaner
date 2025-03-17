# 🧹 Mclean - The Ultimate 42 Cleaner

**Mclean** is a powerful and efficient shell script that helps you reclaim disk space by cleaning cache files from various applications. It is specifically designed for Ecole 42 computers.

## ✨ Features
- 🚀 Cleans cache for:
  - **Google Chrome**
  - **Spotify**
  - **Visual Studio Code**
  - **Discord**
  - **Brave Browser**
  - **Firefox**
  - **NPM & Bun**
- 🏎️ Blazing fast execution
- 🔧 No dependencies required
- 🛡️ Safe and effective cleanup

## 📥 Installation
Run the following command in your terminal:
```sh
curl -fsSL https://raw.githubusercontent.com/Myxoceph/42-linux-cleaner/main/mclean.sh -o ~/mclean.sh && chmod +x ~/mclean.sh && echo 'alias mclean="$HOME/mclean.sh"' | tee -a ~/.bashrc ~/.zshrc && source ~/.bashrc || source ~/.zshrc
```

Now you can use `mclean` from anywhere! 🎉

## 🚀 Usage
To clean caches instantly, run:
```sh
mclean
```

## 🔍 What Does It Clean?
| Application         | Cache Paths                                      |
|--------------------|-------------------------------------------------|
| **Google Chrome**  | Various cache locations in `~/.var/app/com.google.Chrome/` |
| **Spotify**        | `~/.var/app/com.spotify.Client/cache/`          |
| **VS Code**        | Multiple cache directories in `~/.var/app/com.visualstudio.code/` |
| **Discord**        | `~/.var/app/com.discordapp.Discord/cache/`      |
| **Brave Browser**  | Various cache locations in `~/.var/app/com.brave.Browser/` |
| **Firefox**        | `~/.var/app/org.mozilla.firefox/cache/`         |
| **NPM & Bun**      | `~/.npm/_cacache/`, `~/.bun/install/cache/`     |
| **Trash & System** | `~/.local/share/Trash/`, `~/.cache/`            |

## 🛠️ Customization
Feel free to edit `mclean.sh` to add/remove cache locations according to your needs!

## 📜 License
This project is licensed under the MIT License. Modify and share freely!

## 💡 Contributing
Suggestions or improvements? Open an issue or submit a pull request! 🙌


