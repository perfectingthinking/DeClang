// RUN: llvm-mc -arch=amdgcn -show-encoding %s | FileCheck -check-prefix=GCN -check-prefix=SI %s
// RUN: llvm-mc -arch=amdgcn -mcpu=tonga -show-encoding %s | FileCheck -check-prefix=GCN -check-prefix=SI %s

exp mrt0 off, off, off, off
// GCN: exp mrt0 off, off, off, off ; encoding: [0x00,0x00,0x00,0xf8,0x00,0x00,0x00,0x00]

exp mrt0 off, off, off, off done
// GCN: exp mrt0 off, off, off, off done ; encoding: [0x00,0x08,0x00,0xf8,0x00,0x00,0x00,0x00]

exp mrt0 v4, off, off, off done
// GCN: exp mrt0 v4, off, off, off done ; encoding: [0x01,0x08,0x00,0xf8,0x04,0x00,0x00,0x00]

exp mrt0 off, v3, off, off done
// GCN: exp mrt0 off, v3, off, off done ; encoding: [0x02,0x08,0x00,0xf8,0x00,0x03,0x00,0x00]

exp mrt0 off, off, v2, off done
// GCN: exp mrt0 off, off, v2, off done ; encoding: [0x04,0x08,0x00,0xf8,0x00,0x00,0x02,0x00]

exp mrt0 off, off, off, v1 done
// GCN: exp mrt0 off, off, off, v1 done ; encoding: [0x08,0x08,0x00,0xf8,0x00,0x00,0x00,0x01]

exp mrt0 v4, v3, off, off done
// GCN: exp mrt0 v4, v3, off, off done ; encoding: [0x03,0x08,0x00,0xf8,0x04,0x03,0x00,0x00]

exp mrt0 v4, off, v2, off done
// GCN: exp mrt0 v4, off, v2, off done ; encoding: [0x05,0x08,0x00,0xf8,0x04,0x00,0x02,0x00]

exp mrt0 v4, off, off, v1
// GCN: exp mrt0 v4, off, off, v1 ; encoding: [0x09,0x00,0x00,0xf8,0x04,0x00,0x00,0x01]

exp mrt0 v4, off, off, v1 done
// GCN: exp mrt0 v4, off, off, v1 done ; encoding: [0x09,0x08,0x00,0xf8,0x04,0x00,0x00,0x01]

exp mrt0 v4, v3, v2, v1
// GCN: exp mrt0 v4, v3, v2, v1 ; encoding: [0x0f,0x00,0x00,0xf8,0x04,0x03,0x02,0x01]

exp mrt0 v4, v3, v2, v1 done
// GCN: exp mrt0 v4, v3, v2, v1 done ; encoding: [0x0f,0x08,0x00,0xf8,0x04,0x03,0x02,0x01]

exp mrt7 v1, v1, v1, v1
// GCN: exp mrt7 v1, v1, v1, v1 ; encoding: [0x7f,0x00,0x00,0xf8,0x01,0x01,0x01,0x01]

exp mrt7 v1, v1, v1, v1 done
// GCN: exp mrt7 v1, v1, v1, v1 done ; encoding: [0x7f,0x08,0x00,0xf8,0x01,0x01,0x01,0x01]

exp mrtz v4, v3, v2, v1
// GCN: exp mrtz v4, v3, v2, v1 ; encoding: [0x8f,0x00,0x00,0xf8,0x04,0x03,0x02,0x01]

exp mrtz v4, v3, v2, v1 done
// GCN: exp mrtz v4, v3, v2, v1 done ; encoding: [0x8f,0x08,0x00,0xf8,0x04,0x03,0x02,0x01]

exp null v4, v3, v2, v1
// GCN: exp null v4, v3, v2, v1 ; encoding: [0x9f,0x00,0x00,0xf8,0x04,0x03,0x02,0x01]

exp null v4, v3, v2, v1 done
// GCN: exp null v4, v3, v2, v1 done ; encoding: [0x9f,0x08,0x00,0xf8,0x04,0x03,0x02,0x01]

exp pos0 v4, v3, v2, v1
// GCN: exp pos0 v4, v3, v2, v1 ; encoding: [0xcf,0x00,0x00,0xf8,0x04,0x03,0x02,0x01]

exp pos0 v4, v3, v2, v1 done
// GCN: exp pos0 v4, v3, v2, v1 done ; encoding: [0xcf,0x08,0x00,0xf8,0x04,0x03,0x02,0x01]

exp pos3 v4, v3, v2, v1
// GCN: exp pos3 v4, v3, v2, v1 ; encoding: [0xff,0x00,0x00,0xf8,0x04,0x03,0x02,0x01]

exp pos3 v4, v3, v2, v1 done
// GCN: exp pos3 v4, v3, v2, v1 done ; encoding: [0xff,0x08,0x00,0xf8,0x04,0x03,0x02,0x01]

exp param0 v4, v3, v2, v1
// GCN: exp param0 v4, v3, v2, v1 ; encoding: [0x0f,0x02,0x00,0xf8,0x04,0x03,0x02,0x01]

exp param0 v4, v3, v2, v1 done
// GCN: exp param0 v4, v3, v2, v1 done ; encoding: [0x0f,0x0a,0x00,0xf8,0x04,0x03,0x02,0x01]

exp param31 v4, v3, v2, v1
// GCN: exp param31 v4, v3, v2, v1 ; encoding: [0xff,0x03,0x00,0xf8,0x04,0x03,0x02,0x01]

exp param31 v4, v3, v2, v1 done
// GCN: exp param31 v4, v3, v2, v1 done ; encoding: [0xff,0x0b,0x00,0xf8,0x04,0x03,0x02,0x01]

exp mrt0 v4, v3, v2, v1 vm
// GCN: exp mrt0 v4, v3, v2, v1 vm ; encoding: [0x0f,0x10,0x00,0xf8,0x04,0x03,0x02,0x01]

exp mrt0 v4, v3, v2, v1 done vm
// GCN: exp mrt0 v4, v3, v2, v1 done vm ; encoding: [0x0f,0x18,0x00,0xf8,0x04,0x03,0x02,0x01]