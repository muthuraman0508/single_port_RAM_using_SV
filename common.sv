parameter W = 8;
parameter D = 16;
parameter addr_w = 4;
parameter r_time = 2;
mailbox gen2bfm = new();
mailbox mon2cov = new();
mailbox mon2sbd = new();

class common;
  static int count = 3;
  static string testname ="write_n_read";
  static int num_matches;
  static int num_missmatches;
  static int bfm_count;
endclass

