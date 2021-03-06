.\"
.\"
.\"     David M. Meyer
.\"     dmm@1-4-5.net
.\"     
.\"     
.\"     Fill in Author?, -abc, category, ...
.\"
.\"
.\"     $Header: /home/dmm/SDOs/IETF/Drafts/generic_draft/RCS/draft-ietf-abc.ms,v 1.19 2004/09/28 13:50:35 dmm Exp $
.\"
.\"
.\"
.so tmac.id
.tl 'Internet Draft''Walter Stanish'
.tl 'Intended status: Informational'
.tl 'Obsoletes: draft-stanish-imic-02''\*(MO \n[*xyear]'
.tl 'Expires: \*[*XP]'''
.LP
.ce 2
Internet Market Identification Code (IMIC)
draft-stanish-imic-03

.LP
.B Abstract
.LP
.in 3

An Internet MIC (IMIC) identifies an internet-based financial market
in a manner that is superset-compatible with the ISO's existing
ISO10383 Market Identification Code (MIC) standard.  This document 
obsoletes draft-stanish-imic-02.

.\".IDBOILER "IMIC working group" "imic@x.y.z"
.IDBOILER "i"
.\"  if product of individual
.\"

.COPYSTATEMENT

.LP
.KS

.LP
.MH 1 Introduction
.LP
.in 3

An Internet MIC (IMIC) is a four-character alphanumeric code, always
beginning with a leading digit, that identifies an internet-based 
financial market in an interoperable manner with [ISO10383] MICs.
No assumptions are made about settlement paths or the currencies or 
commodities exchanged on the market.  IMIC provides a building block
with which the internet community can develop viable, interoperable 
alternatives to legacy financial systems.

Technically, IMIC is an unofficial superset of the ISO's existing Market
Identification Code standard [ISO10383] that is widely used for global
identification of conventional financial exchanges.

.RFC2119

.KE
.LP
.bp
.TOCP
.bp

.LP
.MH 1 Requirement
.LP
.in 3

In recent years the internet has seen the emergence of online markets
trading in both conventional and novel [BITCOIN] financial instruments.  

Given this trend, it makes sense to propose a standard mechanism for
the consistent, global identification of internet-based markets.  IMIC
provides such a mechanism.

.LP
.MH 1 "Solution"
.MH 2 "ISO10383 (MIC)"
.LP
.in 3

For inspiration we look toward present standards for the global identification
of financial markets and exchanges in conventional financial networks.
Today's most widely widely adopted international standard in this area
is the International Standards Organizations's Market Identification
Code (MIC) [ISO10383].

In practice, a MIC is simply a unique series of four alphanumeric 
characters that is associated with a given market by publishing it
within the ISO's Market Identification Code registry [MIC-REG].

.LP
.MH 2 "IMIC"
.LP
.in 3

IMIC is superset-compatible with the ISO's MIC standard [MIC-REG].

The IMIC format may be expressed in ABNF [RFC5234] as follows:

 imic-format  = registry-id 4mic-char   ; eg: XBI7E

 registry-id  = reg-x / reg-z           ; ie: 'X' = IANA-managed IMIC
                                        ;     'Z' = ISO-managed MIC

 mic-format   = 4mic-char               ; eg: BVMT (Bourse de Tunis)

 reg-x        = %d88                    ; ie: capital 'X'
 reg-z        = %d90                    ; ie: capital 'Z'

 mic-char     = mic-digit / caps-letter
 mic-digit    = "0" / "1" / "2" / "3" / "4" / "5" / "6" / "7" / "8" /
                "9"
 caps-letter  = %d65 / %d66 / %d67 / %d68 / %d69 / %d70 / %d71 /
                %d72 / %d73 / %d74 / %d75 / %d76 / %d77 / %d78 /
                %d79 / %d80 / %d81 / %d82 / %d83 / %d84 / %d85 /
                %d86 / %d87 / %d88 / %d89 / %d90   ; ie. capital A-Z

Of the assumed name space, only codes with the zero (0) prefix are 
initially considered assignable by IANA, with the remainder reserved
for private or future use as summarized below.

 +--------+-------+------+----------------------------+------------+
 | Prefix | Auth. | Std. | Description                | Codepoints |
 +--------+-------+------+----------------------------+------------+
 | 0000   | IANA  | IMIC | Local (or default) market  |          1 |
 | 0      | IANA  | IMIC | IANA assignable name space |     46,655 |
 | 10     | IANA  | IMIC | Private use                |      1,296 |
 | 11-1Z  | IANA  | IMIC | (Reserved for future use)  |     45,360 |
 | 2-9    | IANA  | IMIC | (Reserved for future use)  |    373,248 |
 | A-Z    | ISO   | MIC  | ISO managed name space     |  1,213,056 |
 +--------+-------+------+----------------------------+------------+

