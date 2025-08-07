# 專題名稱: Trojan 程式碼注入與網表分析專案

## 專案目標
本專案旨在大量生成數據，包括乾淨設計和注入木馬的設計。這些數據將用於訓練機器學習模型，以達到自動偵測數位邏輯電路中潛在惡意行為的目的。

## 目錄結構
- `rtl/`：存放所有 Verilog 原始程式碼 (RTL)。
  - `candidate/`：**候選程式碼清單**。組員將從這裡挑選設計。
  - `designs/`：存放所有已編號的 RTL 設計（包括乾淨與木馬）。
- `netlist/`：存放閘級網表 (gate-level netlist)。
  - `designs/`：存放所有已編號的網表（包括乾淨與木馬）。
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

**命名規範**：
- 為了讓 Genus 腳本能夠正確辨識 Top Module，所有設計都必須以一個與其編號同名的資料夾來組織。
- **資料夾命名**：
  - `rtl/designs/design1101/`：存放乾淨設計的所有 `.v` 檔案。
  - `rtl/designs/design2101/`：存放木馬設計的所有 `.v` 檔案。
- **Top Module 檔案與 Top Module 名稱**：
  - 在每個 `designxxxx/` 資料夾內，都必須有一個 Top Module 檔案名為 `designxxxx.v`。
  - 且其內部 Top Module 名稱也必須為 `designxxxx`。
- **範例**：
  - `rtl/designs/design1101/` 目錄下的 Top Module 檔案為 `design1101.v`，其內部 Top Module 名稱為 `design1101`。
  - `rtl/designs/design2101/` 目錄下的 Top Module 檔案為 `design2101.v`，其內部 Top Module 名稱為 `design2101`。

## 工作流程 

由於時間緊迫，我們將採用精簡的 Git 工作流程。

1.  **Clone 專案**：使用 `git clone` 將專案儲存庫下載到本地。
2.  **挑選設計**：組員瀏覽 `rtl/candidate/` 中的設計，並在 `rtl/candidate/README.md` 中註記為已分配。
3.  **開始工作**：
    * **建立資料夾**：根據你分配到的編號，在 `rtl/designs/` 中建立一個乾淨設計的資料夾，例如 `design1101/`。
    * **複製檔案**：將選定的程式碼從 `rtl/candidate/` 複製到 `design1101/`，並將 Top Module 檔案命名為 `design1101.v`。
    * **注入木馬**：在 `design1101/` 的基礎上，再建立一個木馬設計資料夾，例如 `design2101/`。將木馬程式碼放入其中，並命名 Top Module 檔案為 `design2101.v`。
4.  **提交變更與記錄**：
    * 完成後，使用 `git add .` 和 `git commit -m "commit message"` 將你的工作推送到主分支。
    * **Commit 命名格式**：請務必遵循以下格式：
      `[編號]-[組員姓名]-[簡短說明]`
      * **範例**：`1101-Jeb-新增 clean design` 或 `2101-Jeb-插入 Trojan 5`
    * **`readme.md` 規範**：
      - 提交木馬設計時，**務必**在該設計的資料夾中新增一個 `readme.md`。
      - 檔案內容請使用以下範本，並填寫詳細資訊：
        ```
        Trojan based: [例如：Trojan 5]
        Trigger: [例如：當分數達到 10]
        Payload: [例如：將對手分數重設為 0]
        Insert module: [例如：Pong_Top.v]
        ```
5.  **管理員的後續處理 (Jason的責任)**：
    * 當有新的檔案被提交後，你需要負責將其轉換成網表，並放入 `netlist/designs/` 相應的資料夾中。
    * **標籤化**：你需要為每個設計生成標籤，並放入 `labels/` 目錄，這是機器學習的關鍵步驟。

## 聯絡資訊
- **Jason (專案管理員)**：[你的聯絡方式]
- Jeb: [Jeb 的聯絡方式]
- Conashin: [Conashin 的聯絡方式]
- Aslan: [Aslan 的聯絡方式]