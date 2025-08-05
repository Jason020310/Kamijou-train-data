# 專題名稱: Trojan 程式碼注入與網表分析專案

## 專案目標
本專案旨在大量生成數據，包括乾淨設計和注入木馬的設計。這些數據將用於訓練機器學習模型，以達到自動偵測數位邏輯電路中潛在惡意行為的目的。

## 目錄結構
- `rtl/`：存放所有 Verilog 原始程式碼 (RTL)。
  - `candidate/`：**候選程式碼清單**。組員將從這裡挑選設計。
  - `clean/`：存放已分配編號的**乾淨** Verilog 設計。
  - `trojaned/`：存放已**注入木馬**的 Verilog 設計。
- `netlist/`：存放閘級網表 (gate-level netlist)。
  - `clean/`：存放乾淨設計產生的網表。
  - `trojan/`：存放注入木馬設計產生的網表。
- `official/`：存放官方提供的 30 個設計 (`design0.v` ~ `design29.v`)。
- `labels/`：存放所有設計的標籤資料，用於機器學習訓練。
- `before beta/`：存放專案初期生成的三碼設計與網表，組員無需理會此資料夾。
- `README.md`：專案文件與工作流程說明。

## 編號系統與組員分配
為避免檔案命名衝突並確保可追溯性，我們採用四位數編號系統，並為每位組員分配專屬的編號區間。

- **`0xxx`**：代表**官方**提供的乾淨設計。
- **`1xxx`**：代表由組員從候選清單中挑選的**乾淨**設計。
- **`2xxx`**：代表在 `1xxx` 基礎上**已注入木馬**的設計。

#### 編號區間分配
- **Jason (你)**：`1000` - `1100`
- **Jeb**：`1101` - `1200`
- **Conashin**：`1201` - `1300`
- **Aslan**：`1301` - `1400`

**命名範例**：
- **RTL 檔案 (放置於 `rtl/` 目錄)**：
  - 乾淨設計：`design1025_rtl.v`
  - 注入木馬設計：`design2025_<insertion_point>_rtl.v`
- **閘級網表檔案 (放置於 `netlist/` 目錄)**：
  - 乾淨設計網表：`design1025.v`
  - 注入木馬網表：`design2025_<insertion_point>.v`
- **標籤檔案 (放置於 `labels/` 目錄)**：
  - 乾淨設計標籤：`result1025.txt`
  - 注入木馬設計標籤：`result<insertion_point>.txt`

**多個木馬版本**：
- 由於一個乾淨設計可能在不同模組注入木馬，我們使用 `<insertion_point>` 來區分。例如，若 Jeb 在 `design1101_rtl.v` 的 `controller` 模組注入木馬，檔案命名為 `design2101_controller_rtl.v`。若他在 `ALU` 模組注入，則命名為 `design2101_ALU_rtl.v`。

**Top Module 命名規範**：
- 為了讓 Genus 腳本能夠正確辨識 Top Module，所有設計的 Top Module 名稱必須與其檔案名一致（不含後綴和副檔名）。
  - 例如，`design1101_rtl.v` 的 Top Module 名稱應為 `design1101`。
  - `design2101_controller_rtl.v` 的 Top Module 名稱應為 `design2101_controller`。
- 若設計包含多個 `.v` 檔案，請將它們放在一個與 Top Module 同名的資料夾中，例如 `design1101/`，並在其中包含所有相關檔案。

## 工作流程 

由於時間緊迫，我們將採用精簡的 Git 工作流程。

1.  **Clone 專案**：使用 `git clone` 將專案儲存庫下載到本地。
2.  **挑選設計**：組員瀏覽 `rtl/candidate/` 中的設計，選擇一個適合的。
3.  **開始工作**：
    * **複製檔案**：將選定的程式碼複製到 `rtl/clean/` 目錄，並根據你的編號區間，為其分配一個**乾淨**的 `1xxx` 編號。**請務必在檔名後加上 `_rtl.v` 後綴**。
    * **注入木馬**：在新的 `1xxx` 檔案基礎上，開始注入木馬。
4.  **命名與放置**：
    * 乾淨的 `.v` 檔案放置於 `rtl/clean/`。
    * 注入木馬後的 `.v` 檔案，依照命名規範 (`design2xxx_<insertion_point>_rtl.v`) 命名，並放入 `rtl/trojaned/` 目錄。
5.  **直接 Commit**：完成後，使用 `git add .` 和 `git commit -m "commit message"` 將你的工作推送到主分支。在 commit 訊息中，請簡要說明你的工作，例如「[Jeb] 注入木馬到 `design1101` 的 `ALU` 模組」。
6.  **管理員的後續處理 (Jason的責任)**：
    * 當有新的檔案被提交後，你需要負責將其轉換成網表。
    * **命名網表**：將產生的網表**不加 `_rtl` 後綴**，例如 `design1101.v` 和 `design2101_ALU.v`，並放入 `netlist/` 相應的目錄中。
    * **標籤化**：你需要為每個設計（包括乾淨和木馬版本）生成標籤，並放入 `labels/` 目錄，這是機器學習的關鍵步驟。