.LP
.MH 1 "General Considerations"
.MH 2 "Namespace Prefix"
.LP
.in 3

ISO's Market Information Code (MIC) registry document [MIC-REG] contains
assignments spanning approximately eight years.  However, it has not 
published an assignment policy or given any indication that freedom of
assignment will be granted to independent exchange operators.

Given that numerous independent exchanges are now owerating on the
internet, chiefly for physical assets such as precious metals, emerging
digital currencies such as Bitcoin, and emissions offset assets, it
makes sense to propose a new namespace to identify these exchanges
without any chance of conflict with existing identifiers.

The dominant conventional market identification scheme, the ISO Market 
Identification Code (MIC), was analyzed and found to have exceptionally
low namespace utilization, a prefix or superset-based approach to
integration was eventually adopted so as to preserve interoperability
without creating chance of conflict.

.MH 2 "Identifier Issuing Paradigms"
.MH 3 "Distributed Hash Table (DHT)"
.LP
.in 3

Using distributed hash tables (DHT) or a similar mechanism it may
be possible to provide dynamic identifier name space management within
a financial network itself, such that individual markets can self-issue
IMICs and have them corroborated by network consensus.

Drawbacks to this approach include:

 * The 'always on, always connected' requirement of most of these
   architectures.

 * The 'endpoint exposure' problem.
   IP addresses for critical financial systems or their proxies
   are generally made available to a DHT network; probably
   not desirable in a financial services setting.

 * Namespace exhaustion.
   Without some underlying capability for reliable network 
   participant identification, a single party COULD request vast
   quantities of identifiers in a bid to disrupt the network through
   name space exhaustion or processing overhead, causing Denial of 
   Service (DoS).

The primary benefit of a DHT-based approach is that it is completely 
decentralized, thus avoiding issues associated with centralization.

In future, part of the reserved name space might be considered for
assignment to a DHT-style self-managing peer to peer network.

.LP
.MH 3 "Private Issue"
.LP
.in 3

Just as the Internet Protocol provides a mechanism for Address Allocation
for Private Internets [RFC1918], so too IMIC provides a mechanism
for address allocation for private financial networks.  Private financial
networks MAY include those operated associated with Massive Multiplayer
Online Roleplaying Games (MMORPGs) or financial simulations.

For this reason, the prefix '10' (in deference to IPv4's well known
10.x.x.x range [RFC1918]) is allocated for private use, with a total of
1,296 codepoints.

.LP
.MH 3 "Combined Issue"
.LP
.in 3

Various approaches have been discussed with reference to their individual
benefits and drawbacks.  A combined process allows these to be balanced
against other requirements, such as IANA's need to perform name space 
management.  Under the IMIC scheme, provision for privately issued addresses
is included, top-level institution registration is managed by IANA, and 
future assignments COULD provide DHT or similar mechanisms for the
management of a delegated name space to users desirous of such services.

.LP
.MH 2 "Why Markets?"
.LP
.in 3

With the advent of truly decentralized virtual currencies such as [BITCOIN]
the conventional idea of a financial market (such as a stock exchange) MAY
be seen by some as superfluous.  However, the notion remains useful:

 * Consolidated instruments such as corporate stock require a degree 
   of centralization in order to maintain rapid settlement of trades

 * Multi-currency or multi-instrument markets will require support
   for conventional currencies whose immediate settlement is 
   difficult or impossible in many situations.

 * Systems such as [BITCOIN] have quirks that require slightly
   delayed settlement due to the nature of their decentralized,
   consensus-based approach to fiscal transfer.

 * The centralization of markets brings with it legal ramifications 
   which MAY increase traceability and ultimately accountability for 
   intentional or accidental foul play.  Therefore, some portion of 
   trading will likely remain on centralized markets with reduced 
   requirements for individual participant security considerations
   for the forseeable future.

.LP
.MH 2 "Number of Markets"
.LP
.in 3

The present ISO Market Identification Code (MIC) database contains
794 'live' codes.  We therefore assume a requirement to support at 
least a few thousand market codes.  We claim 466,560 codepoints from
ISO's existing name space (prefixes 0-9), and activate 46,656 (10%)
under the prefix zero ('0') for immediate assignment.

.bp
.LP
.MH 1 "Security Considerations"
.LP
.in 3

