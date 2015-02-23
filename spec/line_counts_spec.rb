require 'gitloc/line_counts'

RSpec.describe Gitloc::LineCounts do
  it 'returns the counts for each file' do
    counts = described_class.call([["file1", "l1"],
                                   ["file2", "l1\nl2\nl3"]])
    expect(counts).to eq [["file1", 1], ["file2", 3]]
  end

  it 'does not count empty lines' do
    counts = described_class.call([["file1", ""]])
    expect(counts).to eq [["file1", 0]]

    counts = described_class.call([["file1", "\n"]])
    expect(counts).to eq [["file1", 0]]

    counts = described_class.call([["file1", "\nline1\nline2\n"]])
    expect(counts).to eq [["file1", 2]]
  end

  it 'omits files of binary data' do
    counts = described_class.call([["keep1", ""],
                                   ["binary", "GIF89a\u0000\u0002\u0000\u0001\xD5\u0000\u0000\xCD\xCF\xCF\u00135A/IR\x89\x91\u0017\x85\x92\x93rx{\xBA\xBC\xBD\n"],
                                   ["keep2", ""]])
    expect(counts).to eq [["keep1", 0], ["keep2", 0]]
  end
end
