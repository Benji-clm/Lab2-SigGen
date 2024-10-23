module sigdelay #(
        parameter   A_WIDTH = 8,
                    D_WIDTH = 8,
                    RAM_SIZE = 512
)(
    input logic                 clk,
    input logic                 rst,
    input logic                 wr,
    input logic                 rd,
    input logic [D_WIDTH-1:0]   offset,
    input logic [D_WIDTH-1:0]  mic_signal,
    output logic [D_WIDTH-1:0]  delayed_signal
);

    logic [A_WIDTH-1:0]         wr_addr;
    logic [A_WIDTH-1:0]         rd_addr;

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .incr (incr),
    .count (wr_addr)
);

dualram dualram (
    .clk (clk),
    .wr_en (wr),
    .rd_en (rd),
    .wr_addr (wr_addr),
    .rd_addr (wr_addr + offset),
    .din (mic_signal),
    .dout (delayed_signal) 
);


endmodule