IMIC only provides a financial market identification scheme and
DOES NOT approach problems of communications security, which are
purposefully left to other protocols.

Implementers should note that the precise meaning of '0000' is
system-specific and as such cannot be used in inter-system 
communications except by explicit prior arrangement.  (See also
Appendix A: Special Purpose MIC Values).

.LP
.MH 1 "IANA Considerations"
.MH 2 "Market Identifiers"
.MH 3 "Reserved IMIC"
.in 3

The following IMIC are reserved and will not be issued to registrants.

 +------+----------------------------------------+
 | IMIC | Purpose                                |
 +------+----------------------------------------+
 | 0000 | Denotes the local (or default) market. |
 +------+----------------------------------------+

.MH 3 "Registration"
.in 3

Internet MICs (IMICs) will be assigned by IANA on a first come first
served basis [RFC8126].  IMICs will not be provided to entities
with existing MICs, as this would represent duplicate allocation 
under the MIC standard.  Such entities are be defined as those 
appearing within SWIFT's official MIC registry [MIC-REG].
Registrants must provide the domain name with which their service is
primarily associated and the name of the registrant (either a person
or an organizational entity).  Registrants may provide a physical
address, and may provide one additional identifier such as a
business registration or license number.

IMICs will be assigned randomly from the pool of
available assignments and will not be granted on a specific request
basis.  Thus, the first issued institution code must not be '001'.
Institutions unhappy with their random assignment for legitimate
reasons (such as unfortunate numerological connotations) may request
one (1) replacement assignment.  No further replacement is allowed.
Registrants requesting replacement assignments automatically cause
their initial allocation to expire (see Expiry, below).

.MH 3 "Modification / Cancellation"
.in 3

Registrants must contact IANA to cancel or change the details
associated with their registration.  Authentication procedures will
be stipulated at IANA's discretion.

.MH 3 "Expiry"
.in 3

In case of imminent name space exhaustion and no viable alternative
avenues for expansion, IANA may consider the expiry of a
registrant's stated primary domain for a reasonable period (as
determined by IANA) as adequate grounds for the deallocation of
an IMIC.  Deallocated IMIC will be immediately returned to the 
pool of available allocations, and will be re-issued to new 
parties on a first come, first served [RFC8126] basis.

.MH 2 "Publications"

.MH 3 "IMIC Market Identifier Registry"
.in 3

IANA will publish revisions to the global registry of IMIC
institution identifiers as changes are made.  The registry will include
the dates of registration and last modification for each record, in
addition to registrant information and the assigned institution code.

.MH 2 "Future Considerations"
.in 3

In future, part of the reserved name space might be considered for
assignment to a DHT-style self-managing peer to peer network.

.MH 2 "Security"
.in 3

IANA will make reasonable attempts to authenticate registrant institution
communications in order to prevent the subversion of established
institutions' registration information via IANA's registrar functions.

.bp
.LP
.MH 1 "References"
.MH 2 "Normative References"
.LP
.in 3

[ISO10383]      ISO TC 68/SC 4 (Securities and related financial 
                instruments), "ISO 10383:2012: Securities and 
                related financial instruments - Codes for exchanges 
                and market identification (MIC)", ISO10383:2018.
                https://www.iso20022.org/10383/
		 iso-10383-market-identifier-codes

[MIC-REG]       SWIFT, "ISO10383, Codes for exchanges and market
                identification", October 3rd, 2011.
                http://www.iso15022.org/MIC/homepageMIC.htm

[RFC2119]       Bradner, S., "Key words for use in RFCs to
                Indicate Requirement Levels", BCP 14, RFC 2119,
                March 1997.  

[RFC8126]       Narten, T., and H. Alvestrand, "Guidelines for
                Writing an IANA Considerations Section in RFCs",
                BCP 26, RFC 8126, June 2017.

[RFC5234]       Crocker, D. and P. Overell, "Augmented BNF for
                Syntax Specifications: ABNF", STD 68, RFC 5234,
                January 2008.

.fi
.LP
.MH 2 "Informative References"
.LP
.in 3

.nf

[BITCOIN]       Nakamoto, S., "Bitcoin: A Peer-to-Peer Electronic
                Cash System", 2009-05-24.
                http://www.bitcoin.org/bitcoin.pdf

[RFC1918]       Rekhter, Y. et al, "Address Allocation for Private
                Internets", BCP 5, RFC 1918, Feburary 1996.
.fi

.bp

.LP
.MH 1 "Acknowledgments"
.LP
.in 3

 * Payward Inc. funded the original research and development of this document.

