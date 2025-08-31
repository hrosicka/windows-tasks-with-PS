# Windows Tasks with PowerShell 🚀🖥️

![PowerShell](https://img.shields.io/badge/Language-PowerShell-blue?logo=powershell)
![Repo Size](https://img.shields.io/github/repo-size/hrosicka/windows-tasks-with-PS?style=flat-square)
![Last Commit](https://img.shields.io/github/last-commit/hrosicka/windows-tasks-with-PS?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-green)
![Issues](https://img.shields.io/github/issues/hrosicka/windows-tasks-with-PS?style=flat-square)

> **A collection of practical PowerShell scripts for automating and managing common Windows system tasks.**

---

## ✨ Features

- **List Installed Programs**  
  Quickly generates a list of all installed applications by querying key registry locations, exporting results to a CSV file for further analysis.

- **Find Largest Files**  
  Identifies the largest files within a chosen directory (and its subdirectories), useful for freeing up disk space. Fully customizable parameters let you set the search path and number of results.

- **Recycle Bin Manager**  
  Displays contents of the Windows Recycle Bin and optionally allows you to empty it, helping you keep your system clean.

- **Show Computer Boot Time and Uptime**  
  Displays when your PC last booted and calculates its current uptime, useful for diagnostics and monitoring.

---

## 📦 Scripts Overview

| Script                   | Purpose                                                         | How to Run                                           |
|--------------------------|-----------------------------------------------------------------|------------------------------------------------------|
| `ListInstalledPrograms.ps1` | Lists installed programs and exports to CSV                    | `powershell -File .\ListInstalledPrograms.ps1`       |
| `Find-LargestFiles.ps1`     | Finds the largest files in a directory                        | `powershell -File .\Find-LargestFiles.ps1 -Path "C:\YourPath" -TopN 20` |
| `recycleBinManager.ps1`     | Views and empties the Recycle Bin                             | `powershell -File .\recycleBinManager.ps1`           |
| `showComputerBootTime.ps1`  | Shows last boot time and system uptime                        | `powershell -File .\showComputerBootTime.ps1`        |

---

## 🛠️ Usage

1. **Clone the repository:**
   ```sh
   git clone https://github.com/hrosicka/windows-tasks-with-PS.git
   cd windows-tasks-with-PS
   ```

2. **Run the desired script:**
   - Make sure you have [PowerShell](https://docs.microsoft.com/en-us/powershell/) installed.
   - Open a terminal and execute the script as shown above.

> **Note:** Some scripts may require administrator privileges to access certain system information.

---

## 🙌 Author

Created by [hrosicka](https://github.com/hrosicka)

---

## 📄 License

This project is licensed under the [MIT License](./LICENSE).

---

Enjoy automating your Windows tasks! 🎉
