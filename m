Return-Path: <virtio-comment-return-8812-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ABBC35274
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Dec 2023 06:43:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 964CD42D92
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Dec 2023 06:43:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7A744986520
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Dec 2023 06:43:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6D6E69863DE; Mon, 18 Dec 2023 06:43:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 277249866EC
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Dec 2023 06:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1702881801.340000
X-TM-MAIL-UUID: 07bcd6d2-08e3-49ed-86c1-bcbcb181b1b6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlfHQub8ucRUYQXOvyeEo7pWxiR8KQUSg65od5U8Ekg8dMo/MLCzIoPQAH+4pVpmmN7t//XwjcyGh9gTvGrL0K7YEpb79kSoF2lo4h8Wi0luyXT7JV2BQCx7KH5x0KrPyin+iU9byKkUb/HX6pw1Z+lzaejEWKZWF0bPQTycCHb/gYp8f5Ly/BbWUiASxfI+bt7JUr1dY5jwkOKXNRZ9Uj71B8fj+fxfXwoCE0RS7taQyxJ3UInEl6T1xy1FJzXiwi1PEslKGStunzsO/YZk1y+wetyvBrq01mab7FFNwURCsv5MCQ6GPzWHEanz3raspjbYsn3tp36A3faqLqIGQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nWA++VDtsR1A7wZKm4bpjH8IAdEOyJcm+C/zIg/fK8=;
 b=bfHvySCLdvKVRIRK9BikeqNeSEJuO/KaFuCrvjBMTXyigPa3Wna9j7nfQTHHUZxq6XfmxPHClTya3J5ocetrlvKd3Nx/X3wGCl0/eUdczUX2mFEojrKPfpQxMRwBJTHeU3MOM5mhxyyThz5Ao5GPXosA74We3029VtSXpyiW0BBh3I2Jip0eRV30vzLV8Hr/LTyVXxEEF9d/UUwfHdJVuql+oauXHz6fTZ7fT5SwJ8L/tPG/480HHYO6hQ3ZtBhp1FhVEUdXzRD6FPmYYU4SpJZl3O0FVs0NEAbrNhtoFiGM02vCeoSaEXreTHgFogeer9/O0CBO1gxaEInlpVJ7jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 217.66.60.4) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=opensynergy.com; dmarc=temperror action=none
 header.from=opensynergy.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is 217.66.60.4)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=opensynergy.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of opensynergy.com: DNS Timeout)