.MH 1 "Authors' Addresses"
.DS L
.in 3

Walter Stanish
<walter@stani.sh>
.DE
.COPYFULL

.bp

.MH 1 "Appendices"
.MH 2 "Appendix A: Special Purpose MIC Values"
.in 3

The Market Identification Code (MIC) registry [MIC-REG] specifies the
following special values of which implementers should be aware.

 +------+--------------------------------------+
 | MIC  | Purpose                              |
 +------+--------------------------------------+
 | XXXX | No market (eg: unlisted securities)  |
 +------+--------------------------------------+

.bp

.MH 2 "Appendix B: Initial IMIC Market Identifier Registry Contents"
.in 3

Prior to IANA handover, parties wishing to acquire an instutition
identifier may submit pull requests at https://github.com/globalcitizen/imic

.PP
.in 0
 # IMIC Market Identifier Registry / version: 20180220-0
 #  (Version format is <yyyy><mm><dd>-<x>, where <x> is a single digit.)
 #
 # Format: <code>|<is-meta>|<is-confirmed>|<short-name>|<primary-domain>
 #   <code>           The IMIC code.
 #   <is-meta>        Boolean. 1 denotes a meta-assignment
 #                    (ie. NOT a normal market codepoint)
 #   <is-historic>    Boolean. 1 denotes an historic assignment.
 #   <short-name>     A short, unambiguous market name that is
 #                    suitable to display to end users.
 #   <primary-domain> The primary domain name that is associated
 #                    with the codepoint assignment.
 # Note:
 #  Prior to maintenance body handover, codepoint owners or registrants
 #  may submit pull requests at https://github.com/globalcitizen/imic
 0000|1|0|(Local market)
 0ALL|0|0|Allcoin|allcoin.com
 0ANX|0|0|ANX Pro|anxpro.com
 0B24|0|1|Bitcoin-24|bitcoin-24.com
 0BBY|0|0|BitBay|bitbay.net
 0BCE|0|1|BTC-E|btc-e.com
 0BCI|0|0|Bitcoin Indonesia|bitcoin.co.id
 0BCN|0|1|BTC China|btcchina.com
 0BCT|0|1|Bitcoin-Central|bitcoin-central.net
 0BCX|0|1|Bitcurex|bitcurex.com
 0BDE|0|0|bitcoin.de|bitcoin.de
 0BFL|0|1|Bitfloor|bitfloor.com
 0BFX|0|1|Bitfinex|bitfinex.com
 0BFY|0|0|bitFlyer|bitflyer.jp
 0BIN|0|0|Binance|binance.com
 0BIZ|0|0|Bit-Z|bit-z.com
 0BME|0|0|Bitme|bitme.com
 0BMK|0|0|BitMarket|bitmarket.net
 0BNZ|0|1|bitNZ|bitnz.com
 0BSO|0|0|Bitso|bitso.com
 0BOG|0|0|Bits of Gold|bitsofgold.co.il
 0BQK|0|0|Bitquick|bitquick.co
 0BSN|0|0|BitSane|bitsane.com
 0BST|0|0|Bitstamp|bitstamp.net
 0BTC|0|1|BTCX|btcx.com
 0BTD|0|0|Bit Trade|btradeaustralia.com
 0BTH|0|0|Bithumb|bithumb.com
 0BTM|0|0|BTC Markets|btcmarkets.net
 0BTR|0|0|Bittrex|bittrex.com
 0BTX|0|0|BTC Trade|btctrade.com
 0BXT|0|0|BX.in.th|bx.in.th
 0CBX|0|0|Camp BX|campbx.com
 0CCK|0|0|Coincheck|coincheck.com
 0CEX|0|0|CEX|cex.io
 0CFL|0|0|Coinfloor|coinfloor.co.uk
 0CMT|0|0|Coinmotion|coinmotion.com
 0COB|0|0|Coinbase|coinbase.com
 0COO|0|0|Coinone|coinone.co.kr
 0CGS|0|0|Coingrounds|coingrounds.com
 0CHB|0|0|CHBTC|chbtc.com
 0CMT|0|0|Cryptomate|cryptomate.co.uk
 0CPH|0|0|Coins.ph|coins.ph
 0CJR|0|0|Coinjar|coinjar.com
 0CSI|0|0|Coinsecure|coinsecure.in
 0CTD|0|0|Cointed|cointed.com
 0CTO|0|0|Cryptopia|cryptopia.co.nz
 0CXC|0|0|Crypto X Change|cryptoxchange.com
 0EGG|0|0|Coinegg|coinegg.com
 0ETD|0|0|EtherDelta|etherdelta.com
 0EXM|0|0|Exmo|exmo.com
 0EXR|0|0|EXRates|exrates.me
 0EXX|0|0|EXX|exx.com
 0IBT|0|0|itBit|itbit.com
 0ISG|0|1|Intersango|intersango.com
 0GAT|0|0|Gate.io|gate.io
 0GDX|0|0|GDAX|gdax.com
 0GMN|0|0|Gemini|gemini.com
 0GOL|0|0|Golix|golix.com
 0GTC|0|0|GateCoin|gatecoin.com
 0HIT|0|0|HitBTC|hitbtc.com
 0HUO|0|0|Huobi|huobi.com
 0KBT|0|0|Korbit|korbit.co.kr
 0KNM|0|0|Koinim|koinim.com
 0KPT|0|1|Kapiton|kapiton.se
 0KRK|0|0|Kraken|kraken.com
 0KUC|0|0|Kucoin|kucoin.com
 0LAK|0|0|LakeBTC|lakebtc.com
 0LBK|0|0|LBank|lbank.info
 0LBT|0|0|LocalBitcoins|localbitcoins.com
 0LIQ|0|0|Liqui|liqui.io
 0LIV|0|0|LiveCoin|livecoin.net
 0LTB|0|0|LiteBit|litebit.eu
 0LUN|0|0|Luno|luno.com
 0MAI|0|0|MaiCoin|maicoin.com
 0MCD|0|0|Mercado|mercadobitcoin.com.br
 0MTG|0|1|MtGox|mtgox.com
 0NST|0|0|Coinnest|coinnest.co.kr
 0OKC|0|0|OKCoin|okcoin.com
 0OKX|0|0|OKEx|okex.com
 0OTC|0|0|Bitcoin OTC|bitcoin-otc.com
 0PNX|0|0|Poloniex|poloniex.com
 0QCX|0|0|QuadrigaCX|quadrigacx.com
 0RFX|0|0|RippleFox|ripplefox.com
 0SFL|0|0|Safello|safello.com
 0SHS|0|0|ShapeShift|shapeshift.io
 0TDX|0|0|TideX|tidex.com
 0TOP|0|0|TopBTC|topbtc.com
 0TRS|0|0|TradeSatoshi|tradesatoshi.com
 0TUX|0|0|Tux Exchange|tuxexchange.com
 0UNO|0|0|Unocoin|unocoin.com
 0UPB|0|0|UPbit|upbit.com
 0USX|0|0|USD X|usd-x.com
 0VCX|0|0|Vircurex|vircurex.com
 0VEX|0|1|VirtEx|cavirtex.com
 0VRW|0|0|Virwox|virwox.com
 0XAP|0|0|Xapo|xapo.com
 0YOU|0|0|BitcoinToYou|bitcointoyou.com
 0WEX|0|0|WEX|wex.nz
 0ZAI|0|0|Zaif|zaif.jp
 0ZBP|0|0|Zebpay|zebpay.com
 XXXX|1|0|(No market)
 
