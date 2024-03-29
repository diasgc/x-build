#include <iostream>
#include <cassert>
#include <string>
#include <fstream>
#include <streambuf>
#include <algorithm>
#include <cmath>

#include <unistd.h>
#include <getopt.h>

#ifdef __unix__
#define LF "\n"
#else
#define LF "\r\n"
#endif

namespace lzstring { 
  std::string compressToBase64(const std::string& uncompressed);
  std::string decompressFromBase64(const std::string& compressed);
  std::string toBaseN(const std::string& src, const std::string& key);
  std::string fromBaseN(const std::string& src, const std::string& key);
  std::string strPad(const std::string& src, const int pad, const char c);
  const std::string BASE91_HENKE = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!#$%&()*+,./:;<=>?@[]^_`{|}~\"";
  const std::string BASE91_RLYEH = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!#$%&()*+,./:;-=\\?@[]^_`{|}~\'";
  const std::string BASE85_Z85   = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.-:+=^!/*?&<>()[]{}@%$#";
  const std::string BASE64_STD   = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
} // fwd

int usage(std::string cmd){
  std::cerr << "Usage: " << cmd << " [-h|--help][-c|--compress|-d|--decompress][-f,--file][-s|--string][-|--stdin] input" << std::endl;
  return 1;
}

std::string split(const std::string& str, const size_t linelength){

    size_t count = str.length() / linelength;
    auto start = str.begin();
    std::string sub;

    for (size_t i = 0; i < count; i++){
        size_t startoffset = i * linelength;
        size_t endoffset = startoffset + linelength;
        sub = sub.append(std::string(start + startoffset, start + endoffset)).append(LF);
    }
    if (str.length() % linelength){
        sub.append(std::string(start + count * linelength, str.end()));
    }
    return sub;
}

void split2(std::string& str, const size_t w){
  size_t s = str.length();
  int p = w;
  while(p < s){
    str.insert(p,LF);
    p += w + 1;
  }
}

#ifdef __TEST__
int main2(int argc, char * argv[]){
  
  std::string arg, str, out;
  std::string key = lzstring::BASE64_STD;
  std::string bname;

  int mode  = -1;
  int w     = 0;

  for(;;){
    switch(getopt(argc, argv, "hcdf:s:-w:k:b:")){
      case '?':
      case 'h':
      default :
        return usage(argv[0]);
      case 'd':
        mode = 1;
        continue;
      case 'c':
        mode = 0;
        continue;
      case '-':
        str.assign((std::istreambuf_iterator<char>(std::cin)),
        std::istreambuf_iterator<char>());
        continue;
      case 's':
        str=std::string(optarg);
        continue;
      case 'f':
        std::ifstream t(optarg);
        t.seekg(0, std::ios::end);   
        str.reserve(t.tellg());
        t.seekg(0, std::ios::beg);
        str.assign((std::istreambuf_iterator<char>(t)),
        std::istreambuf_iterator<char>());
        continue;
      case 'w':
        w = atoi(optarg);
        continue;
      case 'k':
        key = optarg;
        continue;
      case 'b':
        bname = optarg;
        if (bname == "BASE91_HENKE" || bname == "B91H"){
          key = lzstring::BASE91_HENKE;
        } else if (bname == "BASE91_RLYEH" || bname == "B91R"){
          key = lzstring::BASE91_RLYEH;
        } else if (bname == "BASE85" || bname == "B85" || bname == "Z85"){
          key = lzstring::BASE85_Z85;
        } else {
          // default
          key = lzstring::BASE64_STD;
        }
        continue;
      case -1:
        break;
    }
    break;
  }
  
  switch(mode){
      case 0:
        out=lzstring::toBaseN(str,key);
        if (w > 0){
          out=split(out,w);
        }
        break;
      case 1:
        str.erase(std::remove(str.begin(), str.end(), '\n'), str.end());
        out = lzstring::fromBaseN(str, key);
        break;
      default:
        return usage(argv[0]);
  }
  std::cout << out << std::endl << std::flush;
  return 0;

}
#endif

int main(int argc, char *argv[]){
  
  std::string arg, str, out;
  std::string key = lzstring::BASE64_STD;

  int mode=-1;
  int input=-1;
  int idx=-1;
  int w=0;
  

  for(int i=0; i < argc; i++){
    arg=std::string(argv[i]);
    if(arg == "-c" || arg == "--compress"){
      mode=0;
    } else if(arg == "-d" || arg == "--decompress"){
      mode=1;
    } else if(arg == "-f" || arg == "--file"){
      input=1;
      i++;
      idx=i;
    } else if(arg == "-s" || arg == "--string"){
      input=0;
      i++;
      idx=i;
    } else if(arg == "-"  || arg == "--stdin"){
      input=2;
    } else if(arg == "-h" || arg == "--help"){
      return usage(argv[0]);
    } else if(arg == "-w" || arg == "--width"){
      i++;
      w=atoi(argv[i]);
    } else if(arg == "-k" || arg == "--key"){
      i++;
      key=argv[i];
    } else if(arg == "-b" || arg == "--base"){
      i++;
      const std::string bname=argv[i];
      if (bname == "BASE91_HENKE" || bname == "B91H"){
        key = lzstring::BASE91_HENKE;
      } else if (bname == "BASE91_RLYEH" || bname == "B91R"){
        key = lzstring::BASE91_RLYEH;
      } else if (bname == "BASE85" || bname == "B85" || bname == "Z85"){
        key = lzstring::BASE85_Z85;
      } else {
        // default
        key = lzstring::BASE64_STD;
      }
    }
  }
  if (input == 0 && idx > 0 && idx < argc){
    str=std::string(argv[idx]);
  } else if (input == 1 && idx > 0 && idx < argc){
    std::ifstream t(argv[idx]);
    t.seekg(0, std::ios::end);   
    str.reserve(t.tellg());
    t.seekg(0, std::ios::beg);
    str.assign((std::istreambuf_iterator<char>(t)),
      std::istreambuf_iterator<char>());
  } else if (input == 2){
    str.assign((std::istreambuf_iterator<char>(std::cin)),
      std::istreambuf_iterator<char>());
  }
  if (mode == 0){
    out=lzstring::toBaseN(str,key);
    if (w > 0){
      out=split(out,w);
    }
  } else if (mode == 1){
    str.erase(std::remove(str.begin(), str.end(), '\n'), str.end());
    out = lzstring::fromBaseN(str,key);
  } else {
    return usage(argv[0]);
  }
  std::cout << out << std::endl << std::flush;
  return 0;
}










// lz-string.hpp
#include <string>
#include <unordered_map>

namespace lzstring
{
  using string = std::string;

namespace __inner
{
  const string BASE64_STD{"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="};
  const string::value_type equal{'='};

  int charCodeAt(const string& str, int pos)
  {
    return static_cast<int>(str.at(pos));
  }

  string f(int ascii)
  {
    return {static_cast<string::value_type>(ascii)};
  }

  template <typename Fn>
  string _compress(const string& uncompressed, int bitsPerChar, Fn getCharFromInt)
  {
    int i = 0;
    int value = 0;

    std::unordered_map<string, int> context_dictionary;
    std::unordered_map<string, bool> context_dictionaryToCreate;

    string context_c;
    string context_wc;
    string context_w;

    int context_enlargeIn = 2; // Compensate for the first entry which should not count
    int context_dictSize = 3;
    int context_numBits = 2;

    string context_data;
    int context_data_val = 0;
    int context_data_position = 0;

    for (size_t ii = 0; ii < uncompressed.length(); ++ii)
    {
      context_c = uncompressed.at(ii);
      if (context_dictionary.count(context_c) == 0)
      {
        context_dictionary[context_c] = context_dictSize++;
        context_dictionaryToCreate[context_c] = true;
      }

      context_wc = context_w + context_c;
      if (context_dictionary.count(context_wc) > 0)
      {
        context_w = context_wc;
      }
      else
      {
        auto context_w_it = context_dictionaryToCreate.find(context_w);
        if (context_w_it != context_dictionaryToCreate.end())
        {
          if (charCodeAt(context_w, 0) < 256)
          {
            for (i = 0; i < context_numBits; ++i)
            {
              context_data_val = (context_data_val << 1);
              if (context_data_position == bitsPerChar - 1)
              {
                context_data_position = 0;
                context_data.push_back(getCharFromInt(context_data_val));
                context_data_val = 0;
              }
              else
              {
                ++context_data_position;
              }
            }
            value = charCodeAt(context_w, 0);
            for (i = 0; i < 8; ++i)
            {
              context_data_val = (context_data_val << 1) | (value & 1);

              if (context_data_position == bitsPerChar - 1)
              {
                context_data_position = 0;
                context_data.push_back(getCharFromInt(context_data_val));
                context_data_val = 0;
              }
              else
              {
                ++context_data_position;
              }
              value = value >> 1;
            }
          }
          else
          {
            value = 1;
            for (i = 0; i < context_numBits; ++i)
            {
              context_data_val = (context_data_val << 1) | value;
              if (context_data_position == bitsPerChar - 1)
              {
                context_data_position = 0;
                context_data.push_back(getCharFromInt(context_data_val));
                context_data_val = 0;
              }
              else
              {
                ++context_data_position;
              }
              value = 0;
            }
            value = charCodeAt(context_w, 0);
            for (i = 0; i < 16; ++i)
            {
              context_data_val = (context_data_val << 1) | (value & 1);
              if (context_data_position == bitsPerChar - 1)
              {
                context_data_position = 0;
                context_data.push_back(getCharFromInt(context_data_val));
                context_data_val = 0;
              }
              else
              {
                ++context_data_position;
              }
              value = value >> 1;
            }
          }
          if (--context_enlargeIn == 0)
          {
            context_enlargeIn = 1 << context_numBits; // Math.pow(2, context_numBits);
            ++context_numBits;
          }
          context_dictionaryToCreate.erase(context_w_it); // delete context_dictionaryToCreate[context_w];
        }
        else
        {
          value = context_dictionary[context_w];
          for (i = 0; i < context_numBits; ++i)
          {
            context_data_val = (context_data_val << 1) | (value & 1);
            if (context_data_position == bitsPerChar - 1)
            {
              context_data_position = 0;
              context_data.push_back(getCharFromInt(context_data_val));
              context_data_val = 0;
            }
            else
            {
              ++context_data_position;
            }
            value = value >> 1;
          }
        }
        if (--context_enlargeIn == 0)
        {
          context_enlargeIn = 1 << context_numBits; // Math.pow(2, context_numBits);
          ++context_numBits;
        }
        // Add wc to the dictionary.
        context_dictionary[context_wc] = context_dictSize++;
        context_w = context_c; // context_w = String(context_c);
      }
    }

    // Output the code for w.
    if (!context_w.empty())
    {
      auto context_w_it = context_dictionaryToCreate.find(context_w);
      if (context_w_it != context_dictionaryToCreate.end())
      {
        if (charCodeAt(context_w, 0) < 256)
        {
          for (i = 0; i < context_numBits; ++i)
          {
            context_data_val = (context_data_val << 1);
            if (context_data_position == bitsPerChar - 1)
            {
              context_data_position = 0;
              context_data.push_back(getCharFromInt(context_data_val));
              context_data_val = 0;
            }
            else
            {
              ++context_data_position;
            }
          }
          value = charCodeAt(context_w, 0);
          for (i = 0; i < 8; ++i)
          {
            context_data_val = (context_data_val << 1) | (value & 1);
            if (context_data_position == bitsPerChar - 1)
            {
              context_data_position = 0;
              context_data.push_back(getCharFromInt(context_data_val));
              context_data_val = 0;
            }
            else
            {
              ++context_data_position;
            }
            value = value >> 1;
          }
        }
        else
        {
          value = 1;
          for (i = 0; i < context_numBits; ++i)
          {
            context_data_val = (context_data_val << 1) | value;
            if (context_data_position == bitsPerChar - 1)
            {
              context_data_position = 0;
              context_data.push_back(getCharFromInt(context_data_val));
              context_data_val = 0;
            }
            else
            {
              ++context_data_position;
            }
            value = 0;
          }
          value = charCodeAt(context_w, 0);
          for (i = 0; i < 16; ++i)
          {
            context_data_val = (context_data_val << 1) | (value & 1);
            if (context_data_position == bitsPerChar - 1)
            {
              context_data_position = 0;
              context_data.push_back(getCharFromInt(context_data_val));
              context_data_val = 0;
            }
            else
            {
              ++context_data_position;
            }
            value = value >> 1;
          }
        }
        if (--context_enlargeIn == 0)
        {
          context_enlargeIn = 1 << context_numBits; // Math.pow(2, context_numBits);
          ++context_numBits;
        }
        context_dictionaryToCreate.erase(context_w_it); // delete context_dictionaryToCreate[context_w];
      }
      else
      {
        value = context_dictionary[context_w];
        for (i = 0; i < context_numBits; ++i)
        {
          context_data_val = (context_data_val << 1) | (value & 1);
          if (context_data_position == bitsPerChar - 1)
          {
            context_data_position = 0;
            context_data.push_back(getCharFromInt(context_data_val));
            context_data_val = 0;
          }
          else
          {
            ++context_data_position;
          }
          value = value >> 1;
        }
      }
      if (--context_enlargeIn == 0)
      {
        context_enlargeIn = 1 << context_numBits; // Math.pow(2, context_numBits);
        ++context_numBits;
      }
    }

    // Mark the end of the stream
    value = 2;
    for (i = 0; i < context_numBits; ++i)
    {
      context_data_val = (context_data_val << 1) | (value & 1);
      if (context_data_position == bitsPerChar - 1)
      {
        context_data_position = 0;
        context_data.push_back(getCharFromInt(context_data_val));
        context_data_val = 0;
      }
      else
      {
        ++context_data_position;
      }
      value = value >> 1;
    }

    // Flush the last char
    while (true)
    {
      context_data_val = (context_data_val << 1);
      if (context_data_position == bitsPerChar - 1)
      {
        context_data.push_back(getCharFromInt(context_data_val));
        break;
      }
      else
      {
        ++context_data_position;
      }
    }

    return context_data;
  }

  template <typename Fn>
  string _decompress(int length, int resetValue, Fn getNextValue)
  {
    std::unordered_map<int, string> dictionary;

    int next = 0;
    int enlargeIn = 4;
    int dictSize = 4;
    int numBits = 3;
    string entry;
    string result;
    string w;
    int bits, resb, maxpower, power;
    string c;

    struct
    {
      int val, position, index;
    } data{getNextValue(0), resetValue, 1};

    bits = 0;
    maxpower = 4; // Math.pow(2, 2);
    power = 1;

    while (power != maxpower)
    {
      resb = data.val & data.position;
      data.position >>= 1;
      if (data.position == 0)
      {
        data.position = resetValue;
        data.val = getNextValue(data.index++);
      }
      bits |= (resb > 0 ? 1 : 0) * power;
      power <<= 1;
    }

    switch (next = bits)
    {
    case 0:
      bits = 0;
      maxpower = 256; // Math.pow(2, 8);
      power = 1;
      while (power != maxpower)
      {
        resb = data.val & data.position;
        data.position >>= 1;
        if (data.position == 0)
        {
          data.position = resetValue;
          data.val = getNextValue(data.index++);
        }
        bits |= (resb > 0 ? 1 : 0) * power;
        power <<= 1;
      }
      c = f(bits);
      break;

    case 1:
      bits = 0;
      maxpower = 65536; // Math.pow(2, 16);
      power = 1;
      while (power != maxpower)
      {
        resb = data.val & data.position;
        data.position >>= 1;
        if (data.position == 0)
        {
          data.position = resetValue;
          data.val = getNextValue(data.index++);
        }
        bits |= (resb > 0 ? 1 : 0) * power;
        power <<= 1;
      }
      c = f(bits);
      break;

    case 2:
      return {};
    }

    dictionary[3] = c;
    w = c;
    result += c;

    while (true)
    {
      if (data.index > length)
      {
        return {};
      }

      bits = 0;
      maxpower = 1 << numBits; // Math.pow(2, numBits);
      power = 1;
      while (power != maxpower)
      {
        resb = data.val & data.position;
        data.position >>= 1;
        if (data.position == 0)
        {
          data.position = resetValue;
          data.val = getNextValue(data.index++);
        }
        bits |= (resb > 0 ? 1 : 0) * power;
        power <<= 1;
      }

      int c;
      switch (c = bits)
      {
      case 0:
        bits = 0;
        maxpower = 256; // Math.pow(2, 8);
        power = 1;
        while (power != maxpower)
        {
          resb = data.val & data.position;
          data.position >>= 1;
          if (data.position == 0)
          {
            data.position = resetValue;
            data.val = getNextValue(data.index++);
          }
          bits |= (resb > 0 ? 1 : 0) * power;
          power <<= 1;
        }

        dictionary[dictSize++] = f(bits);
        c = dictSize - 1;
        enlargeIn--;
        break;

      case 1:
        bits = 0;
        maxpower = 65536; // Math.pow(2, 16);
        power = 1;
        while (power != maxpower)
        {
          resb = data.val & data.position;
          data.position >>= 1;
          if (data.position == 0)
          {
            data.position = resetValue;
            data.val = getNextValue(data.index++);
          }
          bits |= (resb > 0 ? 1 : 0) * power;
          power <<= 1;
        }
        dictionary[dictSize++] = f(bits);
        c = dictSize - 1;
        enlargeIn--;
        break;

      case 2:
        return result;
      }

      if (enlargeIn == 0)
      {
        enlargeIn = 1 << numBits; // Math.pow(2, numBits);
        numBits++;
      }

      if (!dictionary[c].empty())
      {
        entry = dictionary[c];
      }
      else
      {
        if (c == dictSize)
        {
          entry = w + w.at(0);
        }
        else
        {
          return {};
        }
      }
      result += entry;

      // Add w+entry[0] to the dictionary.
      dictionary[dictSize++] = w + entry.at(0);
      enlargeIn--;

      w = entry;

      if (enlargeIn == 0)
      {
        enlargeIn = 1 << numBits; // Math.pow(2, numBits);
        numBits++;
      }
    }

    return {};
  }

} // namespace __inner

// clang-format off
string compressToBase64(const string& input){
  return toBaseN(input, BASE64_STD);
}

string decompressFromBase64(const string& input){
  return fromBaseN(input, BASE64_STD);
}

string toBaseN(const string& input, const string& key){
  if (input.empty()) return {};
  using namespace __inner;
  int keyLen = key.length();
  int nb0 = floor(log2(keyLen - 1)) + 1;
  int nb1 = 4;
  auto res = _compress(input, nb0, [&](int a) { return key.at(a); });
  int nb2 = res.length() % nb1;
  if (nb2 == 0){
    return res;
  } else {
    return res + string(nb1-nb2,equal);
  }
}

string fromBaseN(const string& input, const string& key){
  if (input.empty()) return {};
  using namespace __inner;
  int keyLen = key.length();
  std::unordered_map<string::value_type,int> reverseKey;
  for (int i = 0; i < keyLen; ++i){
    reverseKey[key.at(i)] = i;
  }
  return _decompress(input.length(), 32, [&](int index) { return reverseKey[input.at(index)]; });
}

string strPad(const string& str, const int pad, const char c){
  int r = str.length() % pad;
  return r == 0 ? str : str + string(pad - r,c);
}
// clang-format on

} // namespace lzstring