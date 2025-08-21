/* Copyright (C) 2018-present, Facebook, Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#pragma once

#include <memory>
#include <string>
#include <unordered_map>
#include <vector>

#include "katran/lib/BpfAdapter.h"
#include "katran/lib/KatranLb.h"
#include "katran/lib/testing/tools/PacketAttributes.h"
#include "katran/lib/testing/tools/PcapParser.h"

namespace katran {

/**
 * structure with config params for BpfTester.
 */
struct TesterConfig {
  /**
   * vector of test data to run tests from fixtures.
   */
  std::vector<PacketAttributes> testData;
  /**
   * path to output pcap file. could be omitted. if specified - output of
   * testPcktsFromPcap run would be writen to this file
   */
  std::string outputFileName;
  /**
   * path to input pcap file. could be omitted, if tests are going to be done
   * from fixtures.
   */
  std::string inputFileName;
  /**
   * descriptor of bpf's program to test.
   */
  int bpfProgFd{-1};

  std::optional<int> singleTestRunPacketNumber_{std::nullopt};
};

/**
 * class which implements generic tester for xdp bpf program.
 * it could either use pcap file for input data (and optional write result
 * to output file in pcap format as well) or predefined test fixtures.
 */
class BpfTester {
 public:
  explicit BpfTester(const TesterConfig& config);
  /**
   * helper function to print packets to stdout in base64 format from input
   * pcap file. use case: create data for text fixtures.
   */
  void printPcktBase64();

  /**
   * helper function which reads pckts from pcap file, uses em as an input
   * for bpf program and logs a result of the program's run. optionaly
   * (if output file is specified) writes modified (after prog's run) packet
   * to output file.
   */
  void testPcktsFromPcap();

  /**
   * @param const int bpf program fd.
   *
   * helper function to set bpf's program descriptor.
   */
  void setBpfProgFd(const int progFd) {
    config_.bpfProgFd = progFd;
  }

  /**
   * @param KatranLb* pointer to a KatranLb that wraps
   * around the bpf program being tested.
   *
   * helper function to set the KatranLb. This is useful when
   * we want to check some stats in the test.
   */
  void setKatranLb(KatranLb* katranLb) {
    katranLb_ = katranLb;
  }

  /**
   * helper function to run tests on data from test fixtures
   * (inpu/outputData vectors from tester's config.)
   * Returns true if all tests are successful.
   */
  bool testFromFixture();

  /**
   * @param int progFd descriptor of bpf program
   * @param std::vector<struct __skb_buff> input contexts for test run
   * helper function to run tests on data from test fixtures
   * for clsact(tc) based bpf program. optional ctxs could be specified
   */
  bool testClsFromFixture(
      int progFd,
      const std::vector<struct __sk_buff>& ctxs_in);

  /**
   * @param vector<string, string> new input fixtures
   * @param vector<string, string> new output fixtures
   * helper function which set test fixtures to new values
   */
  void resetTestFixtures(const std::vector<katran::PacketAttributes>& data);

  /**
   * @param bool enable Enable or disable GUE mode
   * @param uint16_t fixedSourcePort The fixed source port to use for GUE
   * packets helper function to enable GUE mode with a fixed source port
   */
  void enableGueMode(bool enable, uint16_t fixedSourcePort = 0) {
    gueMode_ = enable;
    gueFixedSourcePort_ = fixedSourcePort;
  }

  /**
   * @return bool Whether GUE mode is enabled
   * helper function to check if GUE mode is enabled
   */
  bool isGueModeEnabled() const {
    return gueMode_;
  }

  /**
   * @return uint16_t The fixed source port for GUE packets
   * helper function to get the fixed source port for GUE packets
   */
  uint16_t getGueFixedSourcePort() const {
    return gueFixedSourcePort_;
  }

  /**
   * @param int repeat      how many time should we repeat the test
   * @param int position    of the packet if fixtures vector.
   * helper function to run perf test on specified packet from test fixtures
   * if position is negative - run perf tests on every packet in fixtures
   */
  void testPerfFromFixture(uint32_t repeat, const int position = -1, const std::string& out = "");

  /**
   * @param IOBuf with packet data to write.
   *
   * helper function to write packet in pcap format to specified outputFilenName
   */
  void writePcapOutput(std::unique_ptr<folly::IOBuf>&& buf);

 private:
  // helper to run bpf tester from fixtures. if len of ctxs is not null - it
  // must be the same as the size of input fixtures
  // Returns true if all tests are successful.
  bool runBpfTesterFromFixtures(
      int progFd,
      std::unordered_map<int, std::string> retvalTranslation,
      const std::vector<void*>& ctxs_in,
      uint32_t ctx_size = 0);

  // helper function that returns the number of packets that were routed
  // through the global lru
  uint64_t getGlobalLruRoutedPackets();

  // Helper function to check if a packet is a GUE packet
  bool isGuePacket(const std::string& base64Packet);

  // Helper function to compare GUE packets with special handling for the source
  // port
  bool compareGuePackets(
      const std::string& actualPacket,
      const std::string& expectedPacket);

  TesterConfig config_;
  PcapParser parser_;
  BpfAdapter adapter_;
  KatranLb* katranLb_;
  bool gueMode_ = false;
  uint16_t gueFixedSourcePort_ = 0;
};

} // namespace katran
