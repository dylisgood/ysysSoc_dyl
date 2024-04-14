`define ysyx_22050854_FLASH_START_ADDR 32'h30000000
`define ysyx_22050854_FLASH_END_ADDR 32'h37ffffff
`define ysyx_22050854_MEMORY_START_ADDR 32'h80000000
`define SOC_SIMULATION

`ifdef SOC_SIMULATION
`define ysyx_22050854_MEMORY_END_ADDR 32'hfbffffff
`define ysyx_22050854_START_PC 32'h30000000
`else
`define ysyx_22050854_MEMORY_END_ADDR 32'h87ffffff
`define ysyx_22050854_START_PC 32'h80000000
`endif

`define FLASH_AXI4_ID 4'b0000
`define Dcache_AXI4_ID 4'b0001
`define Device_AXI4_ID 4'b0010
`define Icache_AXI4_ID 4'b0011
module ysyx_22050854 (
    input clock,
    input reset,
    input io_interrupt,
    input io_master_awready,
    output io_master_awvalid, 
    output [3:0] io_master_awid, 
    output [31:0] io_master_awaddr, 
    output [7:0] io_master_awlen,
    output [2:0] io_master_awsize,
    output [1:0] io_master_awburst,
    input io_master_wready,
    output  io_master_wvalid,
    output [63:0] io_master_wdata,
    output [7:0] io_master_wstrb,
    output  io_master_wlast,
    output  io_master_bready,
    input  io_master_bvalid,
    input [3:0] io_master_bid,
    input [1:0] io_master_bresp,
    input  io_master_arready,
    output  io_master_arvalid,
    output [3:0] io_master_arid,
    output [31:0] io_master_araddr,
    output [7:0] io_master_arlen,
    output [2:0] io_master_arsize,
    output [1:0] io_master_arburst,
    output  io_master_rready,
    input  io_master_rvalid,
    input [3:0] io_master_rid,
    input [1:0] io_master_rresp,
    input [63:0] io_master_rdata,
    input  io_master_rlast,
    output io_slave_awready,
    input  io_slave_awvalid, 
    input [3:0] io_slave_awid, 
    input [31:0] io_slave_awaddr, 
    input [7:0] io_slave_awlen,
    input [2:0] io_slave_awsize,
    input [1:0] io_slave_awburst,
    output io_slave_wready,
    input  io_slave_wvalid,
    input [63:0] io_slave_wdata,
    input [7:0] io_slave_wstrb,
    input  io_slave_wlast,
    input  io_slave_bready,
    output  io_slave_bvalid,
    output [3:0] io_slave_bid,
    output [1:0] io_slave_bresp,
    output  io_slave_arready,
    input  io_slave_arvalid,
    input [3:0] io_slave_arid,
    input [31:0] io_slave_araddr,
    input [7:0] io_slave_arlen,
    input [2:0] io_slave_arsize,
    input [1:0] io_slave_arburst,
    input  io_slave_rready,
    output  io_slave_rvalid,
    output [3:0] io_slave_rid,
    output [1:0] io_slave_rresp,
    output [63:0] io_slave_rdata,
    output  io_slave_rlast,
    output [5:0] io_sram0_addr,
    output  io_sram0_cen,
    output  io_sram0_wen,
    output [127:0] io_sram0_wmask,
    output [127:0] io_sram0_wdata,
    input [127:0] io_sram0_rdata,
    output [5:0] io_sram1_addr,
    output  io_sram1_cen,
    output  io_sram1_wen,
    output [127:0] io_sram1_wmask,
    output [127:0] io_sram1_wdata,
    input [127:0] io_sram1_rdata,
    output [5:0] io_sram2_addr,
    output  io_sram2_cen,
    output  io_sram2_wen,
    output [127:0] io_sram2_wmask,
    output [127:0] io_sram2_wdata,
    input [127:0] io_sram2_rdata,
    output [5:0] io_sram3_addr,
    output  io_sram3_cen,
    output  io_sram3_wen,
    output [127:0] io_sram3_wmask,
    output [127:0] io_sram3_wdata,
    input [127:0] io_sram3_rdata,
    output [5:0] io_sram4_addr,
    output  io_sram4_cen,
    output  io_sram4_wen,
    output [127:0] io_sram4_wmask,
    output [127:0] io_sram4_wdata,
    input [127:0] io_sram4_rdata,
    output [5:0] io_sram5_addr,
    output  io_sram5_cen,
    output  io_sram5_wen,
    output [127:0] io_sram5_wmask,
    output [127:0] io_sram5_wdata,
    input [127:0] io_sram5_rdata,
    output [5:0] io_sram6_addr,
    output  io_sram6_cen,
    output  io_sram6_wen,
    output [127:0] io_sram6_wmask,
    output [127:0] io_sram6_wdata,
    input [127:0] io_sram6_rdata,
    output [5:0] io_sram7_addr,
    output  io_sram7_cen,
    output  io_sram7_wen,
    output [127:0] io_sram7_wmask,
    output [127:0] io_sram7_wdata,
    input [127:0] io_sram7_rdata
); 
    //No use, set 0
    assign io_slave_awready = 1'b0;
    assign io_slave_wready = 1'b0;
    assign io_slave_bvalid = 1'b0;
    assign io_slave_bid = 4'b0;
    assign io_slave_bresp = 2'b0;
    assign io_slave_arready = 1'b0;
    assign io_slave_rvalid = 1'b0;
    assign io_slave_rid = 4'b0;
    assign io_slave_rresp = 2'b0;
    assign io_slave_rdata = 64'b0;
    assign io_slave_rlast = 1'b0;

    //-------------------------------------- IFU --------------------------------------------------------//
    //when IFU_suspend 1->0. the instruction is already at IDreg
    reg [31:0]pc_test;
    always @(posedge clock)begin
        if(reset)
            pc_test <= `ysyx_22050854_START_PC;
        else if( ( next_pc == `ysyx_22050854_MEMORY_START_ADDR )  &&  IDreg_valid )  //For Soc simulation
            pc_test <= `ysyx_22050854_MEMORY_START_ADDR + 32'h4; 
        else if( jump | Data_Conflict_block | last_JumpAndDataBlock ) //If find jump, Datablock or last cycle is jumpAndDatablock
            pc_test <= next_pc + 32'd4;
        else if( last_Suspend_LSU & ~Suspend_LSU )begin  //When LSU suspend over and no other exception
            pc_test <= EXEreg_pc + 32'd8;
        end
        else if ( last_Suspend_IFU & ~Suspend_IFU & IFUsuspend_with_Others ) begin //While IFU suspend over and no other Exception   //当IFU从暂停到结束且 期间没发生其他异常 共五组异常 有跳转，阻塞，阻塞且跳转，ALU提前结束暂停，LSU提前结束暂停
            pc_test <= next_pc + 32'd4;
        end
        else if( Last_Jump_Suspend & ~Suspend_IFU)begin      //While IFU suspend, find jump
            pc_test <= PC_Jump_Suspend + 32'd4;
            Last_Jump_Suspend <= 1'b0;
        end
        else if( Last_DataBlock_Suspend & ~Suspend_IFU)begin   //While IFU suspend, find Datablock
            pc_test <= PC_DataBlock_Suspend + 32'd4;
            Last_DataBlock_Suspend <= 1'b0;
        end
        else if( Last_JumpAndBlock_Suspend & ~Suspend_IFU)begin  //While IFU suspend, find JumpandDatablock
            pc_test <= PC_JumpAndBlock_Suspend + 32'd4;
            Last_JumpAndBlock_Suspend <= 1'b0;
        end
        else if( last_Suspend_ALU & ~Suspend_ALU & ~Suspend_IFU )begin  //While IFU suspend, find ALU suspend, And when ALU suspend over, IFU suspend already over
            pc_test <= EXEreg_pc + 32'd8;
            Last_ALUsuspend_IFUsuspend <= 1'b0;   //***
        end
        else if( Last_ALUsuspend_IFUsuspend & ~Suspend_IFU)begin  //While IFU suspend, find ALU suspend, And When ALU suspend over, IFU suspend still exist. This must prior ALU over
            pc_test <= PC_ALUsuspend_IFUsuspend + 32'd4;
            Last_ALUsuspend_IFUsuspend <= 1'b0;
        end
        else if( Last_LSU_IFU_Suspend & ~Suspend_IFU)begin  //While IFU suspend, find LSU suspend, when LSU suspend over, IFU suspend still exist
            pc_test <= PC_LSU_IFU_Suspend + 32'd4;
            Last_LSU_IFU_Suspend <= 1'b0;
        end
        else if( ~Suspend_IFU )  //&& Fench_from_mem (Soc Simulation)
            pc_test <= pc_test + 32'd4;
    end

    //如果译码阶段发现是jump 但不阻塞 则可根据next_pc取指 
    //如果译码阶段发现阻塞 但不是jump 则可根据next_pc取指 因为pc_test早两拍 而此后第一拍取到的指令不变 第二拍无效
    //如果译码阶段发现既是jump又是阻塞，则不能取指，因为阻塞产生的jump并不准确 (取指的有效信号为0)
    //如果上周期既是jump又是阻塞，则可以取指，因为本周期能计算出是否真正jump (arvalid_n_t)
    //如果ALU发起了暂停，则下周期不取指，直到暂停取消 (t)
    //如果IFU发起暂停，然后暂停取消后，指令已经放到了IDreg，根据译码出来的next_pc取指即可
    //如果在译码阶段发现是jump且此时IFU发起了暂停，则需要记录正确的PC，并在IFU的暂停结束后重新取指
    //如果在译码阶段发现是 单纯的数据阻塞，且此时IFU发起了暂停，则没关系，直接等取回来就好
    //如果在译码阶段发现是 跳转的数据阻塞 则会等待一周期，之后判断是否为跳转 在等待的这一阶段不会发生取指 
    //如果在执行阶段需要暂停，且此时IFU发起了暂停
    reg [31:0]pc_real;
    always @(*)begin
        if(reset)
            pc_real = `ysyx_22050854_START_PC; 
        else if( ( next_pc == `ysyx_22050854_MEMORY_START_ADDR )  &&  IDreg_valid ) // must before FLASH_PC
            pc_real = `ysyx_22050854_MEMORY_START_ADDR;
        else if( ( Flash_PC >= `ysyx_22050854_FLASH_START_ADDR ) && ( Flash_PC <= `ysyx_22050854_FLASH_END_ADDR ) ) 
            pc_real = Flash_PC; 
        else if( jump | Data_Conflict_block | last_JumpAndDataBlock )
            pc_real = next_pc;
        else if( last_Suspend_LSU & ~Suspend_LSU )
            pc_real = EXEreg_pc + 32'd4;
        else if( last_Suspend_IFU & !Suspend_IFU & IFUsuspend_with_Others ) //当SuspendLSU为0时，指令刚好进入IDreg
            pc_real = next_pc;
        else if(  Last_Jump_Suspend & ~Suspend_IFU )
            pc_real = PC_Jump_Suspend;
        else if( Last_DataBlock_Suspend & ~Suspend_IFU )
            pc_real = PC_DataBlock_Suspend;
        else if( Last_JumpAndBlock_Suspend & ~Suspend_IFU )
            pc_real = PC_JumpAndBlock_Suspend;
        else if( last_Suspend_ALU & ~Suspend_ALU )
            pc_real = EXEreg_pc + 32'd4;
        else if( Last_ALUsuspend_IFUsuspend & ~Suspend_IFU)
            pc_real = PC_ALUsuspend_IFUsuspend;
        else if( Last_LSU_IFU_Suspend & ~Suspend_IFU )
            pc_real = PC_LSU_IFU_Suspend;
        else
            pc_real = pc_test; 
    end

    wire Fench_from_mem;
    wire Fench_from_flash;
    assign Fench_from_mem = ( Flash_PC >= `ysyx_22050854_MEMORY_START_ADDR && Flash_PC <= `ysyx_22050854_MEMORY_END_ADDR );
    assign Fench_from_flash = ( Flash_PC >= `ysyx_22050854_FLASH_START_ADDR && Flash_PC <= `ysyx_22050854_FLASH_END_ADDR );

    reg First_Flash_inst;
    reg IFU_Flash_valid;
    always @(posedge clock)begin
        if(reset)begin
            IFU_Flash_valid <= 1'b0;
            First_Flash_inst <= 1'b1;
        end
        else if( ( WBreg_valid || EXEreg_handle_interrupt ) && Fench_from_flash || First_Flash_inst )begin
            IFU_Flash_valid <= 1'b1; //1'b1
            First_Flash_inst <= 1'b0;
        end
        else begin
            IFU_Flash_valid <= 1'b0;
            First_Flash_inst <= 1'b0;
        end
    end

    reg [31:0]Flash_PC;
    always @(posedge clock)begin
        if(reset)
            Flash_PC <= `ysyx_22050854_FLASH_START_ADDR;
        else if( IDreg_valid )
            Flash_PC <= next_pc;
    end

//IFU暂停时发生的异常，用于无效IFU取消暂停后的指令，并且指示下一个PC

    //如果发现jump的时候 IFU没有命中 那么原先的置后两个周期的指令无效不起作用
    //需要等到IFU取到指令无效（具体周期不确定），定义以下寄存器来确定
    reg [31:0]PC_Jump_Suspend;
    reg Last_Jump_Suspend;
    ysyx_22050854_Reg #(32,32'b0) Inst_Reg0 (clock, reset, next_pc, PC_Jump_Suspend, jump & Suspend_IFU & ~last_JumpAndDataBlock);
    ysyx_22050854_Reg #(1,1'b0) Inst_Reg1 (clock, reset, 1'b1, Last_Jump_Suspend, jump & Suspend_IFU & ~last_JumpAndDataBlock);

    //如果发现Datablock的时候 且该指令的第二个指令IFU没有命中 那么原先的置后两个周期的指令无效不起作用 且会损失一个指令
    //需要等到IFU取到指令无效（具体周期不确定），定义以下寄存器来确定
    reg [31:0]PC_DataBlock_Suspend;
    reg Last_DataBlock_Suspend;
    ysyx_22050854_Reg #(32,32'b0) Inst_Reg2 ( clock, reset, next_pc, PC_DataBlock_Suspend, Data_Conflict_block & ~JumpAndDataBlock & Suspend_IFU );
    ysyx_22050854_Reg #(1,1'b0) Inst_Reg3 ( clock, reset, 1'b1, Last_DataBlock_Suspend, Data_Conflict_block & ~JumpAndDataBlock & Suspend_IFU );

    //如果发现Datablock并且是跳转指令时，当前周期不保存，等下一周期不冲突后，再保存正确的跳转地址
    //并且当前周期不存在于DataBlock中，下一周期也不存在于jump中，保证标记的唯一性
    reg [31:0]PC_JumpAndBlock_Suspend;
    reg Last_JumpAndBlock_Suspend;
    ysyx_22050854_Reg #(32,32'b0) Inst_Reg4 ( clock, reset, next_pc, PC_JumpAndBlock_Suspend, last_JumpAndDataBlock & Suspend_IFU );
    ysyx_22050854_Reg #(1,1'b0) Inst_Reg5 ( clock, reset, 1'b1, Last_JumpAndBlock_Suspend, last_JumpAndDataBlock & Suspend_IFU );

    //如果ALU发起暂停的时候 IFU没有命中,正在寻找，而在ALU结束暂停之后，IFU取到指令，那么这个指令应当无效,当之前的逻辑只是ALU暂停时无效
    //应该记录下来ALU暂停且IFU也暂停时的指令，等到IFU结束暂停之后，用这个指令取指
    reg [31:0]PC_ALUsuspend_IFUsuspend;
    reg Last_ALUsuspend_IFUsuspend;
    always @(posedge clock)begin
        if(reset)
        begin
            Last_ALUsuspend_IFUsuspend <= 1'b0;
            PC_ALUsuspend_IFUsuspend <= 32'h0;
        end
        else if(Suspend_ALU & Suspend_IFU)begin
            Last_ALUsuspend_IFUsuspend <= 1'b1;
            PC_ALUsuspend_IFUsuspend  <= EXEreg_pc + 32'd4;
            if(Last_DataBlock_Suspend)
                Last_DataBlock_Suspend <= 1'b0;     //*** 如果有DtaBlock，要置0 不然会重复
        end
    end

    //如果IFU和LSU同时发起暂停，但是LSU提前结束暂停，那么需要记录一个触发器使其在IFU取消暂停后令取到的指令无效，并使用使LSU暂停的指令的下一条指令作为PC
    //但是如果LSU比IFU提前一个周期结束，这个就不管用了,所以我又加了一个不是Data_ok的选项 这样IFU结束暂停后得到的信号依然有效，但是不会生成last信号
    reg [31:0]PC_LSU_IFU_Suspend;
    reg Last_LSU_IFU_Suspend;
    ysyx_22050854_Reg #(32,32'b0) Inst_Reg6 ( clock, reset, EXEreg_pc + 32'd4, PC_LSU_IFU_Suspend, last_Suspend_LSU & ~Suspend_LSU & Suspend_IFU & ~Icache_data_ok); 
    ysyx_22050854_Reg #(1,1'b0) Inst_Reg7 ( clock, reset, 1'b1, Last_LSU_IFU_Suspend, last_Suspend_LSU & ~Suspend_LSU & Suspend_IFU & ~Icache_data_ok );

//

    reg [31:0]pc_record_1;
    reg [31:0]pc_record_2;
    always@(posedge clock)begin
        if(reset)
            pc_record_1 <= 32'b0;
        else 
            pc_record_1 <= pc_real; 
    end
    always@(posedge clock)begin
        if(reset)
            pc_record_2 <= 32'b0;
        else if( Icache_addr_ok )
            pc_record_2 <= pc_record_1;
    end

    wire [31:0]pc_record;
    assign pc_record = jump ? next_pc : pc_record_2;

    //如果当前周期下是jalr 或者 beq指令 且发生了阻塞，则无法产生正确的next_pc,本周期不取指
    wire JumpAndDataBlock;
    assign JumpAndDataBlock = ( ( IDreg_inst[6:0] == 7'b1100011) | (IDreg_inst[6:0]) == 7'b1100111) & Data_Conflict_block;
    reg last_JumpAndDataBlock;
    ysyx_22050854_Reg #(1,1'b0) jumpandblock (clock, reset, JumpAndDataBlock, last_JumpAndDataBlock, 1'b1);
    reg last_Suspend_ALU;
    ysyx_22050854_Reg #(1,1'b0) record_lastSuspend (clock, reset, Suspend_ALU, last_Suspend_ALU, 1'b1);
    reg last_Suspend_IFU;
    ysyx_22050854_Reg #(1,1'b0) record_last_Suspend_IFU (clock, reset, Suspend_IFU, last_Suspend_IFU, 1'b1);
    reg last_Suspend_LSU;
    ysyx_22050854_Reg #(1,1'b0) record_last_Suspend_LSU (clock, reset, Suspend_LSU, last_Suspend_LSU, 1'b1);


    wire SuspendCPU;
    assign SuspendCPU = Suspend_ALU | Suspend_IFU | Suspend_LSU;
    reg IFU_Icache_valid;
    always @(*)begin
        if(reset)
            IFU_Icache_valid = 1'b0;
        else
            IFU_Icache_valid = ~JumpAndDataBlock & ~SuspendCPU & ( Fench_from_mem ); //| ( pc_real == `ysyx_22050854_MEMORY_START_ADDR && WBreg_valid )
    end
    wire [6:0]Icache_index;
    wire [20:0]Icache_tag;
    wire Icache_offset;
    assign Icache_offset = pc_real[3];
    assign Icache_tag = pc_real[31:11];
    assign Icache_index = pc_real[10:4];
    wire Icache_addr_ok;
    wire Icache_data_ok;
    wire [63:0]Icache_ret_data;
    wire Suspend_IFU;

    wire AXI_Icache_rd_req;
    wire [31:0]AXI_Icache_rd_addr;
    wire AXI_Icache_ret_valid;
    wire AXI_Icache_ret_last;
    wire [63:0]AXI_Icache_ret_data;
    assign AXI_Icache_ret_valid = io_master_rvalid && ( io_master_rid == `Icache_AXI4_ID ); // && ( io_master_rresp  == 2'b10 ) ;
    assign AXI_Icache_ret_last = io_master_rlast;
    assign AXI_Icache_ret_data = io_master_rdata;
    ysyx_22050854_Icache icache_inst(
        .clock(clock),
        .reset(reset),
        .valid(IFU_Icache_valid),
        .op(1'b0), 
        .index(Icache_index),
        .tag(Icache_tag), 
        .offset(Icache_offset), 
        .addr_ok(Icache_addr_ok), 
        .data_ok(Icache_data_ok),
        .rdata(Icache_ret_data),
        .unshoot(Suspend_IFU),

        .rd_req(AXI_Icache_rd_req), 
        .rd_addr(AXI_Icache_rd_addr),
        .rd_rdy(1'b1),
        .ret_valid(AXI_Icache_ret_valid),
        .ret_last(AXI_Icache_ret_last),
        .ret_data(AXI_Icache_ret_data),

        .sram0_addr(io_sram0_addr),
        .sram0_cen(io_sram0_cen),
        .sram0_wen(io_sram0_wen),
        .sram0_wmask(io_sram0_wmask),
        .sram0_wdata(io_sram0_wdata),
        .sram0_rdata(io_sram0_rdata),

        .sram1_addr(io_sram1_addr),
        .sram1_cen(io_sram1_cen),
        .sram1_wen(io_sram1_wen),
        .sram1_wmask(io_sram1_wmask),
        .sram1_wdata(io_sram1_wdata),
        .sram1_rdata(io_sram1_rdata),

        .sram2_addr(io_sram2_addr),
        .sram2_cen(io_sram2_cen),
        .sram2_wen(io_sram2_wen),
        .sram2_wmask(io_sram2_wmask),
        .sram2_wdata(io_sram2_wdata),
        .sram2_rdata(io_sram2_rdata),

        .sram3_addr(io_sram3_addr),
        .sram3_cen(io_sram3_cen),
        .sram3_wen(io_sram3_wen),
        .sram3_wmask(io_sram3_wmask),
        .sram3_wdata(io_sram3_wdata),
        .sram3_rdata(io_sram3_rdata)
    );

    wire AXI_Flash_ret_valid;
    wire [31:0]inst_from_flash;
    assign AXI_Flash_ret_valid = io_master_rvalid && io_master_rlast && ( io_master_rid == `FLASH_AXI4_ID );
    assign inst_from_flash = io_master_rdata[31:0];
    wire [63:0]inst_64;
    wire [31:0]inst;
    assign inst_64 = (Icache_data_ok == 1'b1) ? Icache_ret_data : 64'h6666666666666666;
    assign inst = Icache_data_ok ? ( ( pc_record_2[2:0] == 3'b000 ) ? inst_64[31:0] : inst_64[63:32] ) : ( AXI_Flash_ret_valid ? inst_from_flash : 32'b0 );

    //---------------------------------------------                      ID_reg                             -----------------------------------------//
    reg IDreg_valid;
    reg [31:0]IDreg_inst;
    reg [31:0]IDreg_pc;
    wire IDreg_inst_enable;
    wire IDreg_pc_enable;
    //如果更新前发现需要阻塞，就不更新了 如果ALU发起了暂停，IDreg也应该保持不变 //后来改了，ALU结束后重新取指，不过改不改不影响
    assign IDreg_inst_enable = ( Icache_data_ok & (~Data_Conflict_block) & ~Suspend_ALU ) | AXI_Flash_ret_valid; 
    assign IDreg_pc_enable = ( Icache_data_ok & (~Data_Conflict_block) & ~Suspend_ALU ) | AXI_Flash_ret_valid;
    wire IFUsuspend_with_Others;
    assign IFUsuspend_with_Others = (~Last_Jump_Suspend) & (~Last_DataBlock_Suspend) & (~Last_ALUsuspend_IFUsuspend) & (~Last_JumpAndBlock_Suspend) & ~Last_LSU_IFU_Suspend;
    always@(posedge clock)begin
        if(reset)
            IDreg_valid <= 1'b0;
        else
            IDreg_valid <=  ( Icache_data_ok & (~jump) & (~EXEreg_jump) & (~EXEreg_Datablock) & (~Suspend_ALU) & IFUsuspend_with_Others & ~Suspend_LSU ) | Data_Conflict_block | AXI_Flash_ret_valid;
    end                                                                                                          

    ysyx_22050854_Reg #(32,32'b0) IDreg_gen0 (clock, (reset), inst, IDreg_inst, IDreg_inst_enable);
    always @(posedge clock)begin
        if(reset)
            IDreg_pc <= 32'h0;
        else if(IDreg_pc_enable && Icache_data_ok)
            IDreg_pc <= pc_record;
        else if(IDreg_pc_enable && AXI_Flash_ret_valid)
            IDreg_pc <= Flash_PC;
    end

    //----------------------------------          ID           -----------------------//
    wire [4:0]rs1,rs2;
    wire [4:0]rd;
    wire [2:0]ExtOP;
    wire RegWr;
    wire [2:0]Branch;
    wire No_branch;
    wire MemtoReg;
    wire MemWr;
    wire MemRd;
    wire [2:0]MemOP;
    wire ALUsrc1;
    wire [1:0]ALUsrc2;
    wire [3:0]ALUctr;
    wire [2:0]ALUext;
    wire [3:0]MULctr;
    ysyx_22050854_IDU instr_decode(
        .instr(IDreg_inst),
        .rs1(rs1),                          
        .rs2(rs2),
        .rd(rd),
        .ExtOP(ExtOP),
        .RegWr(RegWr),
        .Branch(Branch),
        .No_branch(No_branch),
        .MemtoReg(MemtoReg),
        .MemWr(MemWr),
        .MemRd(MemRd),
        .MemOP(MemOP),
        .ALUsrc1(ALUsrc1),
        .ALUsrc2(ALUsrc2),
        .ALUctr(ALUctr),
        .ALUext(ALUext),
        .MULctr(MULctr)     
    );   

    wire [63:0]imm;
    ysyx_22050854_imm_gen gen_imm(
    .instr(IDreg_inst),
    .ExtOP(ExtOP),
    .imm(imm)
);

    wire [63:0]src1;
    wire [63:0]src2;
    ysyx_22050854_RegisterFile regfile_inst(
    .clock(clock),
    .wdata(wr_reg_data),
    .waddr(WBreg_rd),
    .wen(WBreg_regwr & WBreg_valid),
    .raddra(rs1),
    .raddrb(rs2),
    .rdata1(src1),
    .rdata2(src2)  
    );

    wire [63:0]alu_src1;
    wire [63:0]alu_src2;
    ysyx_22050854_src_gen gen_src(
        .ALUsrc1(ALUsrc1),
        .ALUsrc2(ALUsrc2),
        .pc(IDreg_pc),
        .imm(imm),
        .src1(New_src1),
        .src2(New_src2),
        .alu_src1(alu_src1),
        .alu_src2(alu_src2)
    );

    //-------------------------------------  CSR 相关 ----------------------------------------------//
    //CSR 读控制字
    wire CSRrd;
    wire CSR_read;
    assign CSRrd = ( IDreg_inst[6:0] == 7'b1110011 | handle_timer_intr ) ? (Insrtuction_ebreak ? 1'b0 : 1'b1) : 1'b0; //ebreak not read
    assign CSR_read = CSRrd & IDreg_valid & ~Suspend_ALU & ~Suspend_LSU & ~Data_Conflict_block;
    //CSR 读寄存器地址
    wire [11:0]csr_raddr;
    assign csr_raddr = ( Insrtuction_ecall | handle_timer_intr ) ? 12'h305 : ( Insrtuction_mret ? 12'h341 : IDreg_inst[31:20] ); //ecall-mtvec(305) mret-mepc(341)

    //CSR 写控制字
    wire CSRwr1;
    wire CSRwr2;
    wire CSRwr_t;
    wire CSR_Write1;
    wire CSR_Write2;
    ysyx_22050854_MuxKey #(6,10,1) csrwr_t_gen (CSRwr_t, {IDreg_inst[14:12],IDreg_inst[6:0]}, {
        10'b0011110011,1'b1,
        10'b0101110011,1'b1,
        10'b0111110011,1'b1,
        10'b1011110011,1'b1,
        10'b1101110011,1'b1,
        10'b1111110011,1'b1
    });
    assign CSRwr1 = ( Insrtuction_ecall | handle_timer_intr ) ? 1'b1 : CSRwr_t; //mret and ebreak
    assign CSRwr2 = ( Insrtuction_ecall | handle_timer_intr ) ? 1'b1 : 1'b0;   //only ecall need to write two csr
    assign CSR_Write1 = CSRwr1 & IDreg_valid & ~Suspend_ALU & ~Suspend_LSU & ~Data_Conflict_block;
    assign CSR_Write2 = CSRwr2 & IDreg_valid & ~Suspend_ALU & ~Suspend_LSU & ~Data_Conflict_block;
    //CSR   写地址
    wire [11:0]csr_waddr1,csr_waddr2;
    assign csr_waddr1 = ( Insrtuction_ecall | handle_timer_intr ) ? 12'h341 : IDreg_inst[31:20]; //if ecall, mepc
    assign csr_waddr2 = ( Insrtuction_ecall | handle_timer_intr ) ? 12'h342 : IDreg_inst[31:20]; //if ecall, mcause
    //写数据
    wire [63:0]csr_wdata1,csr_wdata2;
    wire [63:0]csrwdata_t;
    ysyx_22050854_MuxKey #(6,10,64) csrwdata_gen (csrwdata_t, {IDreg_inst[14:12],IDreg_inst[6:0]}, {
        10'b0011110011, New_src1,
        10'b0101110011, csr_rdata | New_src1,
        10'b0111110011, csr_rdata & ~New_src1,
        10'b1011110011, {59'd0,IDreg_inst[19:15]},
        10'b1101110011, csr_rdata | {59'd0,IDreg_inst[19:15]},
        10'b1111110011, csr_rdata & ~{59'd0,IDreg_inst[19:15]}
    });
    assign csr_wdata1 = ( Insrtuction_ecall | handle_timer_intr ) ? ( { 32'd0, IDreg_pc } ) : csrwdata_t; //ecall->mepc
    assign csr_wdata2 = handle_timer_intr ? 64'h8000000000000007 : Insrtuction_ecall ? 64'd11 :  64'h0;  //ecall->mcause

    wire Insrtuction_mret;
    wire Insrtuction_ecall;
    wire Insrtuction_ebreak; 
    assign Insrtuction_mret = ( IDreg_inst == 32'h30200073 ) && IDreg_valid;  //mret need wirte mtatus
    assign Insrtuction_ecall = ( IDreg_inst == 32'h73 ) && IDreg_valid;
    assign Insrtuction_ebreak = ( ( WBreg_inst == 32'b0000_0000_0001_0000_0000_0000_0111_0011 ) &  WBreg_valid ) ? 1'b1 : 1'b0;
    wire [63:0]csr_rdata;
    wire timer_interrupt;
    ysyx_22050854_CSRegister CSRfile_inst (
    .clock(clock),
    .reset(reset),
    .waddr1(csr_waddr1),
    .waddr2(csr_waddr2),
    .wdata1(csr_wdata1),
    .wdata2(csr_wdata2),
    .mret(Insrtuction_mret),
    .ecall(Insrtuction_ecall),
    .wen(CSR_Write1),
    .wen2(CSR_Write2),
    .ren(CSR_read),
    .raddr(csr_raddr),
    .mtime_bigger_mtimecmp(mtime_bigger_mtimecmp),
    .rdata(csr_rdata),
    .timer_interrupt(timer_interrupt),
    .handle_timer_intr(handle_timer_intr)
    );
    
    wire CSR_gprRd;  //for conflict judge
    ysyx_22050854_MuxKey #(3,10,1) CSR_gprRd_gen (CSR_gprRd, {IDreg_inst[14:12],IDreg_inst[6:0]}, {
        10'b0011110011, 1'b1,
        10'b0101110011, 1'b1,
        10'b0111110011, 1'b1
    });

    wire handle_timer_intr;
    //assign handle_timer_intr = 1'b0;
    assign handle_timer_intr = timer_interrupt && IDreg_valid && ~Suspend_ALU && ~Suspend_LSU & ~Data_Conflict_block;  //only when IDreg_valid can handle timer_interrupt

    //-------------------       判断数据冲突       --------------------------------//
    wire rs1_conflict_EXE;
    wire rs2_conflict_EXE;
    wire reg_Conflict_EXE;
    wire store_conflict_EXE; //还有一种冲突是当store指令的源操作数(要写入内存的数据)与之前指令的目的寄存器重合时（如ld 之后 sd / add 之后 sd）
    wire ret_conflict_EXE;
    assign rs1_conflict_EXE = (( ALUsrc1 == 1'b0 ) & ( rs1 == EXEreg_Rd ) & ( EXEreg_Rd != 0)); //当且仅当alu操作数是寄存器，且前一条指令要写回， 且写回地址不是x0时 ,rd = rs 才冲突
    assign rs2_conflict_EXE = (( ALUsrc2 == 2'b00 ) & ( rs2 == EXEreg_Rd) & ( EXEreg_Rd != 0));
    assign reg_Conflict_EXE = IDreg_valid & EXEreg_valid & EXEreg_regWr  & ( rs1_conflict_EXE | rs2_conflict_EXE ); //与前一条指令冲突
    assign store_conflict_EXE = IDreg_valid & MemWr & (rs2 == EXEreg_Rd) & (EXEreg_Rd != 0) & (EXEreg_valid) & (EXEreg_regWr);
    assign ret_conflict_EXE = IDreg_valid & (IDreg_inst[6:0] == 7'b1100111) & (rs1 == EXEreg_Rd) & EXEreg_regWr & EXEreg_valid & (EXEreg_Rd != 0);

    wire rs1_conflict_MEM;
    wire rs2_conflict_MEM;
    wire reg_Conflict_MEM;
    wire store_conflict_MEM;
    wire ret_conflict_MEM;
    assign rs1_conflict_MEM = (( ALUsrc1 == 1'b0 ) & ( rs1 == MEMreg_rd) & (MEMreg_rd != 0));
    assign rs2_conflict_MEM = (( ALUsrc2 == 2'b00) & ( rs2 == MEMreg_rd) & (MEMreg_rd != 0));
    assign reg_Conflict_MEM = IDreg_valid & MEMreg_valid & MEMreg_regwr & (rs1_conflict_MEM | rs2_conflict_MEM); //与前两条指令冲突
    assign store_conflict_MEM = IDreg_valid & MemWr & (rs2 == MEMreg_rd) & (MEMreg_rd != 0) & (MEMreg_valid) & (MEMreg_regwr);
    assign ret_conflict_MEM = IDreg_valid & (IDreg_inst[6:0] == 7'b1100111) & (rs1 == MEMreg_rd) & MEMreg_regwr & MEMreg_valid & (MEMreg_rd != 0);

    wire rs1_conflict_WB;
    wire rs2_conflict_WB;
    wire ret_conflict_WB;
    wire reg_Conflict_WB;
    wire store_conflict_WB;
    wire ret_conflict_WB;
    //按理说内存数据冲突 应该不会发生在这，因为发现冲突后的上升沿就写回数据了，而此时当前指令刚发起访问请求
    assign rs1_conflict_WB = (( ALUsrc1 == 1'b0 ) & (rs1 == WBreg_rd) & (WBreg_rd != 0));
    assign rs2_conflict_WB = (( ALUsrc2 == 2'b00) & (rs2 == WBreg_rd) & (WBreg_rd != 0));
    assign reg_Conflict_WB = IDreg_valid & WBreg_valid & WBreg_regwr & ( rs1_conflict_WB | rs2_conflict_WB);   //与前三条指令冲突
    assign store_conflict_WB = IDreg_valid & MemWr & (rs2 == WBreg_rd) & (WBreg_rd != 0) & (WBreg_valid) & (WBreg_regwr);
    assign ret_conflict_WB = IDreg_valid & (IDreg_inst[6:0] == 7'b1100111) & (rs1 == WBreg_rd) & WBreg_regwr & WBreg_valid & (WBreg_rd != 0);

    wire CSRsrc1_conflict_EXE;
    wire CSRsrc1_conflict_MEM;
    wire CSRsrc1_conflict_WB;
    assign CSRsrc1_conflict_EXE = IDreg_valid & CSR_gprRd & (rs1 == EXEreg_Rd) & ( EXEreg_Rd != 0 ) & (EXEreg_valid) & (EXEreg_regWr);
    assign CSRsrc1_conflict_MEM = IDreg_valid & CSR_gprRd & (rs1 == MEMreg_rd) & ( MEMreg_rd != 0 ) & MEMreg_valid & MEMreg_regwr;
    assign CSRsrc1_conflict_WB = IDreg_valid & CSR_gprRd & (rs1 == WBreg_rd) & ( WBreg_rd != 0) & WBreg_valid & WBreg_regwr;
    //only ecall use src2
    wire CSRsrc2_conflict_EXE;
    wire CSRsrc2_conflict_MEM;
    wire CSRsrc2_conflict_WB;
    assign CSRsrc2_conflict_EXE = IDreg_valid & ( IDreg_inst == 32'h73 ) & (rs2 == EXEreg_Rd) & (EXEreg_valid) & (EXEreg_regWr);
    assign CSRsrc2_conflict_MEM = IDreg_valid & ( IDreg_inst == 32'h73 ) & (rs2 == MEMreg_rd) & (MEMreg_valid) & (MEMreg_regwr);
    assign CSRsrc2_conflict_WB = IDreg_valid & ( IDreg_inst == 32'h73 ) & (rs2 == WBreg_rd) & WBreg_valid & WBreg_regwr;
    wire CSRsrc_confilct_EXE;
    assign CSRsrc_confilct_EXE = CSRsrc1_conflict_EXE | CSRsrc2_conflict_EXE;

    //需要阻塞的情况
    wire Data_Conflict_block;
    assign Data_Conflict_block = ( reg_Conflict_EXE | store_conflict_EXE | ret_conflict_EXE | CSRsrc_confilct_EXE ) & EXEreg_memRd & ~Suspend_LSU; //目前是只有上一条指令是load的情况才需要阻塞

    wire src1_conflict_EXE;
    wire src1_conflict_MEM;
    wire src1_conflict_WB;
    assign src1_conflict_EXE = ( reg_Conflict_EXE & rs1_conflict_EXE ) | ret_conflict_EXE | CSRsrc1_conflict_EXE;
    assign src1_conflict_MEM = ( reg_Conflict_MEM & rs1_conflict_MEM ) | ret_conflict_MEM | CSRsrc1_conflict_MEM;
    assign src1_conflict_WB = ( reg_Conflict_WB & rs1_conflict_WB ) | ret_conflict_WB | CSRsrc1_conflict_WB;

    wire src2_conflict_EXE;
    wire src2_conflict_MEM;
    wire src2_conflict_WB;
    assign src2_conflict_EXE = ( reg_Conflict_EXE & rs2_conflict_EXE ) | store_conflict_EXE | CSRsrc2_conflict_EXE;
    assign src2_conflict_MEM = ( reg_Conflict_MEM & rs2_conflict_MEM ) | store_conflict_MEM | CSRsrc2_conflict_MEM;
    assign src2_conflict_WB = ( reg_Conflict_WB & rs2_conflict_WB ) | store_conflict_WB | CSRsrc2_conflict_WB;

    // --------------------------------         流水线前递          ----------------------------------//
    reg [63:0]New_src1;
    reg [63:0]New_src2;
    always @(*)begin
        if(reset)
            New_src1 = 64'b0;
        else if( src1_conflict_EXE & (~EXEreg_memRd) & (~EXEreg_CSRrd) )  //与前一条冲突，且不是load,且不是CSRW
            New_src1 = alu_out;
        else if( src1_conflict_EXE & (~EXEreg_memRd) & EXEreg_CSRrd )  //与前一条冲突，且不是load,但是CSRW
            New_src1 = EXEreg_CSRrdata;  //*****
        else if(src1_conflict_MEM & (~MEMreg_memrd) & (~MEMreg_CSRrd) ) //与前二条冲突，且不是load,也不是CSRW
            New_src1 = MEMreg_aluout;
        else if(src1_conflict_MEM & (~MEMreg_memrd) & MEMreg_CSRrd ) //与前二条冲突，且不是load,但是CSRW
            New_src1 = MEMreg_CSRrdata;
        else if(src1_conflict_MEM & MEMreg_memrd & (~MEMreg_CSRrd) )  //与前二条冲突，且是load ,如果是load 还得判断这个ld指令是不是有内存数据冲突,---现在就算有也是放到读出数据一块得到了
            New_src1 = MEMreg_read_CLINT ? MEMreg_CLINT_value : read_mem_data;
        else if( src1_conflict_WB & (~WBreg_memRd) & (~WBreg_CSRrd) ) //与前三条冲突，且不是load,也不是CSR
            New_src1 = WBreg_aluout;
        else if( src1_conflict_WB & (~WBreg_memRd) & WBreg_CSRrd ) //与前三条冲突，且不是load,也不是CSR
            New_src1 = WBreg_CSRrdata;
        else if( src1_conflict_WB & WBreg_memRd & (~WBreg_CSRrd) ) //与前三条冲突，且是Load
            New_src1 = WBreg_read_CLINT ? WBreg_CLINT_value : WBreg_readmemdata; //keng  //**
        else                                                                        //不冲突
            New_src1 = src1;
    end

    always @(*)begin
        if(reset)
            New_src2 = 64'b0;
        else if( src2_conflict_EXE & (~EXEreg_memRd) & (~EXEreg_CSRrd) )  //与前一条冲突，且不是load,且不是CSRW
            New_src2 = alu_out;
        else if( src2_conflict_EXE & (~EXEreg_memRd) & EXEreg_CSRrd )  //与前一条冲突，且不是load,但是CSRW
            New_src2 = EXEreg_CSRrdata;   //****
        else if(src2_conflict_MEM & (~MEMreg_memrd) & (~MEMreg_CSRrd) ) //与前二条冲突，且不是load,也不是CSRW
            New_src2 = MEMreg_aluout;
        else if(src2_conflict_MEM & (~MEMreg_memrd) & MEMreg_CSRrd ) //与前二条冲突，且不是load,但是CSRW
            New_src2 = MEMreg_CSRrdata;
        else if(src2_conflict_MEM & MEMreg_memrd & (~MEMreg_CSRrd) )  //与前二条冲突，且是load ,如果是load 还得判断这个ld指令是不是有内存数据冲突,---现在就算有也是放到读出数据一块得到了
            New_src2 = MEMreg_read_CLINT ? MEMreg_CLINT_value : read_mem_data;
        else if( src2_conflict_WB & (~WBreg_memRd) & (~WBreg_CSRrd) ) //与前三条冲突，且不是load,也不是CSR
            New_src2 = WBreg_aluout;
        else if( src2_conflict_WB & (~WBreg_memRd) & WBreg_CSRrd ) //与前三条冲突，且不是load,也不是CSR
            New_src2 = WBreg_CSRrdata;
        else if( src2_conflict_WB & WBreg_memRd & (~WBreg_CSRrd) ) //与前三条冲突，且是Load
            New_src2 = WBreg_read_CLINT ? WBreg_CLINT_value : WBreg_readmemdata; //keng
        else                                                                        //不冲突
            New_src2 = src2;
    end   

    //根据store命令的格式 获得正确的存入内存的数据
    //即使没有冲突，从src2读取出来的数据 我提前给他格式化一下应该是没问题的，因为在C语言的写内存函数中还是要将wdata按照掩码格式化
    wire [63:0]real_storememdata_right;
    ysyx_22050854_MuxKey #(4,3,64) gen_real_storememdata_right (real_storememdata_right,MemOP,{
        3'b000,{56'b0,New_src2[7:0]},  // sb   000
        3'b001,{48'b0,New_src2[15:0]},  // sh
        3'b010,{32'b0,New_src2[31:0]},  // sw
        3'b011,{New_src2}   // sd
    });

    //-------------- GEN readmemaddr -----------//在译码级就计算出load的地址
    wire [31:0]readmemaddr;
    assign readmemaddr = MemRd | MemWr ? ( alu_src1[31:0] + alu_src2[31:0] ) : 32'd0;

    wire Is_access_mem;
    assign Is_access_mem = (readmemaddr >= `ysyx_22050854_MEMORY_START_ADDR && readmemaddr <= `ysyx_22050854_MEMORY_END_ADDR ) ? 1'b1 : 1'b0;   // npc
    wire LSU_access_valid;
    assign LSU_access_valid =  ( MemRd | MemWr ) & IDreg_valid & ~Suspend_ALU & ~Suspend_LSU & ~Data_Conflict_block & ~handle_timer_intr;  //
    wire Data_cache_valid;
    assign Data_cache_valid =  LSU_access_valid & Is_access_mem;
    wire Data_cache_op;
    assign Data_cache_op = ( MemWr & IDreg_valid & ~Suspend_ALU & ~Data_Conflict_block );
    wire AXI_device_rd_req;
    assign AXI_device_rd_req = LSU_access_valid & MemRd & ~( Is_access_mem | Read_CLINT );
    wire AXI_device_wr_req;
    assign AXI_device_wr_req = LSU_access_valid  & MemWr & ~( Is_access_mem | Write_mtime | Write_mtimecmp );
    wire Read_mtime;
    wire Write_mtime;
    wire Read_mtimecmp;
    wire Write_mtimecmp;
    assign Read_mtime = LSU_access_valid && MemRd && ( readmemaddr == 32'h200BFF8 );
    assign Write_mtime = LSU_access_valid && MemWr && ( readmemaddr == 32'h200BFF8 );
    assign Read_mtimecmp = LSU_access_valid && MemRd && ( readmemaddr == 32'h2004000 );
    assign Write_mtimecmp = LSU_access_valid && MemWr && ( readmemaddr == 32'h2004000 );
    wire Read_CLINT;
    assign Read_CLINT = Read_mtime | Read_mtimecmp;

    // ---------- CLINT ----------//
    reg [63:0]mtime;
    reg [63:0]mtimecmp;
    reg [7:0]tick_count; //mtime self-increment frequency
    always @(posedge clock ) begin
        if(reset)
            tick_count <= 8'b0;
        else if( tick_count == 8'd9 )
            tick_count <= 8'b0;
        else
            tick_count <= tick_count + 8'd1;
    end
    always @(posedge clock) begin
        if(reset)
            mtime <= 64'b0;
        else if(Write_mtime)
            mtime <= real_storememdata_right;
        else if( tick_count == 8'd9 )
            mtime <= mtime + 64'd1;
    end
    always @(posedge clock) begin
        if(reset)
            mtimecmp <= 64'h100000;
        else if(Write_mtimecmp)
            mtimecmp <= real_storememdata_right;
    end
    wire mtime_bigger_mtimecmp;
    assign mtime_bigger_mtimecmp = ( mtime >= mtimecmp ) ? 1'b1 : 1'b0;
    wire [63:0]CLINT_value;
    assign CLINT_value = Read_mtime ? mtime : ( Read_mtimecmp ? mtimecmp : 64'b0 );

    //----------------- GEN PC -----------------//
    wire [31:0]next_pc;
    wire jump;
    wire ecall_or_mret;
    assign ecall_or_mret = ( IDreg_inst == 32'h73 || handle_timer_intr || IDreg_inst == 32'h30200073 ) ? 1'b1 : 1'b0; //ecall mret timer_interrupt
    ysyx_22050854_pc gen_pc(
    .reset(reset),
    .clock(clock),
    .IDreg_valid(IDreg_valid),
    .Data_Conflict(Data_Conflict_block),
    .suspend(Suspend_ALU | Suspend_LSU),
    .Branch(Branch),
    .No_branch(No_branch),
    .is_csr_pc(ecall_or_mret),
    .csr_pc(csr_rdata[31:0]),
    .unsigned_compare(ALUctr[3]),
    .alu_src1(alu_src1),
    .alu_src2(alu_src2),
    .src1(New_src1[31:0]),
    .imm(imm[31:0]),
    .jump(jump),
    .next_pc(next_pc)
    );

    //----------------------------------------------- EXE_reg ------------------------------------------------//
    reg EXEreg_valid;
    wire EXEreg_inst_enable;
    reg [31:0]EXEreg_inst;
    wire EXEreg_pc_enable;
    reg [31:0]EXEreg_pc;
    wire EXEreg_alusrc1_enable;
    reg [63:0]EXEreg_alusrc1;
    wire EXEreg_alusrc2_enable;
    reg [63:0]EXEreg_alusrc2;
    wire EXEreg_ALUctr_enable;
    reg [3:0]EXEreg_ALUctr;
    wire EXEreg_MULctr_enable;
    reg [3:0]EXEreg_MULctr;
    wire EXEreg_ALUext_enable;
    reg [2:0]EXEreg_ALUext;
    wire EXEreg_regWr_enable;
    reg EXEreg_regWr;
    wire EXEreg_Rd_enable;
    reg [4:0]EXEreg_Rd;
    wire EXEreg_memRd_enable;
    reg EXEreg_memRd;
    wire EXEreg_memop_enable;
    reg [2:0]EXEreg_memop;
    wire EXEreg_memtoreg_enable;
    reg EXEreg_memtoreg;
    wire EXEreg_jump_enable;
    reg EXEreg_jump;
    wire EXEreg_Datablock_enable;
    reg EXEreg_Datablock;
    wire EXEreg_CSRrd_enable;
    reg EXEreg_CSRrd;
    wire EXEreg_CSRrdata_enable;
    reg [63:0]EXEreg_CSRrdata;
    wire EXEreg_read_CLINT_enable;
    reg EXEreg_read_CLINT;
    reg [63:0]EXEreg_CLINT_value;
    reg EXEreg_handle_interrupt;

    //如果当前的ALU出现阻塞，则EXEreg不变，直到它计算完成
    assign EXEreg_inst_enable       =  ~Suspend_ALU & ~Suspend_LSU;  
    assign EXEreg_pc_enable         =  ~Suspend_ALU & ~Suspend_LSU;
    assign EXEreg_alusrc1_enable    =  ~Suspend_ALU & ~Suspend_LSU;
    assign EXEreg_alusrc2_enable    =  ~Suspend_ALU & ~Suspend_LSU;
    assign EXEreg_ALUctr_enable     =  ~Suspend_ALU & ~Suspend_LSU;
    assign EXEreg_MULctr_enable     =  ~Suspend_ALU & ~Suspend_LSU;
    assign EXEreg_ALUext_enable     =  ~Suspend_ALU & ~Suspend_LSU;
    assign EXEreg_regWr_enable      =  ~Suspend_ALU & ~Suspend_LSU;
    assign EXEreg_Rd_enable         =  ~Suspend_ALU & ~Suspend_LSU;
    assign EXEreg_memRd_enable      =  ~Suspend_ALU & ~Suspend_LSU;
    assign EXEreg_memop_enable      =  ~Suspend_ALU & ~Suspend_LSU;
    assign EXEreg_memtoreg_enable   =  ~Suspend_ALU & ~Suspend_LSU;
    assign EXEreg_jump_enable       =  ~Suspend_ALU & ~Suspend_LSU;
    assign EXEreg_Datablock_enable  =  ~Suspend_ALU & ~Suspend_LSU;
    assign EXEreg_CSRrd_enable      =  ~Suspend_ALU & ~Suspend_LSU;
    assign EXEreg_CSRrdata_enable   =  ~Suspend_ALU & ~Suspend_LSU;
    assign EXEreg_read_CLINT_enable =  ~Suspend_ALU & ~Suspend_LSU;
    
    ysyx_22050854_Reg #(1,1'b0) EXEreg_gen0 (clock, reset,( (IDreg_valid & (~Data_Conflict_block) & ~handle_timer_intr ) | Suspend_ALU | Suspend_LSU), EXEreg_valid, 1'b1);
    ysyx_22050854_Reg #(32,32'b0) EXEreg_geninst (clock, reset, IDreg_inst, EXEreg_inst, EXEreg_inst_enable);
    ysyx_22050854_Reg #(32,32'h0) EXEreg_genPC (clock, reset, IDreg_pc, EXEreg_pc, EXEreg_pc_enable);
    ysyx_22050854_Reg #(64,64'b0) EXEreg_gen1 (clock, reset, alu_src1, EXEreg_alusrc1, EXEreg_alusrc1_enable);
    ysyx_22050854_Reg #(64,64'b0) EXEreg_gen2 (clock, reset, alu_src2, EXEreg_alusrc2, EXEreg_alusrc2_enable);
    ysyx_22050854_Reg #(4,4'b1111) EXEreg_gen3 (clock, reset, ALUctr, EXEreg_ALUctr, EXEreg_ALUctr_enable);
    ysyx_22050854_Reg #(4,4'b0) EXEreg_gen4 (clock, reset, MULctr, EXEreg_MULctr, EXEreg_MULctr_enable);
    ysyx_22050854_Reg #(3,3'b0) EXEreg_gen5 (clock, reset, ALUext, EXEreg_ALUext, EXEreg_ALUext_enable);
    ysyx_22050854_Reg #(1,1'b0) EXEreg_gen6 (clock, reset, RegWr, EXEreg_regWr, EXEreg_regWr_enable);
    ysyx_22050854_Reg #(5,5'b0) EXEreg_gen7 (clock, reset, rd, EXEreg_Rd, EXEreg_Rd_enable);
    ysyx_22050854_Reg #(1,1'b0) EXEreg_gen9 (clock, reset, MemRd, EXEreg_memRd, EXEreg_memRd_enable);
    ysyx_22050854_Reg #(3,3'b0) EXEreg_gen10 (clock, reset, MemOP, EXEreg_memop, EXEreg_memop_enable);
    ysyx_22050854_Reg #(1,1'b0) EXEreg_gen11 (clock, reset, MemtoReg & ~Read_CLINT, EXEreg_memtoreg, EXEreg_memtoreg_enable);
    ysyx_22050854_Reg #(1,1'b0) EXEreg_gen13 (clock, reset, jump, EXEreg_jump, EXEreg_jump_enable);
    ysyx_22050854_Reg #(1,1'b0) EXEreg_gen14 (clock, reset, Data_Conflict_block, EXEreg_Datablock, EXEreg_Datablock_enable);
    ysyx_22050854_Reg #(1,1'b0) EXEreg_gen20 (clock, reset, CSR_read, EXEreg_CSRrd, EXEreg_CSRrd_enable);
    ysyx_22050854_Reg #(64,64'b0) EXEreg_gen21 (clock, reset, csr_rdata, EXEreg_CSRrdata, EXEreg_CSRrdata_enable);
    ysyx_22050854_Reg #(1,1'b0) EXEreg_gen22 (clock, reset, Read_CLINT, EXEreg_read_CLINT, EXEreg_read_CLINT_enable);
    ysyx_22050854_Reg #(64,64'b0) EXEreg_gen23 (clock, reset, CLINT_value, EXEreg_CLINT_value, EXEreg_read_CLINT_enable);
    ysyx_22050854_Reg #(1,1'b0) EXEreg_gen24 (clock, reset, handle_timer_intr, EXEreg_handle_interrupt, 1'b1);

    //------------ALU------------//
    wire Suspend_ALU;
    wire [63:0]alu_out;
    ysyx_22050854_alu alu1(
    .clock(clock),
    .reset(reset),
    .EXEreg_valid(EXEreg_valid),   
    .ALUctr(EXEreg_ALUctr),
    .MULctr(EXEreg_MULctr),
    .ALUext(EXEreg_ALUext),
    .src1(EXEreg_alusrc1),
    .src2(EXEreg_alusrc2),
    .alu_busy(Suspend_ALU),
    .alu_out(alu_out)
    );

    //--------------------------------------------- MEM_reg ---------------------------------------------//
    reg MEMreg_valid;
    wire MEMreg_inst_enable;
    reg [31:0]MEMreg_inst;
    wire MEMreg_pc_enable;
    reg [31:0]MEMreg_pc;
    wire MEMreg_aluout_enable;
    reg [63:0]MEMreg_aluout;
    wire MEMreg_regwr_enable;
    reg MEMreg_regwr;
    wire MEMreg_rd_enable;
    reg [4:0]MEMreg_rd;
    wire MEMreg_memrd_enable;
    reg MEMreg_memrd;
    wire MEMreg_memop_enable;
    reg [2:0]MEMreg_memop;  //for get right data from 64bits data(from cache)
    wire MEMreg_memtoreg_enable;
    reg MEMreg_memtoreg;
    wire MEMreg_CSRrd_enable;
    reg MEMreg_CSRrd;
    wire MEMreg_CSRrdata_enable;
    reg [63:0]MEMreg_CSRrdata;
    wire MEMreg_CLINT_enable;
    reg MEMreg_read_CLINT;
    reg [63:0]MEMreg_CLINT_value;

    assign MEMreg_inst_enable = 1'b1;
    assign MEMreg_pc_enable = 1'b1;
    assign MEMreg_aluout_enable = 1'b1;
    assign MEMreg_regwr_enable = 1'b1;
    assign MEMreg_rd_enable = 1'b1;
    assign MEMreg_memrd_enable = 1'b1;
    assign MEMreg_memop_enable = 1'b1;
    assign MEMreg_memtoreg_enable = 1'b1;
    assign MEMreg_CSRrd_enable = 1'b1;
    assign MEMreg_CSRrdata_enable = 1'b1;
    assign MEMreg_CLINT_enable = 1'b1;

    ysyx_22050854_Reg #(1,1'b0) MEMreg_gen0 (clock, reset, ( EXEreg_valid & ~Suspend_ALU & ~Suspend_LSU ), MEMreg_valid, 1'b1); //如果ALU出现暂停信号，那么下周期MEMreg无效,如果LSU出现暂停，下周期MEMreg也无效
    ysyx_22050854_Reg #(32,32'b0) MEMreg_geninst (clock, reset, EXEreg_inst, MEMreg_inst, MEMreg_inst_enable);
    ysyx_22050854_Reg #(32,32'h0) MEMreg_genPC (clock, reset, EXEreg_pc, MEMreg_pc, MEMreg_pc_enable);  
    ysyx_22050854_Reg #(64,64'b0) MEMreg_gen1 (clock, reset, alu_out, MEMreg_aluout, MEMreg_aluout_enable);
    ysyx_22050854_Reg #(1,1'b0) MEMreg_gen2 (clock, reset, EXEreg_regWr, MEMreg_regwr, MEMreg_regwr_enable);
    ysyx_22050854_Reg #(5,5'b0) MEMreg_gen3 (clock, reset, EXEreg_Rd, MEMreg_rd, MEMreg_rd_enable);
    ysyx_22050854_Reg #(1,1'b0) MEMreg_gen5 (clock, reset, EXEreg_memRd, MEMreg_memrd, MEMreg_memrd_enable);
    ysyx_22050854_Reg #(3,3'b0) MEMreg_gen6 (clock, reset, EXEreg_memop, MEMreg_memop, MEMreg_memop_enable);
    ysyx_22050854_Reg #(1,1'b0) MEMreg_gen7 (clock, reset, EXEreg_memtoreg, MEMreg_memtoreg, MEMreg_memtoreg_enable);
    ysyx_22050854_Reg #(1,1'b0) MEMreg_gen8 (clock, reset, EXEreg_CSRrd, MEMreg_CSRrd, MEMreg_CSRrd_enable);
    ysyx_22050854_Reg #(64,64'b0) MEMreg_gen9 (clock, reset, EXEreg_CSRrdata, MEMreg_CSRrdata, MEMreg_CSRrdata_enable);
    ysyx_22050854_Reg #(1,1'b0) MEMreg_gen10 (clock, reset, EXEreg_read_CLINT, MEMreg_read_CLINT, MEMreg_CLINT_enable);
    ysyx_22050854_Reg #(64,64'b0) MEMreg_gen11 (clock, reset, EXEreg_CLINT_value, MEMreg_CLINT_value, MEMreg_CLINT_enable);

    wire [63:0] rdata;
    
    wire [63:0] Dcache_ret_data;
    wire [6:0]Data_cache_index;
    wire [20:0]Data_cache_tag;
    wire [3:0]Data_cache_offset;
    assign Data_cache_offset = readmemaddr[3:0];
    assign Data_cache_index = readmemaddr[10:4];
    assign Data_cache_tag = readmemaddr[31:11];
    wire Data_cache_Data_ok;
    wire [7:0]Dcache_wr_wstb;
    ysyx_22050854_MuxKey #(4,3,8) gen_Dcache_wr_wstb (Dcache_wr_wstb,MemOP,{
        3'b000,8'b00000001,  // sb   000
        3'b001,8'b00000011,  // sh
        3'b010,8'b00001111,  // sw
        3'b011,8'b11111111   // sd
    });

    wire [7:0]Device_wr_wstb;
    assign Device_wr_wstb = Dcache_wr_wstb << readmemaddr[2:0];

    wire [31:0]write_device_data_32;
    ysyx_22050854_MuxKey #(4,8,32) gen_device_data_32 (write_device_data_32,Dcache_wr_wstb,{
        8'b00000001,{ real_storememdata_right[7:0], real_storememdata_right[7:0], real_storememdata_right[7:0], real_storememdata_right[7:0] },  // sb   000
        8'b00000011,{ real_storememdata_right[15:0], real_storememdata_right[15:0] },  // sh
        8'b00001111,real_storememdata_right[31:0],  // sw
        8'b11111111,real_storememdata_right[31:0]   // sd
    });

    wire [2:0]awsize;
    ysyx_22050854_MuxKey #(4,3,3) gen_awsize (awsize,MemOP,{
        3'b000,3'b000,  // sb   000
        3'b001,3'b001,  // sh
        3'b010,3'b010,  // sw
        3'b011,3'b011   // sd
    });

    wire AXI_Dcache_rd_req;
    wire [31:0]AXI_Dcache_rd_addr;
    wire AXI_Dcache_rd_rdy;
    wire AXI_Dcache_ret_valid;
    wire AXI_Dcache_ret_last;
    wire [63:0]AXI_Dcache_ret_data;
    wire AXI_Dcache_wr_req;
    wire [31:0]AXI_Dcache_wr_addr;
    wire [7:0]AXI_Dcache_wr_wstb;
    wire [127:0]AXI_Dcache_wr_data;
    wire AXI_Dcache_wr_resp;
    wire AXI_Dcache_wr_rdy;
    assign AXI_Dcache_wr_rdy = last_writemem_finish;
    assign AXI_Dcache_rd_rdy = 1'b1;
    assign AXI_Dcache_ret_valid = ( io_master_rvalid == 1'b1 ) && ( io_master_rid == `Dcache_AXI4_ID ); //  && ( io_master_rresp  == 2'b10 );
    assign AXI_Dcache_ret_last = io_master_rlast;
    assign AXI_Dcache_ret_data = io_master_rdata;
    assign AXI_Dcache_wr_resp = ( io_master_bvalid == 1'b1 ); //  && ( io_master_bid == 4'b0010 ) && (io_master_bresp == 2'b10 );
    wire FenceI;
    assign FenceI = IDreg_valid && ( IDreg_inst[6:0] == 7'b0001111 )  && ( IDreg_inst[14:12] == 3'b001 );
    wire Suspend_MEM;
    ysyx_22050854_Dcache data_cache_inst (
        .clock(clock),
        .reset(reset),
        .valid(Data_cache_valid),
        .op(Data_cache_op),
        .index(Data_cache_index),
        .tag(Data_cache_tag),
        .offset(Data_cache_offset),
        .wstrb(Dcache_wr_wstb),
        .wdata(real_storememdata_right),
        .data_ok(Data_cache_Data_ok),
        .rdata(Dcache_ret_data),
        .unshoot(Suspend_MEM),
        .fencei(FenceI),

        //Dcache & AXI4 交互信号
        .rd_req(AXI_Dcache_rd_req),
        .rd_addr(AXI_Dcache_rd_addr),
        .rd_rdy(AXI_Dcache_rd_rdy),
        .ret_valid(AXI_Dcache_ret_valid),
        .ret_last(AXI_Dcache_ret_last),
        .ret_data(AXI_Dcache_ret_data),
        .wr_req(AXI_Dcache_wr_req),
        .wr_addr(AXI_Dcache_wr_addr),
        .wr_wstb(AXI_Dcache_wr_wstb),
        .wr_data(AXI_Dcache_wr_data),
        .wr_rdy(AXI_Dcache_wr_rdy),
        .wr_resp(AXI_Dcache_wr_resp),

        .sram4_addr(io_sram4_addr),
        .sram4_cen(io_sram4_cen),
        .sram4_wen(io_sram4_wen),
        .sram4_wmask(io_sram4_wmask),
        .sram4_wdata(io_sram4_wdata),
        .sram4_rdata(io_sram4_rdata),

        .sram5_addr(io_sram5_addr),
        .sram5_cen(io_sram5_cen),
        .sram5_wen(io_sram5_wen),
        .sram5_wmask(io_sram5_wmask),
        .sram5_wdata(io_sram5_wdata),
        .sram5_rdata(io_sram5_rdata),

        .sram6_addr(io_sram6_addr),
        .sram6_cen(io_sram6_cen),
        .sram6_wen(io_sram6_wen),
        .sram6_wmask(io_sram6_wmask),
        .sram6_wdata(io_sram6_wdata),
        .sram6_rdata(io_sram6_rdata),

        .sram7_addr(io_sram7_addr),
        .sram7_cen(io_sram7_cen),
        .sram7_wen(io_sram7_wen),
        .sram7_wmask(io_sram7_wmask),
        .sram7_wdata(io_sram7_wdata),
        .sram7_rdata(io_sram7_rdata)
    );


    // ----------------------------------   AXI4 signal generation ------------------------------------------------//
    // --------- write address channel ------------//
    reg Reg_awvalid;
    reg [31:0]Reg_awaddr;
    reg [3:0]Reg_awid;
    reg [7:0]Reg_awlen;
    reg [2:0]Reg_awsize;
    reg [1:0]Reg_awburst;
    reg Reg_is_device;
    always @(posedge clock)begin
        if(reset)begin
            Reg_awvalid <= 1'b0;
            Reg_awaddr <= 32'b0;
            Reg_awid <= 4'b0;
            Reg_awlen <= 8'b0;
            Reg_awsize <= 3'b0;
            Reg_awburst <= 2'b0;
            Reg_is_device <= 1'b0;
        end
        else if(AXI_Dcache_wr_req | AXI_device_wr_req)begin // if get write request from Dcache or IDreg(Device)
            Reg_awvalid <= 1'b1;
            Reg_awaddr <= AXI_Dcache_wr_req ? AXI_Dcache_wr_addr : ( AXI_device_wr_req ? readmemaddr : 32'b0 );
            Reg_awid <= AXI_Dcache_wr_req ? 4'b0001 : ( AXI_device_wr_req ? 4'b0000 : 4'b0 );
            Reg_awlen <= AXI_Dcache_wr_req ? 8'd1 : 8'd0;
            Reg_awsize <= AXI_Dcache_wr_req ? 3'b011 : ( AXI_device_wr_req ? awsize : 3'b000 );
            Reg_awburst <=  AXI_Dcache_wr_req ? 2'b01 : 2'b00;  //incrementing transfer
            Reg_is_device <= AXI_device_wr_req ? 1'b1 : 1'b0;
        end
        else if( Reg_awvalid && io_master_awready )begin
            Reg_awvalid <= 1'b0;
            Reg_awaddr <= 32'b0;
            Reg_awid <= 4'b0;
            Reg_awlen <= 8'b0;
            Reg_awsize <= 3'b0;
            Reg_awburst <= 2'b0;
            Reg_is_device <= 1'b0;
        end
    end
 
    assign io_master_awvalid = Reg_awvalid;
    assign io_master_awaddr = Reg_awaddr;
    assign io_master_awid = Reg_awid;  // 0001-->I-Cache   0010--->Dcache  0011-->device
    assign io_master_awlen = Reg_awlen;       
    assign io_master_awsize = Reg_awsize;  //2^6=64(8 bytes)  2^5=32(4 bytes) 
    assign io_master_awburst = Reg_awburst;  //incrementing transfer

    //for FenceI, because actual write mem may use many cycles
    reg last_writemem_finish;
    always @(posedge clock)begin
        if(reset)
            last_writemem_finish <= 1'b1;
        else if( io_master_wvalid && io_master_wready && io_master_wlast)
            last_writemem_finish <= 1'b1;
        else if( io_master_awvalid && ~io_master_awready )
            last_writemem_finish <= 1'b0;
    end 
    
    //---------------write data channel ------------ //
    //restore write AXI4 data temporarily
    reg [127:0]AXI_wr_data_temp;
    reg [7:0]AXI_wstb_temp;
    always @(posedge clock)begin
        if(reset) begin 
            AXI_wr_data_temp <= 128'b0;
            AXI_wstb_temp <= 8'h0;
        end
        else if( AXI_Dcache_wr_req ) begin
            AXI_wr_data_temp <= AXI_Dcache_wr_data;
            AXI_wstb_temp <= AXI_Dcache_wr_wstb;
        end
        else if( AXI_device_wr_req ) begin
            AXI_wr_data_temp <= { 64'b0,write_device_data_32, write_device_data_32 }; //Soc
            //AXI_wr_data_temp <= { 96'b0, real_storememdata_right[31:0] };       //npc
            AXI_wstb_temp <= Device_wr_wstb;
        end
    end

    reg AXI_Dcache_wlast;
    reg AXI_Dcache_wvalid;
    reg [63:0]AXI_Dcache_data_64;
    reg [7:0]AXI_wstb;
    reg AXI_Dcache_data_first_over;
    //由于采用突发传输传输128位，而总线位宽为64位，所以需要传递两次，需要重新组织待传输的数据
    //当检测到写地址信号时，第一个上升沿准备第一个写数据，并置写数据信号有效，第二个上升沿准备第二个写信号，同样置写数据信号有效
    always @(posedge clock)begin
        if(reset)begin
            AXI_Dcache_data_64 <= 64'b0;
            AXI_Dcache_data_first_over <= 1'b0;
            AXI_Dcache_wvalid <= 1'b0;
            AXI_Dcache_wlast <= 1'b0;
            AXI_wstb <= 8'b0;
        end
        else if( AXI_Dcache_data_first_over && io_master_wready )begin //cache's second data
            AXI_Dcache_data_64 <= AXI_wr_data_temp[127:64];
            AXI_Dcache_wvalid <= 1'b1;
            AXI_wstb <= AXI_wstb_temp;
            AXI_Dcache_data_first_over <= 1'b0;
            AXI_Dcache_wlast <= 1'b1;
        end
        else if( Reg_awvalid ) begin     //wdata is later one cycles than awaddress
            AXI_Dcache_wvalid <= 1'b1;
            AXI_Dcache_wlast <= Reg_is_device ? 1'b1 : 1'b0;
            AXI_Dcache_data_64 <= AXI_wr_data_temp[63:0];
            AXI_wstb <= AXI_wstb_temp;
            AXI_Dcache_data_first_over <= Reg_is_device ? 1'b0 : 1'b1;
        end
        else if(AXI_Dcache_wvalid && io_master_wready)  //if handshake success 
        begin
            AXI_Dcache_data_first_over <= 1'b0;
            AXI_Dcache_data_64 <= 64'b0;
            AXI_Dcache_wvalid <= 1'b0;
            AXI_Dcache_wlast <= 1'b0;
            AXI_wstb <= 8'b0;
        end
    end

    assign io_master_wvalid = AXI_Dcache_wvalid;
    assign io_master_wdata = AXI_Dcache_data_64;
    assign io_master_wstrb = AXI_wstb;
    assign io_master_wlast = AXI_Dcache_wlast;

    //write response channel
    assign io_master_bready = 1'b1;

    //-------------read address channel--------------------//
    ysyx_22050854_AXI_arbiter GEN_AXI_signal (
        .clock(clock),
        .reset(reset),

        .IFU_request(AXI_Icache_rd_req),
        .FLS_request(IFU_Flash_valid),
        .LSU_request(AXI_Dcache_rd_req),
        .DEV_request(AXI_device_rd_req),
        .arready(io_master_arready),
        .IFU_addr(AXI_Icache_rd_addr),
        .FLS_addr(Flash_PC),
        .LSU_addr(AXI_Dcache_rd_addr),
        .Device_addr(readmemaddr),
        .Device_arsize(awsize),
        .AXI_arbiter_arvalid(io_master_arvalid),
        .AXI_arbiter_arid(io_master_arid),
        .AXI_arbiter_addr(io_master_araddr),
        .AXI_arbiter_arlen(io_master_arlen),
        .AXI_arbiter_arsize(io_master_arsize),
        .AXI_arbiter_arburst(io_master_arburst)
    );
    //read data channel
    assign io_master_rready = 1'b1;

    wire AXI_Device_ret_valid;
    wire AXI_Device_wr_resp;
    assign AXI_Device_ret_valid = io_master_rvalid &&  io_master_rlast && ( io_master_rid == `Device_AXI4_ID );
    assign AXI_Device_wr_resp = io_master_bvalid;

    //因为访问设备肯定大于2周期，所以遇到访问设备的指令直接暂停，等到读回应/写回应之后再取消暂停
    reg Suspend_Device;
    always @(posedge clock)begin
        if(reset)
            Suspend_Device <= 1'b0;
        else if( AXI_device_rd_req | AXI_device_wr_req )
            Suspend_Device <= 1'b1;
        else if( ( AXI_Device_ret_valid || AXI_Device_wr_resp ) && Suspend_Device )
            Suspend_Device <= 1'b0;
    end
    wire Suspend_LSU;
    assign Suspend_LSU = Suspend_MEM | Suspend_Device;

    //LSU暂停期间从AXI4 得到的数据
    reg [63:0]Data_while_SuspendLSU;
    always @(posedge clock)begin
        if(reset)
            Data_while_SuspendLSU <= 64'b0;
        else if( Suspend_MEM & Data_cache_Data_ok)
            Data_while_SuspendLSU <= read_mem_data;
        else if( Suspend_Device && AXI_Device_ret_valid )
            Data_while_SuspendLSU <= read_mem_data;
    end

    //因为从存储器读出的数据总是8字节的,所以要根据地址以及位数获得不同的数据
    //至于这里为什么暂停时取得的数还能用Mem的控制字，因为即使暂停，Mem也会从Exe跟新，只不过无效，但这里不管无效还是有效
    wire [63:0]read_mem_data;
    assign rdata = ( Data_cache_Data_ok ) ? Dcache_ret_data : io_master_rdata;
    ysyx_22050854_MuxKey #(41,6,64) gen_read_mem_data (read_mem_data,{ MEMreg_aluout[2:0],MEMreg_memop },{
        6'b000000, {{56{rdata[7]}},rdata[7:0]},  //1 bytes signed extend  lb 000
        6'b000001, {{48{rdata[15]}},rdata[15:0]}, //2 bytes signed extend  lh
        6'b000010, {{32{rdata[31]}},rdata[31:0]}, //4 bytes signed extend  lw
        6'b000011, rdata,                 //8 bytes ld
        6'b000100, {56'b0,rdata[7:0]},    // 1 bytes unsigned extend lbu
        6'b000101, {48'b0,rdata[15:0]},   // 2 bytes unsigned extend lhu
        6'b000110, {32'b0,rdata[31:0]},   // 4 bytes unsigned extend lwu

        6'b001000, {{56{rdata[15]}},rdata[15:8]},  //1 bytes signed extend  lb 001
        6'b001001, {{48{rdata[23]}},rdata[23:8]}, //2 bytes signed extend  lh
        6'b001010, {{32{rdata[39]}},rdata[39:8]}, //4 bytes signed extend  lw
        6'b001100, {56'b0,rdata[15:8]},    // 1 bytes unsigned extend lbu
        6'b001101, {48'b0,rdata[23:8]},   // 2 bytes unsigned extend lhu
        6'b001110, {32'b0,rdata[39:8]},   // 4 bytes unsigned extend lwu

        6'b010000, {{56{rdata[23]}},rdata[23:16]},  //1 bytes signed extend  lb 010
        6'b010001, {{48{rdata[31]}},rdata[31:16]}, //2 bytes signed extend  lh
        6'b010010, {{32{rdata[47]}},rdata[47:16]}, //4 bytes signed extend  lw
        6'b010100, {56'b0,rdata[23:16]},    // 1 bytes unsigned extend lbu
        6'b010101, {48'b0,rdata[31:16]},   // 2 bytes unsigned extend lhu
        6'b010110, {32'b0,rdata[47:16]},   // 4 bytes unsigned extend lwu

        6'b011000, {{56{rdata[31]}},rdata[31:24]},  //1 bytes signed extend  lb 011
        6'b011001, {{48{rdata[39]}},rdata[39:24]}, //2 bytes signed extend  lh
        6'b011010, {{32{rdata[55]}},rdata[55:24]}, //4 bytes signed extend  lw
        6'b011100, {56'b0,rdata[31:24]},    // 1 bytes unsigned extend lbu
        6'b011101, {48'b0,rdata[39:24]},   // 2 bytes unsigned extend lhu
        6'b011110, {32'b0,rdata[55:24]},   // 4 bytes unsigned extend lwu

        6'b100000, {{56{rdata[39]}},rdata[39:32]},  //1 bytes signed extend  lb 100
        6'b100001, {{48{rdata[47]}},rdata[47:32]}, //2 bytes signed extend  lh
        6'b100010, {{32{rdata[63]}},rdata[63:32]}, //4 bytes signed extend  lw
        6'b100100, {56'b0,rdata[39:32]},   // 1 bytes unsigned extend lbu
        6'b100101, {48'b0,rdata[47:32]},   // 2 bytes unsigned extend lhu
        6'b100110, {32'b0,rdata[63:32]},   // 4 bytes unsigned extend lwu

        6'b101000, {{56{rdata[47]}},rdata[47:40]},  //1 bytes signed extend  lb 101
        6'b101001, {{48{rdata[55]}},rdata[55:40]}, //2 bytes signed extend  lh
        6'b101100, {56'b0,rdata[47:40]},    // 1 bytes unsigned extend lbu
        6'b101101, {48'b0,rdata[55:40]},   // 2 bytes unsigned extend lhu

        6'b110000, {{56{rdata[55]}},rdata[55:48]},  //1 bytes signed extend  lb 110
        6'b110001, {{48{rdata[63]}},rdata[63:48]},  //2 bytes signed extend  lh
        6'b110100, {56'b0,rdata[55:48]},    // 1 bytes unsigned extend lbu
        6'b110101, {48'b0,rdata[63:48]},   // 2 bytes unsigned extend lhu

        6'b111000, {{56{rdata[63]}},rdata[63:56]},  //1 bytes signed extend  lb 111
        6'b111100, {56'b0,rdata[63:56]}    // 1 bytes unsigned extend lbu
    });

    wire [63:0]Memdata_to_WBreg;
    assign Memdata_to_WBreg = Data_cache_Data_ok ? read_mem_data : Data_while_SuspendLSU;  //如果Dcache没有命中，那么需要暂停，此时读内存的数据就应该是之前记录的暂停期间读到的数

    //----------------------------------- WBreg -------------------------------------------------------------//
    reg WBreg_valid;
    wire WBreg_inst_enable;
    reg [31:0]WBreg_inst;
    wire WBreg_pc_enable;
    reg [31:0]WBreg_pc;
    wire WBreg_readmemdata_enable;
    reg [63:0]WBreg_readmemdata;
    wire WBreg_regwr_enable;
    reg WBreg_regwr;
    wire WBreg_rd_enable;
    reg [4:0]WBreg_rd;
    wire WBreg_aluout_enable;
    reg [63:0]WBreg_aluout;
    wire WBreg_memRd_enable;
    reg WBreg_memRd;
    wire WBreg_memtoreg_enable;
    reg WBreg_memtoreg;
    wire WBreg_CSRrd_enable;
    reg WBreg_CSRrd;
    wire WBreg_CSRrdata_enable;
    reg [63:0]WBreg_CSRrdata;
    wire WBreg_CLINT_enable;
    reg WBreg_read_CLINT;
    reg [63:0]WBreg_CLINT_value;

    assign WBreg_inst_enable = 1'b1;
    assign WBreg_pc_enable = 1'b1;
    assign WBreg_readmemdata_enable = 1'b1;
    assign WBreg_regwr_enable = 1'b1;
    assign WBreg_rd_enable = 1'b1;
    assign WBreg_memtoreg_enable = 1'b1;
    assign WBreg_aluout_enable = 1'b1;
    assign WBreg_memRd_enable = 1'b1;
    assign WBreg_CSRrd_enable = 1'b1;
    assign WBreg_CSRrdata_enable = 1'b1;
    assign WBreg_CLINT_enable = 1'b1;

    ysyx_22050854_Reg #(32,32'b0) WBreg_geninst (clock, reset, MEMreg_inst, WBreg_inst, WBreg_inst_enable);
    ysyx_22050854_Reg #(32,32'h0) WBreg_genPC (clock, reset, MEMreg_pc, WBreg_pc, WBreg_pc_enable);
    ysyx_22050854_Reg #(1,1'b0) WBreg_gen0 (clock, reset, MEMreg_valid, WBreg_valid, 1'b1);
    ysyx_22050854_Reg #(64,64'b0) WBreg_gen1 (clock, reset, Memdata_to_WBreg, WBreg_readmemdata, WBreg_readmemdata_enable);
    ysyx_22050854_Reg #(1,1'b0) WBreg_gen2 (clock, reset, MEMreg_regwr, WBreg_regwr, WBreg_regwr_enable);
    ysyx_22050854_Reg #(5,5'b0) WBreg_gen3 (clock, reset, MEMreg_rd, WBreg_rd, WBreg_rd_enable);
    ysyx_22050854_Reg #(64,64'b0) WBreg_gen4 (clock, reset, MEMreg_aluout, WBreg_aluout, WBreg_aluout_enable);
    ysyx_22050854_Reg #(1,1'b0) WBreg_gen5 (clock, reset, MEMreg_memtoreg, WBreg_memtoreg, WBreg_memtoreg_enable);
    ysyx_22050854_Reg #(1,1'b0) WBreg_gen6 (clock, reset, MEMreg_memrd, WBreg_memRd, WBreg_memRd_enable);
    ysyx_22050854_Reg #(1,1'b0) WBreg_gen7 (clock, reset, MEMreg_CSRrd, WBreg_CSRrd, WBreg_CSRrd_enable);
    ysyx_22050854_Reg #(64,64'b0) WBreg_gen8 (clock, reset, MEMreg_CSRrdata, WBreg_CSRrdata, WBreg_CSRrdata_enable);
    ysyx_22050854_Reg #(1,1'b0) WBreg_gen9 (clock, reset, MEMreg_read_CLINT, WBreg_read_CLINT, WBreg_CLINT_enable);
    ysyx_22050854_Reg #(64,64'b0) WBreg_gen10 (clock, reset, MEMreg_CLINT_value, WBreg_CLINT_value, WBreg_CLINT_enable);

    //写回寄存器的数据，总共有4 种可能 1.ALU计算值  2.LSU( memory/device )  3.从CSR读出的数据  4.mtime/mtimecmp
    wire [63:0]wr_reg_data;
    assign wr_reg_data =    WBreg_memtoreg ?    WBreg_readmemdata : 
                            WBreg_CSRrd ?       WBreg_CSRrdata :
                            WBreg_read_CLINT ?  WBreg_CLINT_value : 
                                                WBreg_aluout;

endmodule


module ysyx_22050854_IDU(
    input [31:0]instr,
    output [4:0]rs1,
    output [4:0]rs2,
    output [4:0]rd,
    output [2:0]ExtOP,
    output  RegWr,
    output  [2:0]Branch,
    output  No_branch,
    output  MemtoReg,
    output  MemWr,
    output  MemRd,
    output  [2:0]MemOP,
    output  ALUsrc1,
    output  [1:0]ALUsrc2,
    output  [3:0]ALUctr,
    output  [3:0]MULctr,
    output  [2:0]ALUext
); 
    wire [6:0]op;
    wire [2:0]func3;
    wire func7_5;
    wire func7_0;

    assign op = instr[6:0];
    assign rs1 = instr[19:15];
    assign rs2 = instr[24:20];
    assign rd = instr[11:7];
    assign func3 = instr[14:12];
    assign func7_0 = instr[25];
    assign func7_5 = instr[30];

    //generate ExtOP for generate imm
    ysyx_22050854_MuxKeyWithDefault #(9,5,3) ExtOP_gen (ExtOP,op[6:2],3'b111,{
        5'b00000,3'b000, //lb lh lw ld  I
        5'b01000,3'b010, //sb sh sw sd  S
        5'b00100,3'b000, //addi slti ... I 
        5'b11001,3'b000, //jarl I
        5'b00110,3'b000, //addiw I
        5'b11000,3'b011, //BEQ BNE ... B
        5'b01101,3'b001, //lui  U
        5'b00101,3'b001, //auipc U
        5'b11011,3'b100  //jal J
    });

    //generate RegWr 是否写回寄存器
    wire RegWr_t;
    ysyx_22050854_MuxKeyWithDefault #(13,7,1) RegWr_gen (RegWr_t,op[6:0],1'b0,{
        7'b0110111,1'b1,  //lui
        7'b0010111,1'b1,  //auipc
        7'b0010011,1'b1,  //addi
        7'b0110011,1'b1,  //add 
        7'b1101111,1'b1,  //jar
        7'b1100111,1'b1,  //jarl
        7'b1100011,1'b0,  //beq bne ....
        7'b0000011,1'b1,  //lb lh lw ld lbu lhu lwu
        7'b0100011,1'b0,  //sb sh sw sd
        7'b0011011,1'b1,  //ADDIW
        7'b0111011,1'b1,  //ADDW
        7'b1110011,1'b1,   //ecall csrw csrr, but mret ebreak should not write register
        7'b0001111,1'b0   //fence.i 
    });
    assign RegWr = (instr == 32'h30200073) ? 0 : ( (instr == 32'h100073) ? 0 : RegWr_t);  //mret and ebreak not write

    //generate MemtoReg 写回寄存器的内容来自哪里 0-alu_out 1-mem_data
    assign MemtoReg = op == 7'b0000011 ? 1'b1 : 1'b0;

    //generate Branch 
    ysyx_22050854_MuxKey #(22,8,3) Branch_gen (Branch,{op[6:2],func3},{
        8'b11011000,3'b001, //jal
        8'b11011001,3'b001, //jal
        8'b11011010,3'b001, //jal
        8'b11011011,3'b001, //jal
        8'b11011100,3'b001, //jal
        8'b11011101,3'b001, //jal
        8'b11011110,3'b001, //jal
        8'b11011111,3'b001, //jal
        8'b11001000,3'b010, //jalr
        8'b11001001,3'b010, //jalr
        8'b11001010,3'b010, //jalr
        8'b11001011,3'b010, //jalr
        8'b11001100,3'b010, //jalr
        8'b11001101,3'b010, //jalr
        8'b11001110,3'b010, //jalr
        8'b11001111,3'b010, //jalr
        8'b11000000,3'b100, //beq
        8'b11000001,3'b101, //bneq
        8'b11000100,3'b110, //blt
        8'b11000101,3'b111, //bge
        8'b11000110,3'b110, //bltu
        8'b11000111,3'b111  //bgeu
    });

    //generate No_branch pc + 4
    ysyx_22050854_MuxKeyWithDefault #(11,7,1) No_branch_gen (No_branch,op,1'b0,{
        7'b0110111,1'b1,  //lui
        7'b0010111,1'b1,  //auipc
        7'b0000011,1'b1,  //ld
        7'b0100011,1'b1,  //sd
        7'b0010011,1'b1,  //addi
        7'b0110011,1'b1,  //add
        7'b1110011,1'b1,  //csrrw csrr but not ecall mret
        7'b0011011,1'b1,  //slliw
        7'b0111011,1'b1,  //sllw
        7'b0111011,1'b1,   //mulw
        7'b0001111,1'b1   //fence.I
    });

    //generate MemWr 是否写存储器
    assign MemWr = op == 7'b0100011 ? 1'b1 : 1'b0;

    //generate MemRd 是否读存储器
    assign MemRd = op == 7'b0000011 ? 1'b1 : 1'b0;

    //generate MemOP 如何写存储器
    ysyx_22050854_MuxKeyWithDefault #(11,8,3) MemOP_gen (MemOP,{op[6:2],func3},3'b111,{
        8'b00000000,3'b000,  //lb
        8'b00000001,3'b001,  //lh
        8'b00000010,3'b010,  //lw
        8'b00000011,3'b011,  //ld
        8'b00000100,3'b100,  //lbu
        8'b00000101,3'b101,  //lhu
        8'b00000110,3'b110,  //lwu
        8'b01000000,3'b000,  //sb
        8'b01000001,3'b001,  //sh
        8'b01000010,3'b010,  //sw
        8'b01000011,3'b011   //sd
    });

    //generate ALUsrc1    0---rs1  1---pc
   ysyx_22050854_MuxKeyWithDefault #(11,5,1) ALUsrc1_gen (ALUsrc1,op[6:2],1'b1,{
        5'b01101,1'b0, //lui (copy,don't need alu_src1)
        5'b00101,1'b1, //auipc
        5'b00100,1'b0, //addiq
        5'b01100,1'b0, //add mul
        5'b11011,1'b1, //jal
        5'b11001,1'b1, //jalr
        5'b11000,1'b0, //beq
        5'b00000,1'b0, //load
        5'b01000,1'b0, //store
        5'b00110,1'b0, //ADDIW sraiw
        5'b01110,1'b0  //ADDW MULW    
    });

    //generate ALUsrc2   00---rs2   01---imm  10---4
   ysyx_22050854_MuxKeyWithDefault #(11,5,2)  ALUsrc2_gen (ALUsrc2,op[6:2],2'b00,{
        5'b01101,2'b01, //lui
        5'b00101,2'b01, //auipc
        5'b00100,2'b01, //addi
        5'b01100,2'b00, //add mul
        5'b11011,2'b10, //jal
        5'b11001,2'b10, //jalr
        5'b11000,2'b00, //beq
        5'b00000,2'b01, //load
        5'b01000,2'b01, //store
        5'b00110,2'b01, //ADDIW
        5'b01110,2'b00 //ADDW MULW    
    });

    //generate ALUext for rv64I
    ysyx_22050854_MuxKey #(35,10,3) ALUext_gen (ALUext,{ op[6:2],func3,func7_5,func7_0 },{
        10'b0011000000,3'b010,  // + addiw
        10'b0011000010,3'b010,  // + addiw
        10'b0011000001,3'b010,  // + addiw
        10'b0011000011,3'b010,  // + addiw
        10'b0111000000,3'b010,  // + addw
        10'b0111000010,3'b010,  // - subw
        10'b0011000100,3'b011,  // <<  slliw
        10'b0011010100,3'b011,  // >>  srliw
        10'b0011010110,3'b011,  // >>> sraiw
        10'b0111000100,3'b011,  // <<  sllw
        10'b0111010100,3'b011,  // >>  srlw
        10'b0111010110,3'b011,  // >>> sraw
        10'b0010001000,3'b001,  //  slti compare
        10'b0010001010,3'b001,  //  slti compare
        10'b0010001001,3'b001,  //  slti compare
        10'b0010001011,3'b001,  //  slti compare
        10'b0010001100,3'b001,  //  sltiu compare
        10'b0010001110,3'b001,  //  sltiu compare
        10'b0010001101,3'b001,  //  sltiu compare
        10'b0010001111,3'b001,  //  sltiu compare
        10'b0110001000,3'b001,  //  slt compare
        10'b0110001100,3'b001,  //  sltu compare
        10'b0110000001,3'b100,  //mul
        10'b0110000101,3'b101,  //mulh
        10'b0110001001,3'b101,  //mulhsu
        10'b0110001101,3'b101,  //mulhu
        10'b0110010001,3'b110,  //div
        10'b0110010101,3'b110,  //divu
        10'b0110011001,3'b111,  //rem
        10'b0110011101,3'b111,  //remu
        10'b0111000001,3'b100,  //mulw
        10'b0111010001,3'b110,  //divw
        10'b0111010101,3'b110,  //divuw
        10'b0111011001,3'b111,  //remw
        10'b0111011101,3'b111   //remuw
    });

    //generate ALUctr according to op funct3,funct7
    ysyx_22050854_MuxKeyWithDefault #(119,9,4) ALUctr_gen ( ALUctr,{op[6:2],func3,func7_5 },4'b1111,{
        9'b011010000,4'b0011,  // lui copy
        9'b011010001,4'b0011,  // lui copy
        9'b011010010,4'b0011,  // lui copy
        9'b011010011,4'b0011,  // lui copy
        9'b011010100,4'b0011,  // lui copy
        9'b011010101,4'b0011,  // lui copy
        9'b011010110,4'b0011,  // lui copy
        9'b011010111,4'b0011,  // lui copy
        9'b011011000,4'b0011,  // lui copy
        9'b011011001,4'b0011,  // lui copy
        9'b011011010,4'b0011,  // lui copy
        9'b011011011,4'b0011,  // lui copy
        9'b011011100,4'b0011,  // lui copy
        9'b011011101,4'b0011,  // lui copy
        9'b011011110,4'b0011,  // lui copy
        9'b011011111,4'b0011,  // lui copy
        9'b001010000,4'b0000,  // auipc +
        9'b001010001,4'b0000,  // auipc +
        9'b001010010,4'b0000,  // auipc +
        9'b001010011,4'b0000,  // auipc +
        9'b001010100,4'b0000,  // auipc +
        9'b001010101,4'b0000,  // auipc +
        9'b001010110,4'b0000,  // auipc +
        9'b001010111,4'b0000,  // auipc +
        9'b001011000,4'b0000,  // auipc +
        9'b001011001,4'b0000,  // auipc +
        9'b001011010,4'b0000,  // auipc +
        9'b001011011,4'b0000,  // auipc +
        9'b001011100,4'b0000,  // auipc +
        9'b001011101,4'b0000,  // auipc +
        9'b001011110,4'b0000,  // auipc +
        9'b001011111,4'b0000,  // auipc +
        9'b001000000,4'b0000,  // + addi
        9'b001000001,4'b0000,  //   addi  
        9'b001000100,4'b0010,  //  slti compare
        9'b001000101,4'b0010,  //  slti compare
        9'b001000110,4'b1010,  //  sltiu compare
        9'b001000111,4'b1010,  //  sltiu compare
        9'b001001000,4'b0100,  // ^  xori
        9'b001001001,4'b0100,  // ^  xori
        9'b001001100,4'b0110,  // |  ori
        9'b001001101,4'b0110,  // |  ori
        9'b001001110,4'b0111,  // & andi
        9'b001001111,4'b0111,  // & andi
        9'b001000010,4'b0001,  // << slli 
        9'b001001010,4'b0101,  // >> srli
        9'b001001011,4'b1101,  // >>> srai
        9'b001100010,4'b0001,  // <<  slliw
        9'b001101010,4'b0101,  // >>  srliw
        9'b001101011,4'b1101,  // >>> sraiw
        9'b011100010,4'b0001,  // << sllw
        9'b011101010,4'b0101,  // >> srlw
        9'b011101011,4'b1101,  // >>> sraw
        9'b011100000,4'b0000,  // + addw
        9'b011100001,4'b1000,  // - subw
        9'b001100000,4'b0000,  // + addiw
        9'b001100001,4'b0000,  // + addiw  
        9'b011000000,4'b0000,  // + add
        9'b011000001,4'b1000,  // - sub
        9'b011000010,4'b0001,  // << sll
        9'b011000100,4'b0010,  // slt compare
        9'b011000110,4'b1010,  // sltu compare
        9'b011001000,4'b0100,  // ^ xor
        9'b011001010,4'b0101,  // >> srl
        9'b011001011,4'b1101,  // >>> sra
        9'b011001100,4'b0110,  // | or
        9'b011001110,4'b0111,  // & and
        9'b110110000,4'b0000,  // pc + 4 jal
        9'b110110001,4'b0000,  // pc + 4 jal
        9'b110110010,4'b0000,  // pc + 4 jal
        9'b110110011,4'b0000,  // pc + 4 jal
        9'b110110100,4'b0000,  // pc + 4 jal
        9'b110110101,4'b0000,  // pc + 4 jal
        9'b110110110,4'b0000,  // pc + 4 jal
        9'b110110111,4'b0000,  // pc + 4 jal
        9'b110111000,4'b0000,  // pc + 4 jal
        9'b110111001,4'b0000,  // pc + 4 jal
        9'b110111010,4'b0000,  // pc + 4 jal
        9'b110111011,4'b0000,  // pc + 4 jal
        9'b110111100,4'b0000,  // pc + 4 jal
        9'b110111101,4'b0000,  // pc + 4 jal
        9'b110111110,4'b0000,  // pc + 4 jal
        9'b110111111,4'b0000,  // pc + 4 jal
        9'b110010000,4'b0000,  // pc + 4 jalr
        9'b110010001,4'b0000,  // pc + 4 jalr 
        9'b110000000,4'b0010,  // signed compare beq
        9'b110000001,4'b0010,  // signed compare beq
        9'b110000010,4'b0010,  // signed compare bne
        9'b110000011,4'b0010,  // signed compare bne
        9'b110001000,4'b0010,  // signed compare blt
        9'b110001001,4'b0010,  // signed compare blt
        9'b110001010,4'b0010,  // signed compare bge
        9'b110001011,4'b0010,  // signed compare bge
        9'b110001100,4'b1010,  // unsigned compare bltu
        9'b110001101,4'b1010,  // unsigned compare bltu
        9'b110001110,4'b1010,  // unsigned compare bgeu
        9'b110001111,4'b1010,  // unsigned compare bgeu
        9'b000000000,4'b0000,  // + lb  rs1 + imm
        9'b000000001,4'b0000,  // + lb
        9'b000000010,4'b0000,  // + lh
        9'b000000011,4'b0000,  // + lh
        9'b000000100,4'b0000,  // + lw
        9'b000000101,4'b0000,  // + lw
        9'b000000110,4'b0000,  // + ld
        9'b000000111,4'b0000,  // + ld
        9'b000001000,4'b0000,  // + lbu
        9'b000001001,4'b0000,  // + lbu
        9'b000001010,4'b0000,  // + lhu
        9'b000001011,4'b0000,  // + lhu
        9'b000001100,4'b0000,  // + lwu
        9'b000001101,4'b0000,  // + lwu
        9'b010000000,4'b0000,  // + sb
        9'b010000001,4'b0000,  // + sb
        9'b010000010,4'b0000,  // + sh
        9'b010000011,4'b0000,  // + sh
        9'b010000100,4'b0000,  // + sw
        9'b010000101,4'b0000,  // + sw
        9'b010000110,4'b0000,  // + sd
        9'b010000111,4'b0000  // + sd
    });

    ysyx_22050854_MuxKeyWithDefault #(13,9,4)  gen_64M_ctr ( MULctr,{op[6:2],func3,func7_0 },4'b0000,{
        9'b011000001,4'b1001,  //mul
        9'b011000011,4'b0001,  //mulh
        9'b011000101,4'b0010,  //mulhsu
        9'b011000111,4'b0011,  //mulhu
        9'b011001001,4'b0100,  //div
        9'b011001011,4'b0101,  //divu
        9'b011001101,4'b0110,  //rem
        9'b011001111,4'b0111,  //remu
        9'b011100001,4'b1000,  //mulw
        9'b011101001,4'b1100,  //divw
        9'b011101011,4'b1101,  //divuw
        9'b011101101,4'b1110,  //remw
        9'b011101111,4'b1111   //remuw
    });

endmodule


module ysyx_22050854_imm_gen(
    input [31:0]instr,
    input [2:0]ExtOP,
    output reg[63:0]imm
);
    wire [63:0]immI,immU,immS,immB,immJ,immCoushu;
    assign immI = {{52{instr[31]}},instr[31:20]};
    assign immU = {{32{instr[31]}},instr[31:12],12'b0};
    assign immS = {{52{instr[31]}},instr[31:25],instr[11:7]};
    assign immB = {{52{instr[31]}},instr[7],instr[30:25],instr[11:8],1'b0};
    assign immJ = {{44{instr[31]}},instr[19:12],instr[20],instr[30:21],1'b0};
    assign immCoushu = { 57'b0,instr[6:0] };

    ysyx_22050854_MuxKeyWithDefault #(6,3,64) imm_gen (imm,ExtOP,64'b0,{
        3'b000,immI,
        3'b001,immU,
        3'b010,immS,
        3'b011,immB,
        3'b100,immJ,
        3'b101,immCoushu
    });

endmodule


module ysyx_22050854_src_gen(
    input ALUsrc1,
    input [1:0]ALUsrc2,
    input [31:0]pc,
    input [63:0]imm,
    input [63:0]src1,
    input [63:0]src2,
    output [63:0]alu_src1,
    output [63:0]alu_src2
);
    ysyx_22050854_MuxKeyWithDefault #(2,1,64) src1_gen(alu_src1,ALUsrc1,64'd0,{
        1'd0,src1,
        1'd1,{{32'b0},pc}
    });

    ysyx_22050854_MuxKeyWithDefault #(3,2,64) src2_gen(alu_src2,ALUsrc2,64'd0,{
        2'b00,src2,
        2'b01,imm,
        2'b10,64'd4
    });

endmodule


module ysyx_22050854_pc(
    input reset,
    input clock,
    input IDreg_valid,
    input Data_Conflict,
    input suspend,
    input [2:0]Branch,
    input No_branch,
    input is_csr_pc,
    input [31:0]csr_pc,
    input unsigned_compare,
    input [63:0]alu_src1,
    input [63:0]alu_src2,
    input [31:0]src1,
    input [31:0]imm,
    output jump,
    output reg[31:0]next_pc
);
    wire zero;
    wire less;
    assign zero = ( ( $signed(alu_src1) ) - ( $signed(alu_src2) ) == 0 ) ? 1'b1 : 1'b0;
    assign less = unsigned_compare ? ( alu_src1 < alu_src2 ? 1'b1 : 1'b0 ) : ( ($signed(alu_src1)) < ($signed(alu_src2)) ? 1'b1 : 1'b0 );

    wire [2:0]PCsrc;
    wire [31:0]PCsrc1,PCsrc2;
    //default----00---pc + 4 但是这样的话 每个上升沿都会使pc+4
    //于是 我想再译出一位控制信号，当这个信号为1 时才有效
    //PCsrc[2]用于指示这是一个跳转指令,并且进行了跳转
    ysyx_22050854_MuxKeyWithDefault #(20,5,3) gen_PC3src (PCsrc,{Branch,zero,less},3'b000,{
        5'b00100,3'b110, //jal
        5'b00101,3'b110, //jal
        5'b00110,3'b110, //jal
        5'b00111,3'b110, //jal
        5'b01000,3'b111, //jalr
        5'b01001,3'b111, //jalr
        5'b01010,3'b111, //jalr
        5'b01011,3'b111, //jalr
        5'b10010,3'b110, //equal
        5'b10011,3'b110, //equal          //beq 但是不相等的默认为00 ,就是不跳转
        5'b10100,3'b110, //not equal
        5'b10101,3'b110, //not equal
        5'b11001,3'b110, //less           //blt bltu
        5'b11011,3'b110, //less
        5'b11000,3'b000, //not less 
        5'b11010,3'b000, //not less
        5'b11100,3'b110, //greater bgeu less = 0   //bge bgeu
        5'b11110,3'b110, //greater bgeu
        5'b11101,3'b000, //not greater bgeu less = 1
        5'b11111,3'b000  //not greater bgeu
    });
    //如果存在数据冲突且需要阻塞，那这个确定跳转的计算并不准确
    //ecall/mret的next_pc是从CSR中取出的，我的逻辑是译码过后就写CSR，CSR寄存器按理说不会出现阻塞的情况
    assign jump = ( ( PCsrc[2] & (~Data_Conflict) & ~suspend ) | is_csr_pc ) & IDreg_valid;

    //00---pc + 4  10---pc + imm   
    ysyx_22050854_MuxKey #(2,1,32) gen_PCsrc1 (PCsrc1,PCsrc[1],{
        1'b0,32'd4,
        1'b1,imm
    });

    ysyx_22050854_MuxKey #(2,1,32) gen_PCsrc2 (PCsrc2,PCsrc[0],{
        1'b0,pc,
        1'b1,src1
    });

    always@(*)begin
        if(reset)                         //复位
            next_pc = `ysyx_22050854_START_PC;
        else if( (is_csr_pc == 1'b1) )     //ecall mret
            next_pc = csr_pc;
        else if( (Branch != 3'b000) )       //跳转指令
            next_pc = PCsrc1 + PCsrc2;
        else if( (No_branch == 1'b1) )      //非跳转指令 其实也包括ecall mret 但这里我利用先判断前者
            next_pc = pc + 32'd4;
        else                           //未定义指令
            next_pc = pc + 32'd0;
    end

    reg [31:0]pc;
    always@(posedge clock)begin
        if(reset)
            pc <= `ysyx_22050854_START_PC;
        else if(~Data_Conflict & ~suspend & IDreg_valid) //如果遇到了数据阻塞或者暂停，PC保持不变
            pc <= next_pc;
    end

endmodule


module ysyx_22050854_RegisterFile  (
  input clock,
  input [63:0] wdata,
  input reg[4:0] waddr,
  input wen,
  input [4:0] raddra,
  input [4:0] raddrb,
  output reg[63:0] rdata1,
  output reg[63:0] rdata2
);
  reg [63:0] rf [31:0];
  always @(posedge clock) begin
    if(waddr==5'd0)
      rf[waddr] <= 64'd0;
    else begin
      if(wen) begin
        rf[waddr] <= wdata;
      end
    end
  end
  
  always @(*) begin
    rf[5'b0] = 64'b0;
  end

  always@(*)begin
    if(raddra == 5'd0)
      rdata1 = 64'd0;
    else
      rdata1 = rf[raddra];
  end

  always@(*)begin
    if(raddrb == 5'd0)
      rdata2 = 64'd0;
    else
      rdata2 = rf[raddrb];
  end

endmodule


module ysyx_22050854_CSRegister  (
  input clock,
  input reset,
  input [63:0] wdata1,
  input [63:0] wdata2,
  input [11:0] waddr1,
  input [11:0] waddr2,
  input mret,
  input ecall,
  input wen,
  input wen2,
  input ren,
  input [11:0] raddr,
  input mtime_bigger_mtimecmp,
  output [63:0] rdata,
  output timer_interrupt,
  input handle_timer_intr
);
  reg [63:0] csrf [9:0]; //define 10 control status register
  wire [3:0]csr_addr1;
  wire [3:0]csr_addr2;
  wire [3:0]csr_raddr;

  ysyx_22050854_MuxKeyWithDefault #(8,12,4) gen_csraddr1 (csr_addr1,waddr1,4'd10,{
    12'h305,4'd0,  //mtvec
    12'h341,4'd1,  //mepc
    12'h300,4'd2,  //mstatus
    12'h342,4'd3,  //mcause
    12'h304,4'd4,  //mie
    12'h344,4'd5,  //mip
    12'hf14,4'd6,  //mhartid
    12'h340,4'd7  //mscratch
  });

  ysyx_22050854_MuxKeyWithDefault #(8,12,4) gen_csraddr2 (csr_addr2,waddr2,4'd10,{
    12'h305,4'd0,  //mtvec
    12'h341,4'd1,  //mepc
    12'h300,4'd2,  //mstatus
    12'h342,4'd3,  //mcause
    12'h304,4'd4,  //mie
    12'h344,4'd5,  //mip
    12'hf14,4'd6,  //mhartid
    12'h340,4'd7   //mscratch
  });

  ysyx_22050854_MuxKeyWithDefault #(8,12,4) gen_csr_raddr (csr_raddr,raddr,4'd10,{
    12'h305,4'd0,  //mtvec
    12'h341,4'd1,  //mepc
    12'h300,4'd2,  //mstatus
    12'h342,4'd3,  //mcause
    12'h304,4'd4,  //mie
    12'h344,4'd5,  //mip
    12'hf14,4'd6,  //mhartid read only
    12'h340,4'd7  //mscratch
  });

  assign rdata = ren ? csrf[csr_raddr] : 64'd0;  //read csr

  always @(posedge clock) begin        //write csr1
    if(reset)
        csrf[6] <= 64'b0;  //mhartid
    else if( wen && ( csr_addr1 == 4'd6) )
        csrf[6] <= 64'b0;           //mhartid read only
    else if( wen && ( csr_addr1 != 4'd6) )
        csrf[csr_addr1] <= wdata1;
  end

  always @(posedge clock) begin        //write csr2
    if(reset)
        csrf[6] <= 64'b0;  //mhartid
    else if( wen2 && ( csr_addr2 == 4'd6) )
        csrf[6] <= 64'b0;           //mhartid read only
    else if( wen2 && ( csr_addr2 != 4'd6) )
        csrf[csr_addr2] <= wdata2;
  end

  //中断逻辑 根据条件判断是否产生计时器中断
  always @(posedge clock) begin
    if(reset)begin
      csrf[5] <= 64'd0;
    end
    else if( handle_timer_intr ) //if handle, reset
      csrf[5][7] <= 1'b0;
    else if( ( csrf[2][3] & csrf[4][7] ) & mtime_bigger_mtimecmp )begin
      csrf[5][7] <= 1'b1;         //mip->mtip set 1
    end
  end
  assign timer_interrupt = csrf[5][7];

  //mstatus->MIE[3] MPIE[7]
  always @(posedge clock ) begin
    if(reset)
      csrf[2][7] <= 1'b0;
    else if(( csrf[2][3] & csrf[4][7] ) & mtime_bigger_mtimecmp ) begin  //time interrupt
      csrf[2][7] <= csrf[2][3];
      csrf[2][3] <= 1'b0;
    end
    else if( ecall ) begin     //environment call
      csrf[2][7] <= csrf[2][3];
      csrf[2][3] <= 1'b0;
    end
    else if( mret )begin    //return 
      csrf[2][7] <= 1'b1;
      csrf[2][3] <= csrf[2][7];
    end

  end

endmodule

`define ysyx_22050854_USE_MULTIPLIER_1

module ysyx_22050854_alu(
    input clock,
    input reset,
    input EXEreg_valid,
    input [3:0]ALUctr,
    input [3:0]MULctr,
    input [2:0]ALUext,
    input [63:0]src1,
    input [63:0]src2,
    output alu_busy,
    output [63:0]alu_out 
);
    wire [31:0]alu_temp_32;
    ysyx_22050854_MuxKey #(3,4,32) gen_alu_temp_32 (alu_temp_32, ALUctr, {
        4'b0001,src1[31:0] << src2[4:0], //slliw sllw
        4'b0101,src1[31:0] >> src2[4:0], //srliw srlw
        4'b1101,($signed(src1[31:0])) >>> src2[4:0] //sraiw sraw
    });

    wire [63:0]alu_temp;
    ysyx_22050854_MuxKeyWithDefault #(11,4,64) gen_alu_temp (alu_temp,ALUctr,64'd0,{
        4'b0000,src1 + src2,
        4'b0001,src1 << src2[5:0], //sll,slli
        4'b0010,($signed(src1)) - ($signed(src2)),  //slt beq bne blt bge 
        4'b0011,64'd0 + src2,  //lui copy
        4'b0100,src1 ^ src2,
        4'b0101,src1 >> src2[5:0],  //srl srli
        4'b0110,src1 | src2,
        4'b0111,src1 & src2,
        4'b1000,src1 - src2,  //sub
        4'b1101,($signed(src1)) >>> src2[5:0], //srai
        4'b1010,src1 - src2  //sltu bltu bgeu sltiu
    });

    wire less;
    assign less = ALUctr == 4'b0010 ? ( ($signed(src1)) < ($signed(src2)) ? 1 : 0) : (src1 < src2 ? 1 : 0);

    wire op_mul_t;
    wire op_mul;
    wire mul_valid;
    wire mulw;
    wire [1:0]mul_signed;
    wire mul_doing;
    wire mul_ready;
    wire mul_out_valid;
    wire [63:0]mul_result_hi;
    wire [63:0]mul_result_lo;
    ysyx_22050854_MuxKey #(5,4,1) gen_op_mul (op_mul_t,MULctr,{
        4'b1001,1'b1, //mul
        4'b0001,1'b1,
        4'b0010,1'b1,
        4'b0011,1'b1,
        4'b1000,1'b1
    });
    assign op_mul = op_mul_t & EXEreg_valid;
    assign mul_valid = op_mul & !mul_doing & !mul_out_valid & mul_ready;
    assign mulw = ( MULctr == 4'b1000 ) ? 1'b1 : 1'b0;
    ysyx_22050854_MuxKey #(5,4,2) gen_mul_signed (mul_signed, MULctr, {
        4'b1001,2'b11, //mul
        4'b0001,2'b11,
        4'b0010,2'b10,
        4'b0011,2'b00,
        4'b1000,2'b11
    });

    `ifdef ysyx_22050854_USE_MULTIPLIER_1
    ysyx_22050854_multiplier_v1 shiftadd_multiplier (
        .clock(clock),
        .reset(reset),
        .mul_valid(mul_valid), //1:input data valid
        .mulw(mulw),      //1:32 bit multi
        .mul_signed(mul_signed),  //2’b11（signed x signed）；2’b10（signed x unsigned）；2’b00（unsigned x unsigned）；
        .multiplicand(src1), //被乘数
        .multiplier(src2),   //乘数
        .mul_doing(mul_doing),
        .mul_ready(mul_ready),         //为高表示乘法器准备好，表示可以输入数据
        .out_valid(mul_out_valid),         //为高表示乘法器输出的结果有效
        .result_hi(mul_result_hi),
        .result_lo(mul_result_lo)
    );
    `else
    ysyx_22050854_multiplier_v2 use_multiplier_2 (
        .clock(clock),
        .reset(reset),
        .mul_valid(mul_valid), //1:input data valid
        .mulw(mulw),      //1:32 bit multi
        .mul_signed(mul_signed),  //2’b11（signed x signed）；2’b10（signed x unsigned）；2’b00（unsigned x unsigned）；
        .multiplicand(src1), //被乘数
        .multiplier(src2),   //乘数
        .mul_doing(mul_doing),
        .mul_ready(mul_ready),             //为高表示乘法器准备好，表示可以输入数据
        .out_valid(mul_out_valid),         //为高表示乘法器输出的结果有效
        .result_hi(mul_result_hi),
        .result_lo(mul_result_lo)
    );
    `endif

    wire op_div;
    wire div_valid;
    wire divw;
    wire div_signed;
    wire div_ready;
    wire div_out_valid;
    wire div_doing;
    wire [63:0]div_out_quoitient;
    wire [63:0]div_out_remainder;
    wire div_t;
    ysyx_22050854_MuxKey #(8,4,1) gen_op_div (div_t,MULctr,{
        4'b0100,1'b1,
        4'b0101,1'b1,
        4'b0110,1'b1,
        4'b0111,1'b1,
        4'b1100,1'b1,
        4'b1101,1'b1,
        4'b1110,1'b1,
        4'b1111,1'b1
    });
    assign op_div = div_t & EXEreg_valid;
    assign div_valid = op_div & !div_doing & !div_out_valid & div_ready; //只持续两个周期
    assign divw = MULctr[3]; //由MULctr第4位决定
    assign div_signed = ~MULctr[0];
    ysyx_22050854_divider_1 shift_divider_1 (
        .clock(clock),
        .reset(reset),
        .dividend(src1),  //被除数
        .divisor(src2),   //除数
        .div_valid(div_valid),       //为高表示输入的数据有效，如果没有新的除法输入，在除法被接受的下一个周期要置低
        .divw(divw),            //为高表示输入是32位除法
        .div_signed(div_signed),      //为高表示是有符号除法
        .div_doing(div_doing),
        .div_ready(div_ready),      //为高表示除法器空闲，可以输入数据
        .out_valid(div_out_valid),      //为高表示除法器输出结果有效
        .quotient(div_out_quoitient), //商
        .remainder(div_out_remainder) //余数
    );

    assign alu_busy = ( op_mul && !mul_out_valid ) | ( op_div && !div_out_valid );

    ysyx_22050854_MuxKey #(8,3,64) gen_alu_out (alu_out, ALUext, {
        3'b000,alu_temp,
        3'b001,{63'd0,less},
        3'b010,{{32{alu_temp[31]}},alu_temp[31:0]}, //先截断，然后按符号位扩展 addw addiw subw
        3'b011,{{32{alu_temp_32[31]}},alu_temp_32},  //按符号位扩展 slliw sllw sraiw sraw
        3'b100,mul_result_lo, //mul mulw
        3'b101,mul_result_hi,  //mulh
        3'b110,div_out_quoitient, //div divu divw divwu
        3'b111,div_out_remainder    //rem remu remwu remw
    });

endmodule


module ysyx_22050854_multiplier_v1(
    input clock,
    input reset,
    input mul_valid, //1:input data valid
    input mulw,      //1:32 bit multi
    input [1:0]mul_signed,  //2’b11（signed x signed）；2’b10（signed x unsigned）；2’b00（unsigned x unsigned）；
    input [63:0]multiplicand, //被乘数
    input [63:0]multiplier,   //乘数
    output mul_doing,
    output mul_ready,         //为高表示乘法器准备好，表示可以输入数据
    output out_valid,         //为高表示乘法器输出的结果有效
    output [63:0]result_hi,
    output [63:0]result_lo
);

// 32 * 32
reg [63:0]multiplicand_temp;
reg [63:0]multiplier_temp;
reg mul32ss_go;  //32 x 32 符号相乘准备好标志  直到运算结束才置0
reg mul_ready_t;
always @(posedge clock)begin
    if(reset)begin
        mul32ss_go <= 1'b0;
        mul_ready_t <= 1'b1;
        multiplicand_temp <= 64'b0;
        multiplier_temp <= 64'b0;
    end
    else if(mul_valid & mulw & (mul_signed == 2'b11) & mul_ready_t)begin // 32位 有符号乘法
        multiplicand_temp <= { {32{multiplicand[31]}} , multiplicand[31:0] };
        multiplier_temp <= multiplier;
        mul32ss_go <= 1'b1;
        mul_ready_t <= 1'b0;
    end
    else if ( ((mul_count >= 7'd31) | ( multiplier_temp == 64'b0)) & mul32ss_go )begin  //当乘数为0或计数32次后 32 x 32运算结束 
        multiplicand_temp <= 64'b0;
        multiplier_temp <= 64'b0;
        mul32ss_go <= 1'b0;
        mul_ready_t <= 1'b1;
    end
end

reg [6:0]mul_count; //用于给移位计数 需要移位32次 采用6位数 大一位
always @(posedge clock)begin
    if(reset)begin
        mul_count <= 7'd0;
    end
    else if( mul32ss_go & ((mul_count >= 7'd31) | ( multiplier_temp == 64'b0)) )
        mul_count <= 7'd0;
    else if( mul64_go & ( (mul_count >= 7'd63) |  multiplier_temp == 64'b0) )
        mul_count <= 7'd0;
    else if( mul32ss_go | mul64_go )begin //计数的条件是乘法控制字有效
        mul_count <= mul_count + 7'b1;
    end
    else 
        mul_count <= 7'd0;
end

reg [63:0]mul32_result_temp; //存放32 x 32 位的乘积
//启动 32 x 32 位无符号数的运算
always @(posedge clock)begin
    if(reset)begin
        mul32_result_temp <= 64'b0;
    end
    else if(mul32ss_go & (mul_count < 7'd32))begin
        if( multiplier_temp[0] & ( mul_count < 7'd31 ) )begin //如果乘数的最低位为1
            mul32_result_temp <= mul32_result_temp + multiplicand_temp;
        end
        else if(multiplier_temp[0] & ( mul_count == 7'd31 ))begin //对于补码乘法，最后一次被累加的乘积需要使用补码减法来操作
            mul32_result_temp <= mul32_result_temp - multiplicand_temp;
        end
        multiplicand_temp <= ( multiplicand_temp << 1 ); //被乘数左移一位
        multiplier_temp <= ( multiplier_temp >> 1 ); //乘数右移一位
    end
    else begin
        mul32_result_temp <= 64'b0;
    end
end

reg mul32_over;
always @(posedge clock)begin
    if(reset)
        mul32_over <= 1'b0;
    else if( mul32ss_go & ((mul_count >= 7'd31) | ( multiplier_temp == 64'b0)) )
        mul32_over <= 1'b1;
    else
        mul32_over <= 1'b0;
end

//64 * 64 
reg [127:0]multiplicand_temp_128; //64位运算的被乘数寄存器
reg mul64_go;
reg mul64_multiplier_sign;
always @(posedge clock)begin
    if(reset)begin
        multiplicand_temp_128 <= 128'b0;
        mul64_go <= 1'b0;
        mul64_multiplier_sign <= 1'b0;
    end
    else if( mul_valid & (~mulw) &  mul_ready_t)begin
        mul_ready_t <= 1'b0;
        mul64_go <= 1'b1;
        mul64_multiplier_sign <= mul_signed[0]; //乘数是否有符号取决于mul_signed[0]
        multiplier_temp <= multiplier;
        if( mul_signed[1] )                   //如果被乘数是有符号相乘
            multiplicand_temp_128 <= { {64{multiplicand[63]}} , multiplicand };
        else
            multiplicand_temp_128 <= { 64'b0,multiplicand };
    end
    else if( ( (mul_count >= 7'd63) |  multiplier_temp == 64'b0) & mul64_go) begin  // 64 x 64 运算完成
        mul64_go <= 1'b0;
        mul_ready_t <= 1'b1;
        mul64_multiplier_sign <= 1'b0;
        multiplier_temp <= 64'd0;
        multiplicand_temp_128 <= 128'd0;
    end
end

reg [127:0]mul64_result_temp;
always @(posedge clock)begin
    if(reset)
        mul64_result_temp <= 128'b0;
    else if( mul64_go & ( mul_count < 7'd64) )begin
        if( multiplier_temp[0] & ( mul_count == 7'd63 ) & mul64_multiplier_sign )begin //对于补码乘法，最后一次被累加的乘积需要使用补码减法来操作
            mul64_result_temp <= mul64_result_temp - multiplicand_temp_128;
        end
        else if( multiplier_temp[0] )begin   //如果乘数的最低位为1
            mul64_result_temp <= mul64_result_temp + multiplicand_temp_128;
        end
        multiplicand_temp_128 <= ( multiplicand_temp_128 << 1 ); //被乘数左移一位
        multiplier_temp <= ( multiplier_temp >> 1 ); //乘数右移一位
    end
    else
        mul64_result_temp <= 128'b0;
end

reg mul64_over;
always @(posedge clock)begin
    if(reset)
        mul64_over <= 1'b0;
    else if(mul64_go & ( (mul_count >= 7'd63) |  multiplier_temp == 64'b0) )
        mul64_over <= 1'b1;
    else 
        mul64_over <= 1'b0;
end

assign mul_ready = mul_ready_t;
assign out_valid = mul32_over | mul64_over;  //只持续一周期
assign result_lo = out_valid ? ( mul32_over ? { {32{mul32_result_temp[31]}},mul32_result_temp[31:0] } : mul64_result_temp[63:0] ): 64'd0; //只持续一周期 用低64位表示输出
assign result_hi = mul64_over ? mul64_result_temp[127:64] : 64'b0;
assign mul_doing = mul32ss_go | mul64_go;

endmodule

/*
    模块名称：除法器
    功能：支持64 / 64 的有符号 / 无符号 除法 获得商和余数
         支持32 / 32 的有符号 / 无符号 除法 获得商和余数
*/

module ysyx_22050854_divider_1 (
    input clock,
    input reset,
    input [63:0]dividend,  //被除数
    input [63:0]divisor,   //除数
    input div_valid,       //为高表示输入的数据有效，如果没有新的除法输入，在除法被接受的下一个周期要置低
    input divw,            //为高表示输入是32位除法
    input div_signed,      //为高表示是有符号除法
    output div_doing,
    output div_ready,      //为高表示除法器空闲，可以输入数据
    output out_valid,      //为高表示除法器输出结果有效
    output [63:0]quotient, //商
    output [63:0]remainder //余数
);

//第一步 根据被除数和除数确定商和余数的符号 并计算被除数和除数的绝对值
// 规定余数的符号和被除数的符号保持一致
reg sign_quotient;   //0-正数 1-负数
reg sign_remainder;
reg [63:0]ABS_dividend_32;
reg [32:0]ABS_divisor_32;
reg [127:0]ABS_dividend_64;
reg [64:0]ABS_divisor_64;
reg div32_go;
reg div64_go;
reg div_ready_t;

always @(posedge clock)begin
    if(reset)begin
        sign_quotient <= 1'b0;
        sign_remainder <= 1'b0;
        ABS_dividend_32 <= 64'b0;
        ABS_divisor_32  <=33'b0;
        ABS_dividend_64 <= 128'b0;
        ABS_divisor_64 <= 65'b0;
        div32_go <= 1'b0;
        div64_go <= 1'b0;
        div_ready_t <= 1'b1;
    end
    else if( div_ready_t & div_valid & divw & div_signed )begin // 有符号的32位除法
        div32_go <= 1'b1;
        div_ready_t <= 1'b0;
        sign_quotient <= dividend[31] ^ divisor[31];
        sign_remainder <= dividend[31];
        if( dividend[31] ) ABS_dividend_32[31:0] <= ~dividend[31:0] + 1; 
        else ABS_dividend_32[31:0] <= dividend[31:0];
        if( divisor[31] ) ABS_divisor_32[31:0] <= ~divisor[31:0] + 1;
        else ABS_divisor_32[31:0] <= divisor[31:0];
    end
    else if( div_ready_t & div_valid & divw & !div_signed )begin // 无符号的32位除法
        div32_go <= 1'b1;
        div_ready_t <= 1'b0;
        sign_quotient <= 1'b0;  //对于无符号数运算 最后一步默认就是运算结果就可
        sign_remainder <= 1'b0; 
        ABS_dividend_32[31:0] <= dividend[31:0];
        ABS_divisor_32[31:0] <= divisor[31:0];       
    end
    else if( div_ready_t & div_valid & ~divw & div_signed )begin // 有符号的64位除法
        div64_go <= 1'b1;
        div_ready_t <= 1'b0;
        sign_quotient <= dividend[63] ^ divisor[63];
        sign_remainder <= dividend[63];
        if( dividend[63] ) ABS_dividend_64[63:0] <= ~dividend + 1; 
        else ABS_dividend_64[63:0] <= dividend;
        if( divisor[63] ) ABS_divisor_64[63:0] <= ~divisor + 1;
        else ABS_divisor_64[63:0] <= divisor;
    end
    else if( div_ready_t & div_valid & ~divw & ~div_signed )begin // 无符号的64位除法
        div64_go <= 1'b1;
        div_ready_t <= 1'b0;
        sign_quotient <= 1'b0;
        sign_remainder <= 1'b0;
        ABS_dividend_64[63:0] <= dividend;
        ABS_divisor_64[63:0] <= divisor;
    end
    else if( div32_over | div64_over )begin
        sign_quotient <= 1'b0;
        sign_remainder <= 1'b0;
        ABS_dividend_32 <= 64'b0;
        ABS_divisor_32  <= 33'b0;
        ABS_dividend_64 <= 128'b0;
        ABS_divisor_64 <= 65'b0;
        div_ready_t <= 1'b1;
    end
end

//计数器
reg [7:0]div_count;
always @(posedge clock)begin
    if(reset)
        div_count <= 8'b0;
    else if( div32_go & (div_count >= 8'd32) ) //得需要33个周期，因为获得余数还需要一个周期
        div_count <= 8'b0;
    else if( div64_go & (div_count >= 8'd64) )
        div_count <= 8'b0;
    else if( div32_go | div64_go )
        div_count <= div_count + 8'b1;
    else
        div_count <= 8'b0;
end

//第二步 迭代运算得到商和余数的绝对值
reg [31:0]div32_result_quotient;
reg [31:0]div32_result_remainder;
reg [63:0]div64_result_quotient;
reg [63:0]div64_result_remainder;
reg [4:0]div32_index;
reg [5:0]div64_index;
always @(posedge clock)begin
    if(reset)begin
        div32_result_quotient <= 32'b0;
        div32_result_remainder <= 32'b0;
        div64_result_quotient <= 64'b0;
        div64_result_remainder <= 64'b0;
        div32_index <= 5'd31;
        div64_index <= 6'd63;
    end
    else if( div32_go & (div_count < 8'd32 ))begin     //32x32 获得商
        if ( ( ABS_dividend_32[63:31] < ABS_divisor_32 ) )begin
            div32_result_quotient[div32_index] <= 1'b0;
            if(div_count != 8'd31) ABS_dividend_32 <= ABS_dividend_32 << 1;
        end
        else begin
            div32_result_quotient[div32_index] <= 1'b1;
            if( div_count != 8'd31 ) 
                ABS_dividend_32 <= { ABS_dividend_32 - {ABS_divisor_32,31'b0} } << 1; //够减，调整剩余被乘数,然后再左移一位
            else 
                ABS_dividend_32 <= { ABS_dividend_32 - {ABS_divisor_32,31'b0} };
        end
        div32_index <= div32_index - 5'd1;
    end
    else if( div32_go & (div_count == 8'd32) )begin     //32x32 获得余数
        div32_result_remainder <= ABS_dividend_32[62:31];
    end
    else if( div64_go & (div_count < 8'd64 ))begin      //64x64 获得商
        if ( ( ABS_dividend_64[127:63] < ABS_divisor_64 ) )begin
            div64_result_quotient[div64_index] <= 1'b0;
            if(div_count != 8'd63) ABS_dividend_64 <= ABS_dividend_64 << 1;
        end
        else begin
            div64_result_quotient[div64_index] <= 1'b1;
            if( div_count != 8'd63 ) 
                ABS_dividend_64 <= { ABS_dividend_64 - {ABS_divisor_64,63'b0} } << 1; //够减，调整剩余被乘数,然后再左移一位
            else 
                ABS_dividend_64 <= { ABS_dividend_64 - {ABS_divisor_64,63'b0} };
        end
        div64_index <= div64_index - 6'd1;
    end
    else if( div64_go & (div_count == 8'd64) )begin     //64x64 获得余数
        div64_result_remainder <= ABS_dividend_64[126:63];
    end  
    else if( div32_over | div64_over )begin
        div32_result_quotient <= 32'b0;
        div32_result_remainder <= 32'b0;
        div64_result_quotient <= 64'b0;
        div64_result_remainder <= 64'b0;
        div32_index <= 5'd31;
        div64_index <= 6'd63;
    end
end

reg div32_over;
reg div64_over;
always @(posedge clock)begin
    if(reset)begin
        div32_over <= 1'b0;
        div64_over <= 1'b0;
    end
    else if(div32_go & (div_count >= 8'd32)) begin//得需要33个周期，因为获得余数还需要一个周期
        div32_over <= 1'b1;
        div32_go <= 1'b0;
    end
    else if(div64_go & (div_count >= 8'd64))begin //得需要65个周期，因为获得余数还需要一个周期
        div64_over <= 1'b1;
        div64_go <= 1'b0;
    end
    else begin
        div32_over <= 1'b0;
        div64_over <= 1'b0;
    end
end

//第3步，调整最终的商和余数
wire [31:0]quotient_32;
wire [31:0]remainder_32;
assign quotient_32 = div32_over ? ( sign_quotient ? (~div32_result_quotient + 32'b1) : div32_result_quotient ) : 32'b0;
assign remainder_32 = div32_over ? ( sign_remainder ? (~div32_result_remainder + 32'b1) : div32_result_remainder ) : 32'b0;
assign quotient = div64_over ? ( sign_quotient ? (~div64_result_quotient + 64'b1) : div64_result_quotient ) : {{32{quotient_32[31]}},quotient_32};
assign remainder = div64_over ? ( sign_remainder ? (~div64_result_remainder + 64'b1) : div64_result_remainder ) :{{32{quotient_32[31]}},remainder_32};
assign div_doing = div32_go | div64_go;
assign out_valid = div32_over | div64_over;
assign div_ready = div_ready_t;

endmodule

module ysyx_22050854_MuxKeyInternal #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1, HAS_DEFAULT = 0) (
  output reg [DATA_LEN-1:0] out,
  input [KEY_LEN-1:0] key,
  input [DATA_LEN-1:0] default_out,
  input [NR_KEY*(KEY_LEN + DATA_LEN)-1:0] lut
);

  localparam PAIR_LEN = KEY_LEN + DATA_LEN;
  wire [PAIR_LEN-1:0] pair_list [NR_KEY-1:0];
  wire [KEY_LEN-1:0] key_list [NR_KEY-1:0];
  wire [DATA_LEN-1:0] data_list [NR_KEY-1:0];

  generate
    for (genvar n = 0; n < NR_KEY; n = n + 1) begin
      assign pair_list[n] = lut[PAIR_LEN*(n+1)-1 : PAIR_LEN*n];
      assign data_list[n] = pair_list[n][DATA_LEN-1:0];
      assign key_list[n]  = pair_list[n][PAIR_LEN-1:DATA_LEN];
    end
  endgenerate

  reg [DATA_LEN-1 : 0] lut_out;
  reg hit;
  integer i;
  always @(*) begin
    lut_out = 0;
    hit = 0;
    for (i = 0; i < NR_KEY; i = i + 1) begin
      lut_out = lut_out | ({DATA_LEN{key == key_list[i]}} & data_list[i]);
      hit = hit | (key == key_list[i]);
    end
    if (!HAS_DEFAULT) out = lut_out;
    else out = (hit ? lut_out : default_out);
  end
endmodule

// 不带默认值的选择器模板
module ysyx_22050854_MuxKey #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1) (
  output [DATA_LEN-1:0] out,
  input [KEY_LEN-1:0] key,
  input [NR_KEY*(KEY_LEN + DATA_LEN)-1:0] lut
);
  ysyx_22050854_MuxKeyInternal #(NR_KEY, KEY_LEN, DATA_LEN, 0) i0 (out, key, {DATA_LEN{1'b0}}, lut);
endmodule

// 带默认值的选择器模板
module ysyx_22050854_MuxKeyWithDefault #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1) (
  output [DATA_LEN-1:0] out,
  input [KEY_LEN-1:0] key,
  input [DATA_LEN-1:0] default_out,
  input [NR_KEY*(KEY_LEN + DATA_LEN)-1:0] lut
);
  ysyx_22050854_MuxKeyInternal #(NR_KEY, KEY_LEN, DATA_LEN, 1) i0 (out, key, default_out, lut);
endmodule

module ysyx_22050854_Reg #(WIDTH = 1, RESET_VAL = 0) (
    input clock,
    input reset,
    input [WIDTH-1:0] din,
    output reg [WIDTH-1:0] dout,
    input wen
);
    always @(posedge clock) begin
        if(reset) dout <= RESET_VAL;
        else if(wen) dout <= din;
    end
endmodule


module ysyx_22050854_AXI_arbiter(
    input clock,
    input reset,
    
    input IFU_request,
    input FLS_request,
    input LSU_request,
    input DEV_request,
    input arready,
    input [31:0]IFU_addr,
    input [31:0]FLS_addr,
    input [31:0]LSU_addr,
    input [31:0]Device_addr,
    input [2:0]Device_arsize,
    output reg AXI_arbiter_arvalid,
    output reg [3:0]AXI_arbiter_arid,
    output reg [31:0]AXI_arbiter_addr,
    output reg [7:0]AXI_arbiter_arlen,
    output reg [2:0]AXI_arbiter_arsize,
    output reg [1:0]AXI_arbiter_arburst
);
    //IFU first
    wire Double_request;
    assign Double_request = ( IFU_request | FLS_request ) & ( LSU_request | DEV_request );

    reg reg_DoubleRequest;
    ysyx_22050854_Reg #(1,1'b0) Inst_reg_DoubleRequest ( clock, reset, Double_request, reg_DoubleRequest, Double_request );
    reg Double_is_Device;
    ysyx_22050854_Reg #(1,1'b0) Inst_Double_is_Device ( clock, reset, DEV_request, Double_is_Device, Double_request );

    reg [31:0]addr_DoubleRequest;
    wire [31:0]store_address;
    assign store_address = DEV_request ? Device_addr : LSU_addr;
    ysyx_22050854_Reg #(32,32'b0) Inst_Reg_addr_DoubleRequest ( clock, reset, store_address, addr_DoubleRequest, Double_request );
    reg [2:0]Reg_Device_arsize;
    ysyx_22050854_Reg #(3,3'b0) Inst_Reg_Device_arsize ( clock, reset, Device_arsize, Reg_Device_arsize, Double_request );

    wire is_second_request;
    assign is_second_request = ( IFU_request | FLS_request | LSU_request | DEV_request ) && AXI_arbiter_arvalid; // this request coming but last request not handsake
    reg reg_secondRequest;
    ysyx_22050854_Reg #(1,1'b0) Inst_Second_Request ( clock, reset, is_second_request, reg_secondRequest, is_second_request );

    reg [3:0]SecondRequest_arid;
    reg [31:0]SecondRequest_addr;
    reg [7:0]SecondRequest_arlen;
    reg [2:0]SecondRequest_arsize;
    reg [1:0]SecondRequest_burst;
    ysyx_22050854_Reg #(4,4'b0) Inst_SecondRequest_arid ( clock, reset, arid_temp, SecondRequest_arid, is_second_request );
    ysyx_22050854_Reg #(32,32'b0) Inst_SecondRequest_addr ( clock, reset, addr_temp, SecondRequest_addr, is_second_request );
    ysyx_22050854_Reg #(8,8'b0) Inst_SecondRequest_arlen ( clock, reset, arlen_temp, SecondRequest_arlen, is_second_request );
    ysyx_22050854_Reg #(3,3'b0) Inst_SecondRequest_arsize ( clock, reset, arsize_temp, SecondRequest_arsize, is_second_request );
    ysyx_22050854_Reg #(2,2'b0) Inst_SecondRequest_burst ( clock, reset, arburst_temp, SecondRequest_burst, is_second_request );

    wire [3:0]arid_temp;
    wire [31:0]addr_temp;
    wire [7:0]arlen_temp;
    wire [2:0]arsize_temp;
    wire [1:0]arburst_temp;
    assign arid_temp =      FLS_request ? `FLASH_AXI4_ID : 
                            IFU_request ? `Icache_AXI4_ID : 
                            LSU_request ? `Dcache_AXI4_ID : 
                            DEV_request ? `Device_AXI4_ID : 
                            4'b1111;
    assign addr_temp =      FLS_request ? FLS_addr : 
                            IFU_request ? IFU_addr : 
                            LSU_request ? LSU_addr : 
                            DEV_request ? Device_addr : 
                            32'b0;
    assign arlen_temp =     FLS_request ? 8'b0 : 
                            IFU_request ? 8'b1 : 
                            LSU_request ? 8'b1 : 
                            DEV_request ? 8'b0 : 
                            8'b0;
    assign arsize_temp =    FLS_request ? 3'b010 : 
                            IFU_request ? 3'b011 : 
                            LSU_request ? 3'b011 : 
                            DEV_request ? Device_arsize : 
                            3'b0;
    assign arburst_temp =   FLS_request ? 2'b00 : 
                            IFU_request ? 2'b01 : 
                            LSU_request ? 2'b01 : 
                            DEV_request ? 2'b00 : 
                            2'b0;  

    //IFU-0001   MEM--0010  DEV---0011
    //arid:   IFU-0011   MEM--0001  DEV---0010
    always @(posedge clock)begin
        if(reset)
            AXI_arbiter_arid <= 4'b0000;
        else if( ( IFU_request | FLS_request | LSU_request | DEV_request ) && ~AXI_arbiter_arvalid )
            AXI_arbiter_arid <= arid_temp;
        else if( reg_secondRequest && ~AXI_arbiter_arvalid )
            AXI_arbiter_arid <= SecondRequest_arid;
        else if( reg_DoubleRequest && ~AXI_arbiter_arvalid )
            AXI_arbiter_arid <= Double_is_Device ? `Device_AXI4_ID : `Dcache_AXI4_ID;
    end

    //araddr
    always @(posedge clock)begin
        if(reset)
            AXI_arbiter_addr <= 32'b0;
        else if( ( IFU_request | FLS_request | LSU_request | DEV_request ) && ~AXI_arbiter_arvalid )
            AXI_arbiter_addr <= addr_temp;
        else if( reg_secondRequest && ~AXI_arbiter_arvalid )
            AXI_arbiter_addr <= SecondRequest_addr;
        else if( reg_DoubleRequest && ~AXI_arbiter_arvalid )
            AXI_arbiter_addr <= addr_DoubleRequest;
    end

    //arlen
    always @(posedge clock)begin
        if(reset)
            AXI_arbiter_arlen <= 8'b0;
        else if( ( IFU_request | FLS_request | LSU_request | DEV_request ) && ~AXI_arbiter_arvalid )
            AXI_arbiter_arlen <= arlen_temp;
        else if( reg_secondRequest && ~AXI_arbiter_arvalid )
            AXI_arbiter_arlen <= SecondRequest_arlen;
        else if( reg_DoubleRequest && ~AXI_arbiter_arvalid )
            AXI_arbiter_arlen <= Double_is_Device ? 8'b0 : 8'b1;
    end

    //arsize
    always @(posedge clock)begin
        if(reset)
            AXI_arbiter_arsize <= 3'b0;
        else if( ( IFU_request | FLS_request | LSU_request | DEV_request ) && ~AXI_arbiter_arvalid )
            AXI_arbiter_arsize <= arsize_temp;  // 2^3 = 8 Bytes
        else if( reg_secondRequest && ~AXI_arbiter_arvalid )
            AXI_arbiter_arsize <= SecondRequest_arsize;
        else if( reg_DoubleRequest && ~AXI_arbiter_arvalid )
            AXI_arbiter_arsize <= Double_is_Device ? Reg_Device_arsize : 3'b011;
    end

    //arburst
    always @(posedge clock)begin
        if(reset)
            AXI_arbiter_arburst <= 2'b0;
        else if( ( IFU_request | FLS_request | LSU_request | DEV_request ) && ~AXI_arbiter_arvalid )
            AXI_arbiter_arburst <= arburst_temp;
        else if( reg_secondRequest && ~AXI_arbiter_arvalid )
            AXI_arbiter_arburst <= SecondRequest_burst;
        else if( reg_DoubleRequest && ~AXI_arbiter_arvalid )
            AXI_arbiter_arburst <= Double_is_Device ? 2'b00 : 2'b01;
    end

    //generate arvalid
    always @(posedge clock)begin
        if(reset)
            AXI_arbiter_arvalid <= 1'b0;
        else if( AXI_arbiter_arvalid && arready ) //if woshou success,set 0,and can access Both_request
            AXI_arbiter_arvalid <= 1'b0;
        else if( ( IFU_request | FLS_request | LSU_request | DEV_request ) && ~AXI_arbiter_arvalid )begin
            AXI_arbiter_arvalid <= 1'b1;
        end
        else if( reg_secondRequest && ~AXI_arbiter_arvalid )begin
            AXI_arbiter_arvalid <= 1'b1;
            reg_secondRequest <= 1'b0;
        end
        else if( reg_DoubleRequest && ~AXI_arbiter_arvalid )begin
            AXI_arbiter_arvalid <= 1'b1;
            reg_DoubleRequest <= 1'b0;
        end

    end

endmodule


module ysyx_22050854_Icache (clock,reset,
    valid,op,index,tag,offset,addr_ok,data_ok,rdata,unshoot,
    rd_req,rd_addr,rd_rdy,ret_valid,ret_last,ret_data,
    sram0_addr,sram0_cen,sram0_wen,sram0_wmask,sram0_wdata,sram0_rdata,
    sram1_addr,sram1_cen,sram1_wen,sram1_wmask,sram1_wdata,sram1_rdata,
    sram2_addr,sram2_cen,sram2_wen,sram2_wmask,sram2_wdata,sram2_rdata,
    sram3_addr,sram3_cen,sram3_wen,sram3_wmask,sram3_wdata,sram3_rdata
);

parameter Index_Bits = 7;  //
parameter Tag_Bits = 21;

input clock;
input reset;
//Cache & CPU interface 
input valid;    //表明请求有效
input op;       // 1:write 0:read
input [Index_Bits - 1 : 0 ]index;    // 地址的index域,一路是2KB 一个块是16B，所以有11 - 4 = 7 个块
input [Tag_Bits - 1 : 0 ]tag;// 32 - 4- 7 = 21
input offset;       //每一个块的大小是16字节
output addr_ok;       //表示这次请求的地址传输OK
output data_ok;       //表示这次请求的数据传输OK
output [63:0]rdata;    //读cache的结果
output reg unshoot;
//Cache 与 AXI总线接口的交互接口
output reg rd_req;        //读请求有效信号，高电平valid
output reg [31:0]rd_addr;       //读请求起始地址
input rd_rdy;       //读请求能否被接受的握手信号，高电平有效
input ret_valid;      //返回数据有效   
input ret_last;     //返回数据是一次读请求对应最后一个返回的数据
input [63:0]ret_data;     //读返回数据

//cache 与 ram的交互信号
output [5:0]sram0_addr;
output sram0_cen;
output sram0_wen;
output [127:0]sram0_wmask;
output [127:0]sram0_wdata;
input [127:0]sram0_rdata;
output [5:0]sram1_addr;
output sram1_cen;
output sram1_wen;
output [127:0]sram1_wmask;
output [127:0]sram1_wdata;
input [127:0]sram1_rdata;
output [5:0]sram2_addr;
output sram2_cen;
output sram2_wen;
output [127:0]sram2_wmask;
output [127:0]sram2_wdata;
input [127:0]sram2_rdata;
output [5:0]sram3_addr;
output sram3_cen;
output sram3_wen;
output [127:0]sram3_wmask;
output [127:0]sram3_wdata;
input [127:0]sram3_rdata;

parameter IDLE = 4'b0001,LOOKUP = 4'b0010, MISS = 4'b0100, REPLACE = 4'b1000;
reg [3:0]state;

reg [Index_Bits - 1 : 0]RB_index;
reg [Tag_Bits - 1 : 0]RB_tag;
reg RB_offset;
reg HIT_index;
reg HIT_offset;
reg [127:0] Bus_retdata;

reg [21:0] Way0_TagV [127:0];
reg [21:0] Way1_TagV [127:0];
initial 
begin
    for (int i = 0; i < 128; i = i + 1)begin
        Way0_TagV[i] = 0;
        Way1_TagV[i] = 0;
    end
end

reg ram1_CEN;
reg ram1_WEN;
reg [127:0]ram1_bwen;
reg [5:0]ram1_addr;
reg [127:0]ram1_wdata;

reg ram2_CEN;
reg ram2_WEN;
reg [127:0]ram2_bwen;
reg [5:0]ram2_addr;
reg [127:0]ram2_wdata;

reg ram3_CEN;
reg ram3_WEN;
reg [127:0]ram3_bwen;
reg [5:0]ram3_addr;
reg [127:0]ram3_wdata;

reg ram4_CEN;
reg ram4_WEN;
reg [127:0]ram4_bwen;
reg [5:0]ram4_addr;
reg [127:0]ram4_wdata;

reg Data_OK;
reg ADDR_OK;
reg hit_way0;
reg hit_way1;
reg HIT_way0;
reg HIT_way1;
wire [127:0]read_ramdata;
//state machine transition
always @(posedge clock)begin
    if(reset)begin
        state <= IDLE;
        RB_index <= 7'd0;
        RB_tag <= 21'd0;
        RB_offset <= 1'b0;
        HIT_index <= 1'b0;
        HIT_offset <= 1'b0;
        ADDR_OK <= 1'b0;
        hit_way0 <= 1'b0;
        hit_way1 <= 1'b0;
        HIT_way0 <= 1'b0;
        HIT_way1 <= 1'b0;
        unshoot <= 1'b0;
        Data_OK <= 1'b0;
        ram1_CEN <= 1'b1;
        ram1_WEN <= 1'b1;
        ram1_bwen <= 128'hffffffffffffffffffffffffffffffff;
        ram1_addr <= 6'b0;
        ram1_wdata <= 128'b0;
        ram2_CEN <= 1'b1;
        ram2_WEN <= 1'b1;
        ram2_bwen <= 128'hffffffffffffffffffffffffffffffff;
        ram2_addr <= 6'b0;
        ram2_wdata <= 128'b0;
        ram3_CEN <= 1'b1;
        ram3_WEN <= 1'b1;
        ram3_bwen <= 128'hffffffffffffffffffffffffffffffff;
        ram3_addr <= 6'b0;
        ram3_wdata <= 128'b0;
        ram4_CEN <= 1'b1;
        ram4_WEN <= 1'b1;
        ram4_bwen <= 128'hffffffffffffffffffffffffffffffff;
        ram4_addr <= 6'b0;
        ram4_wdata <= 128'b0;

        rd_req <= 1'b0;
        rd_addr <= 32'b0;
        Bus_retdata <= 128'b0;
    end
    else begin
    case(state)
        IDLE: 
            begin 
                ram1_WEN <= 1'b1;
                ram1_bwen <= 128'hffffffffffffffffffffffffffffffff;
                ram1_addr <= 6'b0;
                ram1_wdata <= 128'b0;
                ram2_WEN <= 1'b1;
                ram2_bwen <= 128'hffffffffffffffffffffffffffffffff;
                ram2_addr <= 6'b0;
                ram2_wdata <= 128'b0;
                ram3_WEN <= 1'b1;
                ram3_bwen <= 128'hffffffffffffffffffffffffffffffff;
                ram3_addr <= 6'b0;
                ram3_wdata <= 128'b0;
                ram4_WEN <= 1'b1;
                ram4_bwen <= 128'hffffffffffffffffffffffffffffffff;
                ram4_addr <= 6'b0;
                ram4_wdata <= 128'b0;
                
                Data_OK <= 1'b0;

                if(valid & !op ) begin
                    RB_index <= index;  
                    RB_tag <= tag;
                    RB_offset <= offset;
                    ADDR_OK <= 1'b1;
                    if( Way0_TagV[index] == {1'b1,tag} ) begin //hit way0
                        state <= LOOKUP;
                        ram1_CEN <= ~index[6] ? 1'b0 : 1'b1;
                        ram2_CEN <= index[6] ? 1'b0 : 1'b1;
                        ram1_addr <= index[5:0];
                        ram2_addr <= index[5:0];
                        hit_way0 <= 1'b1;
                        hit_way1 <= 1'b0;
                        ram3_CEN <= 1'b1;
                        ram4_CEN <= 1'b1;
                    end
                    else if( Way1_TagV[index] == {1'b1,tag} ) begin //hit way1
                        state <= LOOKUP;
                        ram3_CEN <= ~index[6] ? 1'b0 : 1'b1;
                        ram4_CEN <= index[6] ? 1'b0 : 1'b1;
                        ram3_addr <= index[5:0];
                        ram4_addr <= index[5:0];
                        hit_way1 <= 1'b1;
                        hit_way0 <= 1'b0;
                        ram1_CEN <= 1'b1;
                        ram2_CEN <= 1'b1;
                    end
                    else begin                      //unshoot
                        if(rd_rdy)begin             // only AXI(SRAM) ready cloud generate request
                            rd_req <= 1'b1;
                            rd_addr <= {tag,index,4'b0};
                        end
                        state <= MISS;
                        unshoot <= 1'b1;
                        hit_way0 <= 1'b0;
                        hit_way1 <= 1'b0;
                        ram1_CEN <= 1'b1;
                        ram2_CEN <= 1'b1;
                        ram3_CEN <= 1'b1;
                        ram4_CEN <= 1'b1;
                    end
                end
                else begin
                    state <= IDLE;
                    ADDR_OK <= 1'b0;
                    hit_way1 <= 1'b0;
                    hit_way0 <= 1'b0;
                    ram1_CEN <= 1'b1;
                    ram2_CEN <= 1'b1;
                    ram3_CEN <= 1'b1;
                    ram4_CEN <= 1'b1;
                end
            end
        LOOKUP:                      //only hit could enter state:LOOKUP
            begin
                if( hit_way0 || hit_way1) begin
                    HIT_index <= RB_index[6];  
                    HIT_offset <= RB_offset;
                    HIT_way0 <= hit_way0;
                    HIT_way1 <= hit_way1;
                    Data_OK <= 1'b1;
                    ram1_CEN <= 1'b1;
                    ram2_CEN <= 1'b1;
                    ram3_CEN <= 1'b1;
                    ram4_CEN <= 1'b1;
                end
                else 
                    Data_OK <= 1'b0;

                if( !valid ) begin             //finish and no new request
                    state <= IDLE;
                    ADDR_OK <= 1'b0;
                    
                end
                else if( valid & !op) begin   //get valid again
                    RB_index <= index;  
                    RB_tag <= tag;
                    RB_offset <= offset;
                    ADDR_OK <= 1'b1;
                    if( Way0_TagV[index] == {1'b1,tag} ) begin //hit way0
                        state <= LOOKUP;
                        ram1_CEN <= ~index[6] ? 1'b0 : 1'b1;
                        ram2_CEN <= index[6] ? 1'b0 : 1'b1;
                        ram1_addr <= index[5:0];
                        ram2_addr <= index[5:0];
                        hit_way0 <= 1'b1;
                        hit_way1 <= 1'b0;
                    end
                    else if( Way1_TagV[index] == {1'b1,tag} ) begin //hit way1
                        state <= LOOKUP;
                        ram3_CEN <= ~index[6] ? 1'b0 : 1'b1;
                        ram4_CEN <= index[6] ? 1'b0 : 1'b1;
                        ram3_addr <= index[5:0];
                        ram4_addr <= index[5:0];
                        hit_way1 <= 1'b1;
                        hit_way0 <= 1'b0;
                    end
                    else begin                      // unshoot
                        if(rd_rdy)begin             // only AXI(SRAM) ready cloud generate request
                            rd_req <= 1'b1;
                            rd_addr <= {tag,index,4'b0};
                        end
                        state <= MISS;
                        unshoot <= 1'b1;
                        hit_way0 <= 1'b0;
                        hit_way1 <= 1'b0;
                    end
                end
            end
        MISS:
            begin
                rd_req <= 1'b0;
                rd_addr <= 32'b0;
                ADDR_OK <= 1'b0;
                Data_OK <= 1'b0;
                HIT_way0 <= hit_way0;
                HIT_way1 <= hit_way1;
                if( ret_valid && !ret_last ) begin //bus return data
                    state <= MISS;
                    Bus_retdata[63:0] <= ret_data;
                end
                else if( ret_valid && ret_last )begin        //got whole cacheline from AXI
                    state <= REPLACE;
                    Bus_retdata[127:64] <= ret_data;
                    Data_OK <= 1'b1;
                end
                else begin
                    state <= MISS;
                end
            end
        REPLACE:
            begin
                state <= IDLE;
                unshoot <= 1'b0;
                Data_OK <= 1'b0;
                if( RB_index[6] && ~Way0_TagV[ RB_index ][21] )begin
                    ram2_CEN <= 1'b0;
                    ram2_WEN <= 1'b0;
                    ram2_bwen <= 128'b0;
                    ram2_addr <= RB_index[5:0];
                    ram2_wdata <= Bus_retdata;
                    Way0_TagV[RB_index] <= {1'b1,RB_tag};
                end
                else if( !RB_index[6] && ~Way0_TagV[ RB_index ][21])begin
                    ram1_CEN <= 1'b0;
                    ram1_WEN <= 1'b0;
                    ram1_bwen <= 128'b0;
                    ram1_addr <= RB_index[5:0];
                    ram1_wdata <= Bus_retdata;
                    Way0_TagV[RB_index] <= {1'b1,RB_tag};
                end
                else if( RB_index[6] && ~Way1_TagV[ RB_index ][21])begin
                    ram4_CEN <= 1'b0;
                    ram4_WEN <= 1'b0;
                    ram4_bwen <= 128'b0;
                    ram4_addr <= RB_index[5:0];
                    ram4_wdata <= Bus_retdata;
                    Way1_TagV[RB_index] <= {1'b1,RB_tag};
                end
                else if( !RB_index[6] && ~Way1_TagV[ RB_index ][21])begin     
                    ram3_CEN <= 1'b0;
                    ram3_WEN <= 1'b0;
                    ram3_bwen <= 128'b0;
                    ram3_addr <= RB_index[5:0];
                    ram3_wdata <= Bus_retdata;
                    Way1_TagV[RB_index] <= {1'b1,RB_tag};
                end
                else if( Way0_TagV[ RB_index ][21] && Way1_TagV[ RB_index ][21] )begin  //If both full // replace way0
                    if( RB_index[6]  )begin
                        ram2_CEN <= 1'b0;
                        ram2_WEN <= 1'b0;
                        ram2_bwen <= 128'b0;
                        ram2_addr <= RB_index[5:0];
                        ram2_wdata <= Bus_retdata;
                        Way0_TagV[RB_index] <= {1'b1,RB_tag};
                    end
                    else if( !RB_index[6] )begin
                        ram1_CEN <= 1'b0;
                        ram1_WEN <= 1'b0;
                        ram1_bwen <= 128'b0;
                        ram1_addr <= RB_index[5:0];
                        ram1_wdata <= Bus_retdata;
                        Way0_TagV[RB_index] <= {1'b1,RB_tag};
                    end
                end
            end
        default:
            state <= IDLE;
    endcase 
    end
end

assign read_ramdata = Data_OK ? ( HIT_way0 ? ( HIT_index ? sram1_rdata : sram0_rdata ) : ( HIT_way1 ? ( HIT_index ? sram3_rdata : sram2_rdata) : 128'b0 ) ) : 128'b0;
assign rdata = Data_OK ? ( ( state == REPLACE ) ? (  RB_offset ?  Bus_retdata[127:64] : Bus_retdata[63:0] ) : ( HIT_offset ?  read_ramdata[127:64] : read_ramdata[63:0] ) ) : 64'b0;

assign data_ok = Data_OK;
assign addr_ok = ADDR_OK;

assign sram0_addr = ram1_addr;
assign sram0_cen = ram1_CEN;
assign sram0_wen = ram1_WEN;
assign sram0_wmask = ram1_bwen;
assign sram0_wdata = ram1_wdata;

assign sram1_addr = ram2_addr;
assign sram1_cen = ram2_CEN;
assign sram1_wen = ram2_WEN;
assign sram1_wmask = ram2_bwen;
assign sram1_wdata = ram2_wdata;

assign sram2_addr = ram3_addr;
assign sram2_cen = ram3_CEN;
assign sram2_wen = ram3_WEN;
assign sram2_wmask = ram3_bwen;
assign sram2_wdata = ram3_wdata;

assign sram3_addr = ram4_addr;
assign sram3_cen = ram4_CEN;
assign sram3_wen = ram4_WEN;
assign sram3_wmask = ram4_bwen;
assign sram3_wdata = ram4_wdata;

endmodule


module ysyx_22050854_Dcache (clock,reset,
    valid,op,index,tag,offset,wstrb,wdata,data_ok,rdata,unshoot,fencei,
    rd_req,rd_addr,rd_rdy,ret_valid,ret_last,ret_data,wr_req,wr_addr,wr_wstb,wr_data,wr_rdy,wr_resp,
    sram4_addr,sram4_cen,sram4_wen,sram4_wmask,sram4_wdata,sram4_rdata,
    sram5_addr,sram5_cen,sram5_wen,sram5_wmask,sram5_wdata,sram5_rdata,
    sram6_addr,sram6_cen,sram6_wen,sram6_wmask,sram6_wdata,sram6_rdata,
    sram7_addr,sram7_cen,sram7_wen,sram7_wmask,sram7_wdata,sram7_rdata
);

parameter Offset_Bits = 4; //每一个cache块的大小是16B
parameter Index_Bits = 7;  //
parameter Tag_Bits = 21;

input clock;
input reset;
//Cache & CPU interface 
input valid;    //表明请求有效
input op;       // 1:write 0:read
input [Index_Bits - 1 : 0 ]index;    // 地址的index域,一路是2KB 一个块是16B，所以有11 - 4 = 7 个块
input [Tag_Bits - 1 : 0 ]tag;    // 32 - 4- 7 = 21
input [Offset_Bits - 1:0]offset;   //每一个块的大小是16字节
input [7:0]wstrb;    //最大是能写八个字节的
input [63:0]wdata;    //写数据
output data_ok;       //表示这次请求的数据传输OK
output [63:0]rdata;    //读cache的结果
output reg unshoot;
input fencei;

//Cache 与 AXI总线接口的交互接口
output reg rd_req;        //读请求有效信号，高电平valid
output reg [31:0]rd_addr;       //读请求起始地址
input rd_rdy;       //读请求能否被接受的握手信号，高电平有效
input ret_valid;      //返回数据有效   
input ret_last;     //返回数据是一次读请求对应最后一个返回的数据
input [63:0]ret_data;     //读返回数据
output reg wr_req;     //写请求信号，高电平有效
output reg [31:0]wr_addr;     //写请求地址
output reg [7:0]wr_wstb;   //写操作的字节掩码
output reg [127:0]wr_data;        //写数据
input wr_rdy;          //写请求能否被接收的握手信号，高电平有效，要求wr_rdy先于wr_req置起，wr_req看到wr_rdy置起后才可能置起
input wr_resp;         //写请求是否获得回应

//cache 与 ram的交互信号
output [5:0]sram4_addr;
output sram4_cen;
output sram4_wen;
output [127:0]sram4_wmask;
output [127:0]sram4_wdata;
input [127:0]sram4_rdata;
output [5:0]sram5_addr;
output sram5_cen;
output sram5_wen;
output [127:0]sram5_wmask;
output [127:0]sram5_wdata;
input [127:0]sram5_rdata;
output [5:0]sram6_addr;
output sram6_cen;
output sram6_wen;
output [127:0]sram6_wmask;
output [127:0]sram6_wdata;
input [127:0]sram6_rdata;
output [5:0]sram7_addr;
output sram7_cen;
output sram7_wen;
output [127:0]sram7_wmask;
output [127:0]sram7_wdata;
input [127:0]sram7_rdata;

parameter IDLE = 7'b0000001,LOOKUP = 7'b0000010, MISS = 7'b0000100, REPLACE = 7'b0001000,REWAIT = 7'b0010000,REFILL = 7'b0100000,WAIT_WR_RESPONSE = 7'b1000000;
reg [6:0]state;

reg [Index_Bits - 1 : 0]RB_index;
reg [Tag_Bits - 1 : 0]RB_tag;
reg RB_offset;
reg [127:0]RB_wdata;
reg RB_OP;
reg [127:0]RB_BWEN;

reg HIT_index;
reg HIT_offset;
reg [127:0] Bus_retdata;

reg [21:0] Way0_TagV [127:0];
reg [21:0] Way1_TagV [127:0];
reg [127:0] Way0_D;
reg [127:0] Way1_D;

reg ram4_CEN;
reg ram4_WEN;
reg [127:0]ram4_bwen;
reg [5:0]ram4_addr;
reg [127:0]ram4_wdata;
reg ram5_CEN;
reg ram5_WEN;
reg [127:0]ram5_bwen;
reg [5:0]ram5_addr;
reg [127:0]ram5_wdata;
reg ram6_CEN;
reg ram6_WEN;
reg [127:0]ram6_bwen;
reg [5:0]ram6_addr;
reg [127:0]ram6_wdata;
reg ram7_CEN;
reg ram7_WEN;
reg [127:0]ram7_bwen;
reg [5:0]ram7_addr;
reg [127:0]ram7_wdata;

reg Data_OK;
reg hit_way0;
reg hit_way1;
reg HIT_way0;
reg HIT_way1;
wire [127:0]read_ramdata;
reg [127:0]Replace_cache_data;

//由于这里输入进来的写掩码只有位数，并没有根据地址进行更改，所以需要自行对写掩码进行更改
//以前的更改是在仿真环境中用v_pmem_write实现的，但现在因为直接的写操作是在cache中完成，所以需要转化为精确的到字节的掩码
//而从cache写入内存时，只需要从起始地址写入一个cache块的内容了
//掩码0是写入，1无效
wire [63:0]wstrb_to_bwen_64_t;
wire [63:0]wstrb_to_bwen_64;
wire [127:0]wstrb_to_bwen_128;
wire [7:0]offset_8;
assign offset_8 = { 5'b0 , offset[2:0] };
assign wstrb_to_bwen_64_t = { {8{wstrb[7]}}, {8{wstrb[6]}}, {8{wstrb[5]}}, {8{wstrb[4]}}, {8{wstrb[3]}}, {8{wstrb[2]}}, {8{wstrb[1]}}, {8{wstrb[0]}} };
assign wstrb_to_bwen_64 = wstrb_to_bwen_64_t << ( offset_8 << 3 );
assign wstrb_to_bwen_128 = offset[3] ? { ~wstrb_to_bwen_64 , 64'hffffffffffffffff } : { 64'hffffffffffffffff , ~wstrb_to_bwen_64 };

wire [63:0]wdata_t;
assign wdata_t = wdata << ( offset_8 << 3 );
wire [127:0]wdata_128;
assign wdata_128 = offset[3] ? { wdata_t , 64'b0 } : { 64'b0 , wdata_t };

//Fence.I
localparam Fence_Idle = 4'b0001, Fence_Check = 4'b0010, Fence_Read = 4'b0100, Fence_Write = 4'b1000;
reg [3:0]Fence_state;

reg [8:0]Fence_counter;
always @(posedge clock)begin
    if( Fence_counter[8] ) begin
        unshoot <= 1'b0;
        Fence_counter <= 9'b0;
    end
end

reg Fence_ram4_CEN;
reg Fence_ram5_CEN;
reg Fence_ram6_CEN;
reg Fence_ram7_CEN;
reg [5:0]Fence_ram4_addr;
reg [5:0]Fence_ram5_addr;
reg [5:0]Fence_ram6_addr;
reg [5:0]Fence_ram7_addr;

reg [127:0]Fence_read_data;
reg Fence_wr;
//check way0_D, if dirty, first read ram, then write it to AXI
always @(posedge clock)begin
    if(reset) begin
        Fence_read_data <= 128'b0;
        Fence_counter <= 9'b0;
        Fence_state <= Fence_Idle;
        Fence_wr <= 1'b0;
        Fence_ram4_CEN <= 1'b1;
        Fence_ram5_CEN <= 1'b1;
        Fence_ram6_CEN <= 1'b1;
        Fence_ram7_CEN <= 1'b1;
        Fence_ram4_addr <= 6'b0;
        Fence_ram5_addr <= 6'b0;
        Fence_ram6_addr <= 6'b0;
        Fence_ram7_addr <= 6'b0;
    end
    else
    case(Fence_state)
    Fence_Idle:
        begin
            if( Fence_wr )begin  //if from Fence_Write
                wr_req <= 1'b0;
                wr_addr <= 32'b0;
                wr_wstb <= 8'h0;
                wr_data <= 128'b0;

                Fence_counter <= Fence_counter + 9'b1;
                Fence_state <= Fence_Check;
                Fence_wr <= 1'b0;
            end
            else if( ( state == IDLE || state == LOOKUP ) && fencei ) begin
                Fence_state <= Fence_Check;
                unshoot <= 1'b1;
                Fence_counter <= 9'b0;
            end
            else 
                Fence_state <= Fence_Idle;    
        end
    Fence_Check:
        begin
            if( Fence_counter[8] ) begin
                unshoot <= 1'b0;
                Fence_counter <= 9'b0;
                Fence_state <= Fence_Idle;
            end
            else
            begin
                if( ~Fence_counter[7] && Way0_D[Fence_counter[6:0]] ) //if Dirty, read ram   
                begin
                    Fence_state <= Fence_Read;
                    Way0_D[Fence_counter[6:0]] <= 1'b0;
                    
                    Fence_ram4_CEN <= ~Fence_counter[6] ? 1'b0 : 1'b1;
                    Fence_ram5_CEN <= Fence_counter[6] ? 1'b0 : 1'b1;
                    Fence_ram4_addr <= Fence_counter[5:0];
                    Fence_ram5_addr <= Fence_counter[5:0];
                end
                else if( Fence_counter[7] && Way1_D[Fence_counter[6:0]] )  //  
                begin
                    Fence_state <= Fence_Read;
                    Way1_D[Fence_counter[6:0]] <= 1'b0;

                    Fence_ram6_CEN <= ~Fence_counter[6] ? 1'b0 : 1'b1;
                    Fence_ram7_CEN <= Fence_counter[6] ? 1'b0 : 1'b1;
                    Fence_ram6_addr <= Fence_counter[5:0];
                    Fence_ram7_addr <= Fence_counter[5:0];
                end
                else begin
                    Fence_state <= Fence_Check;
                    Fence_counter <= Fence_counter + 9'b1;
                end
            end
        end
    Fence_Read:
        begin
            if( ~Fence_counter[7] && Fence_ram4_CEN && Fence_ram5_CEN )begin      //Way0
                Fence_state <= Fence_Write;
                Fence_read_data <= Fence_counter[6] ? sram5_rdata : sram4_rdata;
            end
            else if( Fence_counter[7] && Fence_ram6_CEN && Fence_ram7_CEN )begin  //Way1
                Fence_state <= Fence_Write;
                Fence_read_data <= Fence_counter[6] ? sram7_rdata : sram6_rdata;
            end
            else begin
                Fence_state <= Fence_Read; 
                Fence_ram4_CEN <= 1'b1;
                Fence_ram5_CEN <= 1'b1;
                Fence_ram6_CEN <= 1'b1;
                Fence_ram7_CEN <= 1'b1;
                Fence_ram4_addr <= 6'b0;
                Fence_ram5_addr <= 6'b0;
                Fence_ram6_addr <= 6'b0;
                Fence_ram7_addr <= 6'b0;
            end
        end
    Fence_Write:
        begin
            if( wr_rdy ) begin                      // 向AXI 发出写请求, 同时将AXI获得的数据写回到cache中
                Fence_state <= Fence_Idle;
                Fence_wr <= 1'b1;
                
                wr_req <= 1'b1;
                wr_wstb <= 8'hff;
                wr_data <= Fence_read_data; 
                if( ~Fence_counter[7] )
                    wr_addr <= { Way0_TagV[ Fence_counter[6:0] ][20:0], Fence_counter[6:0], 4'b0 };   //***
                else if( Fence_counter[7] )
                    wr_addr <= { Way1_TagV[ Fence_counter[6:0] ][20:0], Fence_counter[6:0], 4'b0 };   //***

            end
            else 
                Fence_state <= Fence_Write;
        end
    default:
        Fence_state <= Fence_Idle;
    endcase
end

//state machine transition
always @(posedge clock)begin
    if(reset)begin
        state <= IDLE;
        RB_index <= 7'd0;
        RB_tag <= 21'd0;
        RB_offset <= 1'b0;
        RB_OP <= 1'b0;
        HIT_index <= 1'b0;
        HIT_offset <= 1'b0;
        hit_way0 <= 1'b0;
        hit_way1 <= 1'b0;
        HIT_way0 <= 1'b0;
        HIT_way1 <= 1'b0;
        unshoot <= 1'b0;
        Data_OK <= 1'b0;
        ram4_CEN <= 1'b1;
        ram4_WEN <= 1'b1;
        ram4_bwen <= 128'hffffffffffffffffffffffffffffffff;
        ram4_addr <= 6'b0;
        ram4_wdata <= 128'b0;
        ram5_CEN <= 1'b1;
        ram5_WEN <= 1'b1;
        ram5_bwen <= 128'hffffffffffffffffffffffffffffffff;
        ram5_addr <= 6'b0;
        ram5_wdata <= 128'b0;
        ram6_CEN <= 1'b1;
        ram6_WEN <= 1'b1;
        ram6_bwen <= 128'hffffffffffffffffffffffffffffffff;
        ram6_addr <= 6'b0;
        ram6_wdata <= 128'b0;
        ram7_CEN <= 1'b1;
        ram7_WEN <= 1'b1;
        ram7_bwen <= 128'hffffffffffffffffffffffffffffffff;
        ram7_addr <= 6'b0;
        ram7_wdata <= 128'b0;

        rd_req <= 1'b0;
        rd_addr <= 32'b0;
        wr_req <= 1'b0;
        wr_addr <= 32'b0;
        wr_wstb <= 8'h0;
        wr_data <= 128'b0;

        Replace_cache_data <= 128'b0;

        RB_wdata <= 128'b0;
        RB_BWEN <= 128'hffffffffffffffffffffffffffffffff;
        Bus_retdata <= 128'b0;

        Way0_D <= 128'b0;
        Way1_D <= 128'b0;
    end
    else begin
    case(state)
        IDLE: 
            begin 
                Data_OK <= 1'b0;

                if(Fence_state != Fence_Write)begin
                    wr_req <= 1'b0;
                    wr_addr <= 32'b0;
                    wr_wstb <= 8'h0;
                    wr_data <= 128'b0;
                end

                if(valid & !op ) begin   // read
                    ram4_WEN <= 1'b1;  //if last cycle is write shoot but this cycle is read
                    ram5_WEN <= 1'b1;
                    ram6_WEN <= 1'b1;
                    ram7_WEN <= 1'b1;

                    RB_index <= index;  
                    RB_tag <= tag;
                    RB_offset <= offset[3];
                    RB_OP <= op;

                    if( Way0_TagV[index] == {1'b1,tag} ) begin //hit way0
                        state <= LOOKUP;
                        ram4_CEN <= ~index[6] ? 1'b0 : 1'b1;
                        ram5_CEN <= index[6] ? 1'b0 : 1'b1;
                        ram4_addr <= index[5:0];
                        ram5_addr <= index[5:0];
                        hit_way0 <= 1'b1;
                        hit_way1 <= 1'b0;
                        ram6_CEN <= 1'b1;
                        ram7_CEN <= 1'b1;
                    end
                    else if( Way1_TagV[index] == {1'b1,tag} ) begin //hit way1
                        state <= LOOKUP;
                        ram6_CEN <= ~index[6] ? 1'b0 : 1'b1;
                        ram7_CEN <= index[6] ? 1'b0 : 1'b1;
                        ram6_addr <= index[5:0];
                        ram7_addr <= index[5:0];
                        hit_way1 <= 1'b1;
                        hit_way0 <= 1'b0;
                        ram4_CEN <= 1'b1;
                        ram5_CEN <= 1'b1;
                    end
                    else begin                      //unshoot
                        if(rd_rdy)begin             // only AXI(SRAM) ready cloud generate request
                            rd_req <= 1'b1;
                            rd_addr <= {tag,index,4'b0};
                        end
                        state <= MISS;
                        unshoot <= 1'b1;

                        ram5_CEN <= 1'b1;     //if last cycle write shoot but this cycle unshoot
                        ram4_CEN <= 1'b1;
                        ram6_CEN <= 1'b1;
                        ram7_CEN <= 1'b1;
                    end
                end
                else if( valid && op) begin  //wirite
                    RB_index <= index;  
                    RB_tag <= tag;
                    RB_offset <= offset[3];
                    RB_wdata <= wdata_128;
                    RB_OP <= op;
                    RB_BWEN <= wstrb_to_bwen_128;

                    if( Way0_TagV[index] == { 1'b1,tag } ) begin //hit way0
                        state <= IDLE;

                        ram4_CEN <= ~index[6] ? 1'b0 : 1'b1;
                        ram4_WEN <= ~index[6] ? 1'b0 : 1'b1;
                        ram4_wdata <= ~index[6] ? wdata_128 : 128'b0;
                        ram4_bwen <= ~index[6] ? wstrb_to_bwen_128 : 128'b0;
                        ram4_addr <= index[5:0];

                        ram5_CEN <= index[6] ? 1'b0 : 1'b1;
                        ram5_WEN <= index[6] ? 1'b0 : 1'b1;
                        ram5_wdata <= index[6] ? wdata_128 : 128'b0;
                        ram5_bwen <= index[6] ? wstrb_to_bwen_128 : 128'b0;
                        ram5_addr <= index[5:0];

                        Way0_D[index] <= 1'b1;
                        ram6_CEN <= 1'b1;
                        ram6_WEN <= 1'b1;
                        ram7_CEN <= 1'b1;
                        ram7_WEN <= 1'b1;
                    end
                    else if( Way1_TagV[index] == { 1'b1,tag } ) begin //hit way1
                        state <= IDLE;

                        ram6_CEN <= ~index[6] ? 1'b0 : 1'b1;
                        ram6_WEN <= ~index[6] ? 1'b0 : 1'b1;
                        ram6_wdata <= ~index[6] ? wdata_128 : 128'b0;
                        ram6_bwen <= ~index[6] ? wstrb_to_bwen_128 : 128'b0;
                        ram6_addr <= index[5:0];

                        ram7_CEN <= index[6] ? 1'b0 : 1'b1;
                        ram7_WEN <= index[6] ? 1'b0 : 1'b1;
                        ram7_wdata <= index[6] ? wdata_128 : 128'b0;
                        ram7_bwen <= index[6] ? wstrb_to_bwen_128 : 128'b0;
                        ram7_addr <= index[5:0];
                        
                        Way1_D[index] <= 1'b1;
                        ram4_CEN <= 1'b1;
                        ram4_WEN <= 1'b1;
                        ram5_CEN <= 1'b1;
                        ram5_WEN <= 1'b1;
                    end
                    else begin                      // unshoot
                        if(rd_rdy)begin             // only AXI(SRAM) ready cloud generate request
                            rd_req <= 1'b1;
                            rd_addr <= {tag,index,4'b0};
                        end
                        state <= MISS;
                        unshoot <= 1'b1;

                        ram4_CEN <= 1'b1;
                        ram4_WEN <= 1'b1;
                        ram5_CEN <= 1'b1;
                        ram5_WEN <= 1'b1;
                        ram6_CEN <= 1'b1;
                        ram6_WEN <= 1'b1;
                        ram7_CEN <= 1'b1;
                        ram7_WEN <= 1'b1;
                    end
                end
                else begin    //if no request
                    state <= IDLE;

                    ram4_CEN <= 1'b1;                //last state maybe replace, so need stop write ram
                    ram4_WEN <= 1'b1;
                    ram4_bwen <= 128'hffffffffffffffffffffffffffffffff;
                    ram4_addr <= 6'b0;
                    ram4_wdata <= 128'b0;
                    ram5_CEN <= 1'b1;
                    ram5_WEN <= 1'b1;
                    ram5_bwen <= 128'hffffffffffffffffffffffffffffffff;
                    ram5_addr <= 6'b0;
                    ram5_wdata <= 128'b0;
                    ram6_CEN <= 1'b1;
                    ram6_WEN <= 1'b1;
                    ram6_bwen <= 128'hffffffffffffffffffffffffffffffff;
                    ram6_addr <= 6'b0;
                    ram6_wdata <= 128'b0;
                    ram7_CEN <= 1'b1;
                    ram7_WEN <= 1'b1;
                    ram7_bwen <= 128'hffffffffffffffffffffffffffffffff;
                    ram7_addr <= 6'b0;
                    ram7_wdata <= 128'b0;
                    hit_way0 <= 1'b0;
                    hit_way1 <= 1'b0;
                end
            end
        LOOKUP:                      //only hit could enter state:LOOKUP
            begin
                if( hit_way0 || hit_way1) begin
                    Data_OK <= 1'b1;
                    HIT_index <= RB_index[6];  
                    HIT_offset <= RB_offset;
                    HIT_way0 <= hit_way0;
                    HIT_way1 <= hit_way1;
                end

                if( !valid ) begin             //finish and no new request
                    state <= IDLE;
                    ram4_CEN <= 1'b1;
                    ram5_CEN <= 1'b1;
                    ram6_CEN <= 1'b1;
                    ram7_CEN <= 1'b1;
                    hit_way0 <= 1'b0;
                    hit_way1 <= 1'b0;
                end
                else if( valid & !op) begin   // read
                    RB_index <= index;  
                    RB_tag <= tag;
                    RB_offset <= offset[3];
                    if( Way0_TagV[index] == {1'b1,tag} ) begin //hit way0
                        state <= LOOKUP;
                        ram4_CEN <= ~index[6] ? 1'b0 : 1'b1;
                        ram5_CEN <= index[6] ? 1'b0 : 1'b1;
                        ram4_addr <= index[5:0];
                        ram5_addr <= index[5:0];
                        hit_way0 <= 1'b1;
                        hit_way1 <= 1'b0;
                        ram6_CEN <= 1'b1;
                        ram7_CEN <= 1'b1;
                    end
                    else if( Way1_TagV[index] == {1'b1,tag} ) begin //hit way1
                        state <= LOOKUP;
                        ram6_CEN <= ~index[6] ? 1'b0 : 1'b1;
                        ram7_CEN <= index[6] ? 1'b0 : 1'b1;
                        ram6_addr <= index[5:0];
                        ram7_addr <= index[5:0];
                        hit_way1 <= 1'b1;
                        hit_way0 <= 1'b0;
                        ram4_CEN <= 1'b1;
                        ram5_CEN <= 1'b1;
                    end
                    else begin                      // unshoot
                        if(rd_rdy)begin             // only AXI(SRAM) ready cloud generate request
                            rd_req <= 1'b1;
                            rd_addr <= {tag,index,4'b0};
                        end
                        state <= MISS;
                        unshoot <= 1'b1;

                        ram5_CEN <= 1'b1;     //for read, if last cycle shoot but this cycle unshoot
                        ram4_CEN <= 1'b1;
                        ram6_CEN <= 1'b1;
                        ram7_CEN <= 1'b1;
                        hit_way0 <= 1'b0;
                        hit_way1 <= 1'b0;
                    end
                end
                else if( valid && op ) begin  //wirite
                    hit_way0 <= 1'b0;
                    hit_way1 <= 1'b0;

                    RB_index <= index;  
                    RB_tag <= tag;
                    RB_offset <= offset[3];
                    RB_wdata <= wdata_128;
                    RB_OP <= op;
                    RB_BWEN <= wstrb_to_bwen_128;

                    if( Way0_TagV[index] == { 1'b1,tag } ) begin //hit way0
                        state <= IDLE;

                        ram4_CEN <= ~index[6] ? 1'b0 : 1'b1;
                        ram4_WEN <= ~index[6] ? 1'b0 : 1'b1;
                        ram4_wdata <= ~index[6] ? wdata_128 : 128'b0;
                        ram4_bwen <= ~index[6] ? wstrb_to_bwen_128 : 128'b0;
                        ram4_addr <= index[5:0];

                        ram5_CEN <= index[6] ? 1'b0 : 1'b1;
                        ram5_WEN <= index[6] ? 1'b0 : 1'b1;
                        ram5_wdata <= index[6] ? wdata_128 : 128'b0;
                        ram5_bwen <= index[6] ? wstrb_to_bwen_128 : 128'b0;
                        ram5_addr <= index[5:0];

                        Way0_D[index] <= 1'b1;
                        ram6_CEN <= 1'b1;
                        ram7_CEN <= 1'b1;
                    end
                    else if( Way1_TagV[index] == { 1'b1,tag } ) begin //hit way1
                        state <= IDLE;

                        ram6_CEN <= ~index[6] ? 1'b0 : 1'b1;
                        ram6_WEN <= ~index[6] ? 1'b0 : 1'b1;
                        ram6_wdata <= ~index[6] ? wdata_128 : 128'b0;
                        ram6_bwen <= ~index[6] ? wstrb_to_bwen_128 : 128'b0;
                        ram6_addr <= index[5:0];

                        ram7_CEN <= index[6] ? 1'b0 : 1'b1;
                        ram7_WEN <= index[6] ? 1'b0 : 1'b1;
                        ram7_wdata <= index[6] ? wdata_128 : 128'b0;
                        ram7_bwen <= index[6] ? wstrb_to_bwen_128 : 128'b0;
                        ram7_addr <= index[5:0];
                        
                        Way1_D[index] <= 1'b1;
                        ram4_CEN <= 1'b1;
                        ram5_CEN <= 1'b1;
                    end
                    else begin                      // unshoot
                        if(rd_rdy)begin             // only AXI(SRAM) ready cloud generate request
                            rd_req <= 1'b1;
                            rd_addr <= {tag,index,4'b0};
                        end
                        state <= MISS;
                        unshoot <= 1'b1;

                        ram4_CEN <= 1'b1;           //for read, if last cycle read shoot but this cycle not shoot
                        ram5_CEN <= 1'b1;
                        ram6_CEN <= 1'b1;
                        ram7_CEN <= 1'b1;
                    end
                end
            end
        MISS:
            begin
                rd_req <= 1'b0;
                rd_addr <= 32'b0;
                Data_OK <= 1'b0;
                HIT_way0 <= hit_way0;
                HIT_way1 <= hit_way1;

                if(ret_valid & !ret_last) begin //bus return data
                    state <= MISS;
                    Bus_retdata[63:0] <= ret_data; 
                end
                else if(ret_valid & ret_last)begin        //got whole cacheline from AXI
                    state <= REPLACE;
                    Bus_retdata[127:64] <= ret_data;
                    Data_OK <= 1'b1;
                end
                else 
                    state <= MISS;
            end
        REPLACE:
            begin
                Data_OK <= 1'b0;
                if( RB_index[6] && ~Way0_TagV[ RB_index ][21] )begin  //regard invalid as empty
                    state <= IDLE;
                    unshoot <= 1'b0;
                    ram5_CEN <= 1'b0;
                    ram5_WEN <= 1'b0;
                    ram5_bwen <= 128'b0;
                    ram5_addr <= RB_index[5:0];
                    ram5_wdata <= RB_OP ? ( Bus_retdata & RB_BWEN | RB_wdata & ~RB_BWEN ): Bus_retdata;
                    Way0_TagV[RB_index] <= {1'b1,RB_tag};
                    Way0_D[RB_index] <= RB_OP;
                end
                else if( !RB_index[6] && ~Way0_TagV[ RB_index ][21] )begin
                    state <= IDLE;
                    unshoot <= 1'b0;
                    ram4_CEN <= 1'b0;
                    ram4_WEN <= 1'b0;
                    ram4_bwen <= 128'b0;
                    ram4_addr <= RB_index[5:0];
                    ram4_wdata <= RB_OP ? ( Bus_retdata & RB_BWEN | RB_wdata & ~RB_BWEN ): Bus_retdata;
                    Way0_TagV[RB_index] <= {1'b1,RB_tag};
                    Way0_D[RB_index] <= RB_OP;
                end
                else if( RB_index[6] && ~Way1_TagV[ RB_index ][21] )begin
                    state <= IDLE;
                    unshoot <= 1'b0;
                    ram7_CEN <= 1'b0;
                    ram7_WEN <= 1'b0;
                    ram7_bwen <= 128'b0;
                    ram7_addr <= RB_index[5:0];
                    ram7_wdata <= RB_OP ? ( Bus_retdata & RB_BWEN | RB_wdata & ~RB_BWEN ): Bus_retdata;
                    Way1_TagV[RB_index] <= {1'b1,RB_tag};
                    Way1_D[RB_index] <= RB_OP;
                end
                else if( !RB_index[6] && ~Way1_TagV[ RB_index ][21])begin
                    state <= IDLE;
                    unshoot <= 1'b0;     
                    ram6_CEN <= 1'b0;
                    ram6_WEN <= 1'b0;
                    ram6_bwen <= 128'b0;
                    ram6_addr <= RB_index[5:0];
                    ram6_wdata <= RB_OP ? ( Bus_retdata & RB_BWEN | RB_wdata & ~RB_BWEN ): Bus_retdata;
                    Way1_TagV[RB_index] <= {1'b1,RB_tag};
                    Way1_D[RB_index] <= RB_OP;
                end
                else if( Way0_TagV[ RB_index ][21] && Way1_TagV[ RB_index ][21] ) begin   //If both full , replace way0
                    if( ~Way0_D[RB_index] ) begin      //If way_0 cache is not dirty, replace way0
                        state <= IDLE;
                        unshoot <= 1'b0;
                        if( RB_index[6] )begin  
                            ram5_CEN <= 1'b0;
                            ram5_WEN <= 1'b0;
                            ram5_bwen <= 128'b0;
                            ram5_addr <= RB_index[5:0];
                            ram5_wdata <= RB_OP ? ( Bus_retdata & RB_BWEN | RB_wdata & ~RB_BWEN ): Bus_retdata;
                            Way0_TagV[RB_index] <= {1'b1,RB_tag};
                            Way0_D[RB_index] <= RB_OP;
                        end
                        else if( !RB_index[6] )begin    
                            ram4_CEN <= 1'b0;
                            ram4_WEN <= 1'b0;
                            ram4_bwen <= 128'b0;
                            ram4_addr <= RB_index[5:0];
                            ram4_wdata <= RB_OP ? ( Bus_retdata & RB_BWEN | RB_wdata & ~RB_BWEN ): Bus_retdata;
                            Way0_TagV[RB_index] <= {1'b1,RB_tag};
                            Way0_D[RB_index] <= RB_OP;
                        end
                    end
                    else if( Way0_D[RB_index] && ~Way1_D[RB_index] )begin
                        state <= IDLE;
                        unshoot <= 1'b0;
                        if( RB_index[6]  )begin  
                            ram7_CEN <= 1'b0;
                            ram7_WEN <= 1'b0;
                            ram7_bwen <= 128'b0;
                            ram7_addr <= RB_index[5:0];
                            ram7_wdata <= RB_OP ? ( Bus_retdata & RB_BWEN | RB_wdata & ~RB_BWEN ): Bus_retdata;
                            Way1_TagV[RB_index] <= {1'b1,RB_tag};
                            Way1_D[RB_index] <= RB_OP;
                        end
                        else if( !RB_index[6] )begin
                            ram6_CEN <= 1'b0;
                            ram6_WEN <= 1'b0;
                            ram6_bwen <= 128'b0;
                            ram6_addr <= RB_index[5:0];
                            ram6_wdata <= RB_OP ? ( Bus_retdata & RB_BWEN | RB_wdata & ~RB_BWEN ): Bus_retdata;
                            Way1_TagV[RB_index] <= {1'b1,RB_tag};
                            Way1_D[RB_index] <= RB_OP;
                        end
                    end
                    else if(( Way0_D[RB_index] && Way1_D[RB_index] ))begin   //both dirty, replace way_0 , get cache data
                        state <= REWAIT;
                        ram4_CEN <= ~RB_index[6] ? 1'b0 : 1'b1;
                        ram5_CEN <= RB_index[6] ? 1'b0 : 1'b1;
                        ram4_addr <= RB_index[5:0];
                        ram5_addr <= RB_index[5:0];
                    end 
                end
            end
        REWAIT:
            begin
                if( ram4_CEN & ram5_CEN )begin
                    state <= REFILL;
                    Replace_cache_data <= RB_index[6] ? sram5_rdata : sram4_rdata;
                end
                else begin
                    state <= REWAIT; 
                    ram4_CEN <= 1'b1;
                    ram5_CEN <= 1'b1;
                end
            end
        REFILL:
            begin
                if( wr_rdy ) begin     // 向AXI 发出写请求, 同时将AXI获得的数据写回到cache中
                    //state <= IDLE;
                    //unshoot <= 1'b0;
                    state <= WAIT_WR_RESPONSE;

                    wr_req <= 1'b1;
                    wr_addr <= { Way0_TagV[ RB_index ][20:0],RB_index,4'b0 };  //***
                    wr_wstb <= 8'hff;
                    wr_data <= Replace_cache_data;

                    if( RB_index[6] )begin  
                        ram5_CEN <= 1'b0;
                        ram5_WEN <= 1'b0;
                        ram5_bwen <= 128'b0;
                        ram5_addr <= RB_index[5:0];
                        ram5_wdata <= RB_OP ? ( Bus_retdata & RB_BWEN | RB_wdata & ~RB_BWEN ): Bus_retdata;
                        Way0_TagV[RB_index] <= {1'b1,RB_tag};
                        Way0_D[RB_index] <= RB_OP;
                    end
                    else if( !RB_index[6] )begin    
                        ram4_CEN <= 1'b0;
                        ram4_WEN <= 1'b0;
                        ram4_bwen <= 128'b0;
                        ram4_addr <= RB_index[5:0];
                        ram4_wdata <= RB_OP ? ( Bus_retdata & RB_BWEN | RB_wdata & ~RB_BWEN ): Bus_retdata;
                        Way0_TagV[RB_index] <= {1'b1,RB_tag};
                        Way0_D[RB_index] <= RB_OP;
                    end
                end
                else begin
                    state <= REFILL; 
                end
            end
        WAIT_WR_RESPONSE:
            begin
                    wr_req <= 1'b0;
                    wr_addr <= 32'b0;
                    wr_wstb <= 8'h0;
                    wr_data <= 128'b0;

                    ram4_CEN <= 1'b1;                //last state maybe replace, so need stop write ram
                    ram4_WEN <= 1'b1;
                    ram4_bwen <= 128'hffffffffffffffffffffffffffffffff;
                    ram4_addr <= 6'b0;
                    ram4_wdata <= 128'b0;
                    ram5_CEN <= 1'b1;
                    ram5_WEN <= 1'b1;
                    ram5_bwen <= 128'hffffffffffffffffffffffffffffffff;
                    ram5_addr <= 6'b0;
                    ram5_wdata <= 128'b0;

                    if(wr_resp) begin
                        state <= IDLE;
                        unshoot <= 1'b0;
                    end
                    else state <= WAIT_WR_RESPONSE;
            end
        default:
            state <= IDLE;
    endcase 
    end
end

assign read_ramdata = Data_OK ? ( HIT_way0 ? ( HIT_index ? sram5_rdata : sram4_rdata ) : ( HIT_way1 ? ( HIT_index ? sram7_rdata : sram6_rdata) : 128'b0 ) ) : 128'b0;
assign rdata = Data_OK ? ( ( state == REPLACE ) ? (  RB_offset ?  Bus_retdata[127:64] : Bus_retdata[63:0] ) : ( HIT_offset ?  read_ramdata[127:64] : read_ramdata[63:0] ) ) : 64'b0;

assign data_ok = Data_OK;

assign sram4_addr = ~ram4_CEN ? ram4_addr : Fence_ram4_addr;
assign sram4_cen = ram4_CEN & Fence_ram4_CEN;
assign sram4_wen = ram4_WEN;
assign sram4_wmask = ram4_bwen;
assign sram4_wdata = ram4_wdata;

assign sram5_addr = ~ram5_CEN ? ram5_addr : Fence_ram5_addr;
assign sram5_cen = ram5_CEN & Fence_ram5_CEN;
assign sram5_wen = ram5_WEN;
assign sram5_wmask = ram5_bwen;
assign sram5_wdata = ram5_wdata;

assign sram6_addr = ~ram6_CEN ? ram6_addr : Fence_ram6_addr;
assign sram6_cen = ram6_CEN & Fence_ram6_CEN;
assign sram6_wen = ram6_WEN;
assign sram6_wmask = ram6_bwen;
assign sram6_wdata = ram6_wdata;

assign sram7_addr = ~ram7_CEN ? ram7_addr : Fence_ram7_addr;
assign sram7_cen = ram7_CEN & Fence_ram7_CEN;
assign sram7_wen = ram7_WEN;
assign sram7_wmask = ram7_bwen;
assign sram7_wdata = ram7_wdata;

endmodule
