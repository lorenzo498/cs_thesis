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
#include "Keccak256.h"
#include <stdio.h>

/*
00000000
47868c0000000000
0000c350
e242e54155b1abc71fc118065270cecaaf8b77683b9aca
*/
// Example of Ethereum txn using library


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

int main() {
  uint8_t publicKey[11]="CICCIOBELLO";
  uint8_t hashed[32];
  
  ethers_keccak256(publicKey, 11, hashed);
  debug_hexstring(hashed, 32);

  return 0;

}