/**
 * RLP Serializer
 * https://github.com/afkamalipour/simple-rlp
 *
 * This library implements the RLP Encoding scheme used by Ethereum.
 * The specifications referred to are available at the URL below. 
 * Spec: https://github.com/ethereum/wiki/wiki/%5BEnglish%5D-RLP
 * 
 */

/**
 * MIT License
 *
 * Copyright (c) 2020 Aurash Kamalipour <afkamalipour@gmail.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
#include "rlp_serializer.h"
#include <stdio.h>
#include "Keccak256.h"
#include "ecdsa.h"

/*
00000000
47868c0000000000
0000c350
e242e54155b1abc71fc118065270cecaaf8b77683b9aca
*/
// Example of Ethereum txn using library
uint8_t *myString;


uint8_t _nonce[] = {0x0};
RlpElement_t nonce = {
  .buff = _nonce,
  .len = sizeof(_nonce),
  .type = RLP_TYPE_INT8
};
uint8_t _gasPrice[] = {0xC8};
RlpElement_t gasPrice = {
  .buff = _gasPrice,
  .len = 4,
  .type = RLP_TYPE_INT32
};
uint8_t _gasLimit[] = {0xC8};
RlpElement_t gasLimit = {
  .buff = _gasLimit,
  .len = 4,
  .type = RLP_TYPE_INT32
};
uint8_t _addressTo[] = {0xcD};
RlpElement_t addressTo = {
  .buff = _addressTo,
  .len = sizeof(_addressTo),
  .type = RLP_TYPE_BYTE_ARRAY
};
uint8_t _value[] = {0x1};
RlpElement_t value = {
  .buff = _value,
  .len = sizeof(_value),
  .type = RLP_TYPE_BYTE_ARRAY
};
uint8_t _data[] = {0x53, 0x55, 0x50, 0x45, 0x52};
RlpElement_t data = {
  .buff = _data,
  .len = sizeof(_data),
  .type = RLP_TYPE_BYTE_ARRAY
};
uint8_t _v[] = {0x539};
RlpElement_t v = {
  .buff = NULL,
  .len = 0,
  .type = RLP_TYPE_BYTE_ARRAY
};
uint8_t _r[] = {0xE3};
RlpElement_t r = {
  .buff = _r,
  .len = sizeof(_r),
  .type = RLP_TYPE_BYTE_ARRAY
};
uint8_t _s[] = {0x138};
RlpElement_t s = {
  .buff = _s,
  .len = sizeof(_s),
  .type = RLP_TYPE_BYTE_ARRAY
};

// Gather
RlpElement_t const *const ethTxn[] = {&nonce, &gasPrice, &gasLimit, &addressTo, &value, &v, &r, &s};


uint32_t num0 = 42;

// Tokenize the data
RlpElement_t t = {
  .buff = &num0, .len = sizeof(num0)
};

static void debug_hexstring(const void *const address, size_t nBytes)
{
     uint8_t *a = ((uint8_t*)(address));
     unsigned long int b = ((volatile unsigned long int)(nBytes));
     if ((NULL == a) || (b <= 0)) return;
     for (unsigned long int i = 1; i <= b; i++) {
        
       if(a[i-1] < 0x10)
          printf("0%x",a[i-1]);
        else
          printf("%x",a[i-1]);
     }
     printf("\n");
}

static void convert_rlp_string_to_hex(const void *const address, size_t nBytes) 
{
    myString = k_malloc(nBytes);
    uint8_t *a = ((uint8_t*)(address));
    unsigned long int b = ((volatile unsigned long int)(nBytes));
    if ((NULL == a) || (b <= 0)) return;
    for (unsigned long int i = 1; i <= b; i++) {
      strncat(myString, &a[i-1], 1);
    }
    // Convert text to hex.
    for (int i = 0, j = 0; i < nBytes; ++i, j += 2)
      sprintf(myString + j, "%02x", a[i] &0xff);
}


void ethers_keccak256(const uint8_t *data, uint16_t length, uint8_t *result) {

    SHA3_CTX context;
    keccak_init(&context);
    keccak_update(&context, (const unsigned char*)data, (size_t)length);
    keccak_final(&context, (unsigned char*)result);

    // Clear out the contents of what we hashed (in case it was secret)
    memset((char*)&context, 0, sizeof(SHA3_CTX));
}

int main() {
    uint8_t rlpTx[2048] = {0};
    int outputLen = 0;
    outputLen = rlp_encode_list(rlpTx, sizeof(rlpTx)/sizeof(rlpTx[0]), ethTxn, sizeof(ethTxn)/sizeof(ethTxn[0]));
    if(outputLen < 0)
      printf("error, return code: %d\r\n", outputLen);
    else {
      // printf("RLP encoded eth txn [%d B]:\r\n", outputLen);
      debug_hexstring(rlpTx, outputLen);
    }
    convert_rlp_string_to_hex(rlpTx, outputLen);

    uint8_t hashed[32];
    
    ethers_keccak256(myString, strlen(myString), hashed);
    debug_hexstring(hashed, 32);
    perform_ecdsa();

    uint8_t _ecdsa[] = {0xb2, 0x12, 0x98, 0xaa};

    // Tokenize the data
    RlpElement_t ecdsa = {
      .buff = _ecdsa,
      .len = sizeof(_ecdsa),
      .type = RLP_TYPE_INT32
    };

    // RlpElement_t const *const testOneElement[] = {&ecdsa};
    // // Serialize the data
    
    // uint8_t rlpRaw[2048] = {0};
    // // int len = rlp_encode_element(rlpRaw, sizeof(rlpRaw)/sizeof(rlpRaw[0]), &t);

    // int len = rlp_encode_list(rlpRaw, sizeof(rlpRaw)/sizeof(rlpRaw[0]), testOneElement, sizeof(testOneElement)/sizeof(testOneElement[0]));
    // if(len < 0)
    //   printf("error, return code: %d\r\n", len);
    // else {
    //   printf("RLP encoded eth txn [%d B]:\r\n", len);
    //   debug_hexstring(rlpRaw, len);
    // }
  return 0;

}



