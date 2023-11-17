`timescale 1ns/1ps

module vga_sync (
    input [9:0] h_count, [9:0] v_count,
    output h_sync, v_sync, video_on,
    output [9:0] x_loc, [9:0] y_loc
);

//horizontal
localparam HD = 640;
localparam HF = 16;
localparam HB = 48;
localparam HR = 96;

//vertical
localparam VD = 480;
localparam VF = 10;
localparam VB = 33;
localparam VR = 2;

assign x_loc = h_count;
assign y_loc = v_count;
assign video_on =(h_count < HD && v_count < VD) ? 1 : 0;
assign h_sync = (h_count < (HD + HF) | h_count >= (HD + HF + HR)) ? 1 : 0;
assign v_sync = (v_count < (VD + VF) | v_count >= (VD + VF + VR)) ? 1 : 0;

endmodule

//module vga_sync(
// input wire i_clk, // 100MHz onboard clock
// input wire i_rst, // reset
// output wire o_hsync, // horizontal sync
// output wire o_vsync, // vertical sync
// output wire o_active, // high during active pixel drawing
// output wire [9:0] o_x, // current pixel x position
// output wire [9:0] o_y // current pixel y position
// );
// // setup VGA timings
// //-------------------------------------
// // VGA 640x480 Horizontal Timing (line)
// localparam HSYNCSTART = 16; // horizontal sync start
// localparam HSYNCEND = 16 + 96; // horizontal sync end
// localparam HACTIVESTART = 16 + 96 + 48; // horizontal active start
// localparam HACTIVEEND = 16 + 96 + 48 + 640; // horizontal active end
// reg [9:0] H_SCAN; // line position
 
// // VGA 640x480 Vertical timing (frame)
// localparam VSYNCSTART = 10; // vertical sync start
// localparam VSYNCEND = 10 + 2; // vertical sync end
// localparam VACTIVESTART = 10 + 2 + 33; // vertical active start
// localparam VACTIVEEND = 10 + 2 + 33 + 480; // vertical active end
// reg [9:0] V_SCAN; // screen position
// // set sync signals to low (active) or high (inactive)
// assign o_hsync = ~((H_SCAN >= HSYNCSTART) & (H_SCAN < HSYNCEND));
// assign o_vsync = ~((V_SCAN >= VSYNCSTART) & (V_SCAN < VSYNCEND));
 
// // set x and y values
// assign o_x = (H_SCAN < HACTIVESTART) ? 0 : (H_SCAN - HACTIVESTART);
// assign o_y = (V_SCAN < VACTIVESTART) ? 0 : (V_SCAN - VACTIVESTART);
// // set active high during active area
// assign o_active = ~((H_SCAN < HACTIVESTART) | (V_SCAN < VACTIVESTART)); 
 
// // generate 25MHz pixel clock using a "Fractional Clock Divider"
// reg [15:0] counter1;
// reg pix_clk;
// always @(posedge i_clk)
// {pix_clk, counter1} <= counter1 + 16'h4000; // divide 100MHz by 4 = 25MHz : (2^16)/4 = 16384 decimal or 4000 hex
 
// // check for reset / create frame loop
// always @ (posedge i_clk)
// begin
// // check for reset button pressed
// if (i_rst) // jump to start of a frame and reset registers
// begin
// H_SCAN <= 0;
// V_SCAN <= 0;
// end
 
// // loop through a full screen
// if (pix_clk) 
// begin
// if (H_SCAN == HACTIVEEND) // if at the end of a line update registers
// begin
// H_SCAN <= 0;
// V_SCAN <= V_SCAN + 1;
// end
// else 
// H_SCAN <= H_SCAN + 1; // else increment horizontal counter
// if (V_SCAN == VACTIVEEND) // if at the end of a screen reset vertical counter
// V_SCAN <= 0;
// end
// end
//endmodule