.bp

.MH 1 "Appendix C: Document History"
.in 3

draft-stanish-imic-02 (2018-02-22)
  - Fix typo

draft-stanish-imic-02 (2018-02-20)
  - Integrate outstanding 2013 feedback from Barry Leiba
     - Move from 'assumed collision-free' to 'prefix' integration
       model.
     - Avoid possible RFC5234 ambiguous use of 'char' and 'digit' in
       ABNF.
     - Remove RFC2119 notation from IANA Considerations.
     - Remove improper RFC2119 use.
     - Change to ISO liason recommendation.
     - Change to IANA process security recommendation.
     - Update ISO1383 reference to current document and URL (2018)
  - Relocate point regarding reserved MIC codes to non-IANA section
    to better target implementors.
  - Add point regarding the legal benefits of centralized
    markets.
  - Update ABNF as per the above.
  - Addition of <is-historic> flag in registry.
  - Validation of prior market codepoints as live / historic.
  - Addition of XXXX (No market) special codepoint.
  - Addition of many current-era markets.
  - Update BCP26 reference to 2017 version.

draft-stanish-imic-01 (2012-11-23)
  - Resolve minor typographical and formatting errors.

draft-stanish-imic-00 (2012-11-13)
  - Update ABNF specification to respect case
  - Added more explicit human language description of code format
    (ie. explicit mention of code length and structure in English)
  - Added initial registry contents.

draft-imic-00 (2011-11-17)
  - Initial release.