From: Peter Hilber <peter.hilber@opensynergy.com>
To: virtio-comment@lists.oasis-open.org
Cc: Peter Hilber <peter.hilber@opensynergy.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>
Date: Mon, 18 Dec 2023 07:42:50 +0100
Message-Id: <20231218064253.9734-2-peter.hilber@opensynergy.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231218064253.9734-1-peter.hilber@opensynergy.com>
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6EUR05FT051:EE_|FR2P281MB0186:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8548d219-0df0-4901-f592-08dbff949e39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KW0wQxauf3ibz9PlDK5YFGo1NOytZ9dqdkBFeVeD0I2qIBq5SYXyesOC1vCmLB6BzPTM/1FTIRdcCpMOJu7hu0n68wip93yK9OZYVjuBjZutr/ajCsFVWGM4YWnC/kYes5IukUcTSo8jQLcaaRwmLwaWRtGUAtqERKmVvTkfi87sX1V1sV9DfXZMIATTsq3iET2s9SZA9y5d5yWL1vi6D4gbtZ2+HiExApe4pL3F58e/Bvmdn3GT4lyds6W+36D+urTkR7WhmtBUlpsaeNAWvw6vPLT7JMH5mhubE+1MSD2VGP2BR9CADZRLzRNy448o2eSezzIANq6eCBv402Vcy0JskpHvaQVbb66mhF5a15R5niBRqYbiHxnN7xETIDk81J99uxsgz568nS5u11TOCOJVcRyFGF2FYsLQfnSWRVxy2dP/gigkXhXIU3UPqO2W2UGXLdz9lENxpSxbOK/LpNUJwOyP1zNbkX09Fd+JYdcVHr/3i2fkMa1fYq3R+tuLXhcd8xAYaHKL+DeLxkVoTLPuLnPuzLeZU3sv/Z+EMqBC+XRCp0OFXMODX2+1Vg8ygR4bTlidIHPH51MYO6Gd70r0rd3yc4cjEoOb3bU5+J6+bcMNGW51P+yw7+N3WoUSMIyB8pB9VNyT+mH4IdPpfvBv6N9OsyrHyTQpQndTEE32WjSoDaTuwIkFL2P993ebkIy6KXrmMF6/yoIbqe0xPlOydILjjkeIqu9T2+Wnud8jsiWUd3gy3xaGFIKFSVnS7Sn2FTtzDAHRqxOKunvcVQ==
X-Forefront-Antispam-Report:
	CIP:217.66.60.4;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(39830400003)(136003)(230922051799003)(1800799012)(451199024)(186009)(82310400011)(64100799003)(46966006)(36840700001)(47076005)(63350400001)(63370400001)(83380400001)(2616005)(1076003)(336012)(26005)(36860700001)(478600001)(5660300002)(44832011)(316002)(41300700001)(70206006)(966005)(30864003)(2906002)(42186006)(54906003)(6916009)(8936002)(70586007)(8676002)(4326008)(36756003)(86362001)(81166007)(40480700001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 06:43:17.7117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8548d219-0df0-4901-f592-08dbff949e39
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[217.66.60.4];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM6EUR05FT051.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB0186
X-TM-AS-ERS: 104.47.11.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28064.005
X-TMASE-Result: 10--30.767500-4.000000
X-TMASE-MatchedRID: QLublOFGXF+UP+0hdpOx0niXIXWXK9Stp9ot5GYsw7GeMzVLMVFcn5mg
	kd7c0mklpGka8rXGZVHkO1o1YNdIDnP26YJmxjNcCffN9El9NwPPpNF1bfHUnIkmTO9LeIziifV
	Qjg/pCletdr1LddgvOBwbhzg45MaY3kILoplJYrvm02SeyxdqwMngJstbsoC53j9Bt+n7a058cF
	Rp1huGuLDuAx/prFAALDpEIpTHIX+BPy2oQ2ZgdxdLtszs/yIY3B1hSgpgA3MEriiju0mdkTjht
	+UaUOCxQMltd7emQSEgVXvDHAoLcHDqKO3xwlWQNyu5xvl6GK3r3TtAeamii65QnhHrCc3sIhoY
	cDLAGfAaPQqoCu3N83z+lXS1+hYFCz+sJksoUYqbZ5Rb+gO6IQA4ZiLuLzfgPiYO7EHc52j8qYX
	o9dS9IZR8ZAbK+qcUaqOOC3euib64qQNJhTbTw0YNeTPwDt2Pgz5VmKZ8x87hCm8am+SP50aObq
	7S5SGqWL15ehCslD65te/c+7/wBHXgf1u2qdSESRdVBo/Xo3kaqkbTN7HRNft7J0kZt8Ylseo3p
	42iQrHGdN/vZTz27nWEMHF8clRqY++QrgqqZhV79WNb9GVwPMVnOaThqPO4L4jBlb7Eu9DY0orp
	WPvVQHH/e8U1HkafAg9QK/e5tkjEhRNcl22xHOAiTCR5ZUrNGPLIqy2rYg94WCiQYyrUB7j2Fc6
	+AoflO3kLsrfeH11CJbzCQzFOBqzj/PapYOnhHW+C8sNk3WB1vPNKmUOEQbb8SCTO5L9eC+iyfs
	1TRXZ+yBLKxlc9jAMgoddhlP6mSxfMOAr0qPrFTQGAKRxj5No+48giqZwnEgg3cwDHl/3tmyEvx
	wC5ZF4L45p2p0pV3+6k97GsyDiUTGVAhB5EbQ==
X-TMASE-XGENCLOUD: 41f34a1b-f2ed-4aab-9ad9-8dcc3064b446-0-0-200-0
X-TM-Deliver-Signature: 875CCF6B5AF772DFC739F28BFC3B674F
X-TM-Addin-Auth: ZimI/QLV+WATbO7m5zXdGbCVNQ8477AvXbnK5xOLyHM0nfph2NnorDMZAGn
	aJgIaQI3ArSPuRrZpg+qQFZXQ4umUfBIpR2BcngCoVRbyaULZK0WsARg4iIXkmh+mSeUMzQreZo
	rJ/qhZ80AICGdK2yzyuvUlWlv8g2wAKtyFNXmtKTkytlKacDsFoBNUAjflWiyKVTcDC9+KRmgZN
	qetOcHffND3e0jIsp2UXFMFwfY7zA7mVW5xkiDsxz8jjPCue9w0fGStQ+MrgcaITFHUIpUq/R5j
	l/brus+zoIs+uQo=.LXNhEvC2pNIeuMxPNWle/P3cKt9j0P9yJT4mKhv3KpQKMWplHAynDzQAui
	iXZgJh8bUWkOqWqulG8fT1Dc0qAIFHhaVmNmXkg2dNLPOtHz7QswqAdLpJ/kgH3jAgdHpyWNGUf
	JaFRe3Z3uczhUKBZNaRyg1VtH6BCsIaPxgGWOj2JyvOrairjhPo7R/jaFrlDxmplAayuVGiMkPF
	15uSmVDTHVglDdNV/960hfL00plyJdzEJtxCSg0sqMA8jQVLMY7A/J4jS1bQ62GdC9eTfWJGg5p
	UoKARhlJncpOWrA9Y+m4z/FmO6WMASOKwr3uoHhxPYN4ST8vXCVxtghhtAw==
X-TM-Addin-ProductCode: EMS
Subject: [virtio-comment] [RFC PATCH v3 1/4] virtio-rtc: Add initial device specification

This is a draft for a Real-Time Clock (RTC) device. The virtio-rtc
device provides information about current time through one or more
clocks.

The normative statements for this device follow in the next patch.

For this device, there is an RFC Linux kernel driver which is being
upstreamed, and a proprietary device implementation.

Open Questions
==============

Arm Generic Timer Clock Types
-----------------------------

This spec version still distinguishes the Arm Generic Timer virtual and
physical counters:

	/* Arm Generic Timer CNTVCT_EL0, Counter-timer Virtual Count register */
	#define VIRTIO_RTC_COUNTER_ARM_VIRT 0
	/* Arm Generic Timer CNTPCT_EL0, Counter-timer Physical Count register */
	#define VIRTIO_RTC_COUNTER_ARM_PHYS 1

But there might be no benefit distinguishing them, as per a discussion
on the RFC Linux kernel driver [4].

So unless somebody identifies some use in distinguishing Arm virtual and
physical counters, this distinction will be dropped in v4.

virtio-rtc Functionality for Net Device
---------------------------------------

There is interest into sharing virtio-rtc functionality with the
virtio-net device [6]. It is proposed to encapsulate the requests resp.
responses in the pseudo-fields command-specific-data resp.
command-specific-result.

This handles natural alignment of the payload in a way which is
compatible with

- existing virtio-net controlq commands, and

- with the standalone virtio-rtc messages.

Additional Information
======================

The spec does not specify how a driver should interpret clock readings,
esp. also not how to perform clock synchronization.

The draft uses the "Timer/Clock" device id which is already part of the
specification. This device id was registered a long time ago and should
be unused according to the author's information. The name "RTC" was
determined to be the best for a device which focuses on current time,
but is up to discussion.

Any feedback is appreciated very much.

Changelog
=========

v3:

- Address comments from Parav Pandit.
- Split off normative requirements into a second commit [2].
- Merge readq and controlq into requestq [3].
- Don't guard cross-timestamping with feature bit [3].
- Pad request headers to 64 bit [2].
- Rename Virtio status codes to match UNIX error names [2].
- Avoid Virtio status code clashes with net controlq ack values.
- Reword to refer more to "requests", rather than "messages" [2].
- Rephrase some sentences [2].
- Use integer data types without "__" prefixes [2].
- Reduce clock id width to 16 bits [5].
- Make VIRTIO_RTC_FLAG_CROSS_CAP a bit mask rather than a bit index.

v2:

- Address comments from Cornelia Huck.
- Add VIRTIO_RTC_M_CROSS_CAP message [1].
- Fix various minor issues and improve wording [1].
- Add several clarifications regarding device error statuses.

[1] https://lists.oasis-open.org/archives/virtio-comment/202304/msg00523.html
[2] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com/t/#mffb93800fea11d6dda9e151078abedd6ff1c0f1e
[3] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com/t/#m94efd0aa9b9c2b96a246b79ef8bfc3bf64ebe791
[4] https://lore.kernel.org/lkml/20230630171052.985577-1-peter.hilber@opensynergy.com/T/#m65fa1d715933360498c4e33d7225e4220215a9d6
[5] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com/t/#mf00ce330228c28556d735eb9597469048c5d8b62
[6] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com/t/#mf00ce330228c28556d735eb9597469048c5d8b62

Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
---
 content.tex                      |   3 +-
 device-types/rtc/description.tex | 328 +++++++++++++++++++++++++++++++
 2 files changed, 330 insertions(+), 1 deletion(-)
 create mode 100644 device-types/rtc/description.tex

diff --git a/content.tex b/content.tex
index 98b9c319a666..f2b534ce97e6 100644
--- a/content.tex
+++ b/content.tex
@@ -683,7 +683,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 16         &   GPU device       \\
 \hline
-17         &   Timer/Clock device \\
+17         &   RTC (Timer/Clock) device \\
 \hline
 18         &   Input device \\
 \hline
@@ -769,6 +769,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \input{device-types/scmi/description.tex}
 \input{device-types/gpio/description.tex}
 \input{device-types/pmem/description.tex}
+\input{device-types/rtc/description.tex}
 
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
new file mode 100644
index 000000000000..abfa2206894e
--- /dev/null
+++ b/device-types/rtc/description.tex
@@ -0,0 +1,328 @@
+\section{RTC Device}\label{sec:Device Types / RTC Device}
+
+The RTC (Real Time Clock) device provides information about current
+time. The device can provide different clocks, e.g.\ for the UTC or TAI
+time standards, or for physical time elapsed since some past epoch. The
+driver can read the clocks with simple or more accurate methods.
+
+\subsection{Device ID}\label{sec:Device Types / RTC Device / Device ID}
+
+17
+
+\subsection{Virtqueues}\label{sec:Device Types / RTC Device / Virtqueues}
+
+\begin{description}
+\item[0] requestq
+\end{description}
+
+The driver enqueues requests to the requestq.
+
+\subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature bits}
+
+No device-specific feature bits are defined yet.
+
+\subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
+
+There is no configuration data for the device.
+
+\subsection{Device Initialization}\label{sec:Device Types / RTC Device / Device Initialization}
+
+The device determines the set of clocks. The device can provide zero or
+more clocks.
+
+\subsection{Device Operation}\label{sec:Device Types / RTC Device / Device Operation}
+
+For the requestq, the driver sends a message with a request, and
+receives the response in the device-writable part of the message. The
+requestq uses common request and response headers.
+
+\begin{lstlisting}
+/* common request header */
+struct virtio_rtc_req_head {
+	le16 msg_type;
+	u8 reserved[6];
+};
+
+/* common response header */
+struct virtio_rtc_resp_head {
+	u8 status;
+	u8 reserved[7];
+};
+\end{lstlisting}
+
+The \field{msg_type} field identifies the message type.
+
+The \field{status} field indicates whether the device successfully
+executed the request. The device sets the \field{status} field to one of
+the following values:
+
+\begin{lstlisting}
+#define VIRTIO_RTC_S_OK 0
+#define VIRTIO_RTC_S_EOPNOTSUPP 2
+#define VIRTIO_RTC_S_ENODEV 3
+#define VIRTIO_RTC_S_EINVAL 4
+#define VIRTIO_RTC_S_EIO 5
+\end{lstlisting}
+
+VIRTIO_RTC_S_OK indicates that the device successfully executed the
+request.
+
+If \field{status} is not VIRTIO_RTC_S_OK, the value of other response
+fields is undefined.
+
+VIRTIO_RTC_S_EOPNOTSUPP indicates that the device could not execute the
+specific request due to an implementation limitation. The device also
+returns status VIRTIO_RTC_S_EOPNOTSUPP for requests with unknown values
+in the fields \field{msg_type} or \field{hw_counter}.
+
+VIRTIO_RTC_S_ENODEV indicates that the \field{clock_id} field value
+supplied with the request does not identify a clock.
+
+VIRTIO_RTC_S_EINVAL indicates that
+
+\begin{itemize}
+\item the driver request values are not allowed by the specification or
+\item the device read-only part of the message, or device write-only
+	part of the message, is too small.
+\end{itemize}
+
+VIRTIO_RTC_S_EIO indicates that the device did not execute the request
+due to an error which was not caused by invalid input from the driver.
+
+All \field{reserved} fields are written as zero, and their value is
+ignored.
+
+The set of clocks does not change after feature negotiation completion,
+until device reset. The set of clocks should not change on device reset
+either (similar to negotiated features). Clock identifiers are
+zero-based, dense indices. All fields named \field{clock_id} contain
+clock identifiers.
+
+\subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Operation / Control Requests}
+
+Through \emph{control requests}, the driver requests information about
+the device capabilities. The driver enqueues control requests in the
+requestq.
+
+\begin{description}
+
+\item[VIRTIO_RTC_REQ_CFG] discovers the number of clocks.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_CFG 0x1000 /* message type */
+
+struct virtio_rtc_req_cfg {
+	struct virtio_rtc_req_head head;
+	/* no request params */
+};
+
+struct virtio_rtc_resp_cfg {
+	struct virtio_rtc_resp_head head;
+	le16 num_clocks;
+	u8 reserved[6];
+};
+\end{lstlisting}
+
+Field \field{num_clocks} contains the number of clocks. A device
+provides zero or more clocks. Valid clock ids are those smaller than
+\field{num_clocks}.
+
+\item[VIRTIO_RTC_REQ_CLOCK_CAP] discovers the capabilities of the clock
+identified by the \field{clock_id} field.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_CLOCK_CAP 0x1001 /* message type */
+
+struct virtio_rtc_req_clock_cap {
+	struct virtio_rtc_req_head head;
+	le16 clock_id;
+	u8 reserved[6];
+};
+
+struct virtio_rtc_resp_clock_cap {
+	struct virtio_rtc_resp_head head;
+	le16 type;
+	u8 reserved[6];
+};
+\end{lstlisting}
+
+The \field{type} field identifies the clock type. A device provides
+zero or more clocks for a clock type. The following clock types are
+defined:
+
+\begin{lstlisting}
+#define VIRTIO_RTC_CLOCK_UTC 0
+#define VIRTIO_RTC_CLOCK_TAI 1
+#define VIRTIO_RTC_CLOCK_MONO 2
+\end{lstlisting}
+
+VIRTIO_RTC_CLOCK_UTC uses the UTC (Coordinated Universal Time) time
+standard. The device uses the time epoch of January 1, 1970, 00:00
+UTC. This is the same epoch as \emph{Unix time}.
+
+VIRTIO_RTC_CLOCK_TAI uses the TAI (International Atomic Time) time
+standard. The device uses the time epoch of January 1, 1970, 00:00
+TAI.
+
+VIRTIO_RTC_CLOCK_MONO uses monotonic physical time (SI seconds
+subdivisions) since some unspecified epoch. The VIRTIO_RTC_CLOCK_MONO
+epoch is before or during device reset.
+
+Additional clock types may be standardized in the future.
+Implementation-specific clock type definitions are not recommended and
+use a clock type id greater than or equal to 0xF000.
+
+\item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device supports
+cross-timestamping for a particular pair of clock and hardware counter.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_CROSS_CAP 0x1002 /* message type */
+
+struct virtio_rtc_req_cross_cap {
+	struct virtio_rtc_req_head head;
+	le16 clock_id;
+	le16 hw_counter;
+	u8 reserved[4];
+};
+
+#define VIRTIO_RTC_FLAG_CROSS_CAP (1 << 0)
+
+struct virtio_rtc_resp_cross_cap {
+	struct virtio_rtc_resp_head head;
+	u8 flags;
+	u8 reserved[7];
+};
+\end{lstlisting}
+
+The \field{clock_id} field identifies the clock, and the
+\field{hw_counter} field identifies the hardware counter, for which
+cross-timestamp support is probed. The device sets flag
+\field{VIRTIO_RTC_FLAG_CROSS_CAP} in the \field{flags} field if the
+clock supports cross-timestamping for the particular clock and hardware
+counter, and clears the flag otherwise.
+
+\end{description}
+
+\subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Operation / Read Requests}
+
+Through \emph{read requests}, the driver requests clock readings from
+the device. The driver enqueues read requests in the requestq. The
+device obtains device-side clock readings and forwards these clock
+readings to the driver. The driver may enhance and interpret the clock
+readings through methods which are beyond the scope of this
+specification.
+
+Once DRIVER_OK has been set, the device should support reading every
+clock, even when a clock may yet have to be aligned to reference time
+sources.
+
+In general,
+
+\begin{itemize}
+\item clocks may jump backwards or forward, and
+\item the clock frequency may change. Clocks may be \emph{slewed},
+	i.e.\ clocks may run at a frequency other than their current
+	best frequency estimate.
+\end{itemize}
+
+E.g., a clock of type VIRTIO_RTC_CLOCK_UTC can insert UTC leap seconds.
+
+As long as a clock does not jump backwards, the driver clock readings
+increase monotonically:
+
+\begin{itemize}
+\item As long as a clock does not jump backwards in-between device-side
+	clock readings, the driver-side readings for that clock increase
+	monotonically as well, in the order in which the driver
+	marks read requests as available.
+
+\item The device marks read requests for the same clock as used in
+	the order in which the messages were marked as available.
+\end{itemize}
+
+For a clock of type VIRTIO_RTC_CLOCK_MONO, the device always returns
+monotonically increasing clock readings.
+
+The unit of all \field{clock_reading} fields is 1 nanosecond for all
+clock types which are part of the device specification so
+far.\footnote{For time epochs in year 1970 or later, this means that
+time until at least year 2553 can be represented in the \field{le64
+clock_reading} fields.}
+
+\begin{description}
+
+\item[VIRTIO_RTC_REQ_READ] reads the clock identified by the
+\field{clock_id} field. The device supports this message for every
+clock.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_READ 0x0001 /* message type */
+
+struct virtio_rtc_req_read {
+	struct virtio_rtc_req_head head;
+	le16 clock_id;
+	u8 reserved[6];
+};
+
+struct virtio_rtc_resp_read {
+	struct virtio_rtc_resp_head head;
+	le64 clock_reading;
+};
+\end{lstlisting}
+
+\field{clock_reading} is a device-side clock reading obtained after the
+message was marked as available.
+
+\item[VIRTIO_RTC_REQ_READ_CROSS] returns a cross-timestamp for the clock
+identified by the \field{clock_id} field.\footnote{Cross-timestamping
+is similar to the ptp_kvm mechanism in the Linux kernel.} This message
+may yield better performance than using VIRTIO_RTC_REQ_READ.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_READ_CROSS 0x0002 /* message type */
+
+struct virtio_rtc_req_read_cross {
+	struct virtio_rtc_req_head head;
+	le16 clock_id;
+	le16 hw_counter;
+	u8 reserved[4];
+};
+
+struct virtio_rtc_resp_read_cross {
+	struct virtio_rtc_resp_head head;
+	le64 clock_reading;
+	le64 counter_cycles;
+};
+\end{lstlisting}
+
+The \field{hw_counter} field specifies the hardware counter for which
+the driver requests a cross-timestamp.
+
+Cross-timestamping returns a \field{clock_reading}, and an associated
+hardware counter value, \field{counter_cycles}. The
+\field{counter_cycles} field is the approximate or precise value which
+the driver would have read at the \field{clock_reading} time instant
+from the hardware counter identified by \field{hw_counter}. How the
+device determines the value which the driver would have seen is beyond
+the scope of this specification.
+
+The following hardware counter identifiers are specified:
+
+\begin{lstlisting}
+/* Arm Generic Timer CNTVCT_EL0, Counter-timer Virtual Count register */
+#define VIRTIO_RTC_COUNTER_ARM_VIRT 0
+/* Arm Generic Timer CNTPCT_EL0, Counter-timer Physical Count register */
+#define VIRTIO_RTC_COUNTER_ARM_PHYS 1
+/* x86 Time-Stamp Counter */
+#define VIRTIO_RTC_COUNTER_X86_TSC 2
+\end{lstlisting}
+
+Additional hardware counter identifiers may be standardized in the
+future. Implementation-specific hardware counter identifiers are not
+recommended and are greater than or equal to 0xF000.
+
+The driver can determine whether the device supports
+VIRTIO_RTC_REQ_READ_CROSS for a specific clock and \field{hw_counter}
+through VIRTIO_RTC_REQ_CROSS_CAP.
+
+\end{description}
-- 
2.40.1


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

