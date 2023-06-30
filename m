Return-Path: <virtio-comment-return-6652-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86221EB64DA
	for <virtio-comment@archiver.kernel.org>; Fri, 30 Jun 2023 09:31:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9E3C22B01A
	for <virtio-comment@archiver.kernel.org>; Fri, 30 Jun 2023 09:31:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 899999866F5
	for <virtio-comment@archiver.kernel.org>; Fri, 30 Jun 2023 09:31:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 75FBB9866EB; Fri, 30 Jun 2023 09:31:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62A7B9866EC
	for <virtio-comment@lists.oasis-open.org>; Fri, 30 Jun 2023 09:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1688117481.087000
X-TM-MAIL-UUID: cb47040a-d747-4ec9-9637-8f657323a4d3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSIYeqA7zSoukm1/wB5CQikog9lE2o7YLtT7BLV+S9npL2wRUt2lAexO9Ft/IfH25UYoUdyRYJqIKQ0O0TgyKlgnMxBLyWru/Eoy+OB4S3BHQgBLXB4HGngarlqbAZzYCqTsk3BXjxzIzMfq44Oz3JQ4wHkYu8pNV84ufJ1REkqhoIWB6SRb5L3E+qHCuwaK4hDZpQhnv06qfaBuCzhTd4vP63QKU73/caxPyv/HiXyXoPFz96pAo0ULDqOWEor7vSpVhRv2Kp9GLAOaV4dzNfiHIIhVKg9dOdp7LmWjHaPIkFhVCkFpA4iuDelrMwF6v00Pmy7ZlE+E3CX+Op8DgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6gzOiio84nVFso9J/5Q2YGIuuv0huRKRhnX+RfJeOQ=;
 b=TQEMb362G9MmT5WD3o3MhB5BtkjxOmDUExICiKsj2Z3VCYQ9fD9Tp8BLriFTYfi3GPqxBCbqAGjKE5VdY+QRfFIQZMkatCR5LIFO8Y+Znn3WxLXG3nGblGN4FIsL7I2FdMZDY8tgExwft2X9YXDbMVUKtBel9t9bPNmzjaTroyA/f0JFG3mIj+4Qw3JIJKTTgNsS3nfHFYsnGds21PZX3e7VtkIWsON2Vh42Kq8p/7TbXr/xQY5XTdONRm/6DkbMzgweSYxTC1QDC7TdMreuMazmP05KoDsCuC5um2rQPN0YqLnvLM+j4mP5Y2iNimwYRQ5rSs+3SckAnBS7wd4x/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 217.66.60.4) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=opensynergy.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=opensynergy.com; dkim=none (message not
 signed); arc=none
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 217.66.60.4)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=opensynergy.com;
Received-SPF: Pass (protection.outlook.com: domain of opensynergy.com
 designates 217.66.60.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.66.60.4; helo=SR-MAIL-03.open-synergy.com; pr=C
From: Peter Hilber <peter.hilber@opensynergy.com>
To: virtio-comment@lists.oasis-open.org
Cc: Cornelia Huck <cohuck@redhat.com>,
	Peter Hilber <peter.hilber@opensynergy.com>
Date: Fri, 30 Jun 2023 11:29:59 +0200
Message-Id: <20230630092959.392381-1-peter.hilber@opensynergy.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6EUR05FT051:EE_|BE1P281MB2754:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e7ab2ef8-0ef7-48f8-85c7-08db794cc227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ncpgtzzgj/vbjger8T4b4x3nuFSyJwn3FTaxhpRVW2dB+zmXsBCfcbBO3ra5x4T4P2ukLg/JPb4Vv32F4GSDLYiEv5taj/yvtGh1qaryFKXdbjpki0Y6tbpuJUeX1WsHr043l26y2+fjv3CktcHVas6aPDK3pg0+4FsjhByrSEvHGPFExPxVlocgAz1siM5gVyWiXMQ06C79lNMf0uIIJrHliqgEFHZBo+IQ88lJaiphlCwFkBFD4jlQLriVb028O6DuJCJi2R0VgaIInwjS8s8Tecm5+5rYLD6qLgQjhIXw6pSwiGqCPXBx1i1SU2a7Qc8HI4hsDTDbhdJxEysvjri05Sn0/o6JvOGgSWywfJmZonVw+8WWo17QORSaqy0kweB9wLzJiIT37wO1UAuCOWc74bprucyHavTBx1khxqjvyioOwwJkqZO160a2rOIZx/KrEDuUjaf63XoBCKv0ZKsIGoDk2Hxw6LMWuUKE3eHuypEV9asiGQRXq1wqX8tKeUFT7tpwOAU8cb8vCmuItLdtqI3ffjQqHukU6yLJ2hBTecgWfcYN4LfCQkYx24g1R0ox6B/GsZFIQYjDwG4dbd4+phfK1qGYt6QT9sE2gt5dvzlpGRxMwyeU9rvxv4qDqxBagsxf5J+eNZIAf5/RDCLEOHNn1ItrjCj0Ds/sJQzXynEv0QrzGY8a6f9J9IJMZHDkEmlCte28HnveAl9AkAIcvG4ogGd9HsFORma+O+QFeRtAJZQ8DiUqyM5qMff3S3A1xmQAVtJtitf6U4ZT3A==
X-Forefront-Antispam-Report:
	CIP:217.66.60.4;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(376002)(136003)(39840400004)(396003)(346002)(451199021)(46966006)(36840700001)(82310400005)(66899021)(2616005)(81166007)(107886003)(86362001)(70586007)(966005)(70206006)(2906002)(316002)(36756003)(42186006)(478600001)(4326008)(6916009)(54906003)(36860700001)(47076005)(40480700001)(186003)(1076003)(83380400001)(41300700001)(44832011)(30864003)(5660300002)(8936002)(8676002)(26005)(336012)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 09:31:18.3965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ab2ef8-0ef7-48f8-85c7-08db794cc227
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[217.66.60.4];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM6EUR05FT051.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2754
X-TM-AS-ERS: 104.47.11.170-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1011-27722.006
X-TMASE-Result: 10--24.346000-4.000000
X-TMASE-MatchedRID: 29kHMs2vf06UP+0hdpOx0niXIXWXK9Stp9ot5GYsw7HlNADTSrHglcYL
	JlEwoYGI2S8Ift+3Yti39QY0CIkzyNp+SXfZ1mpyNU4Kh23d7qNCKdqcEPNeC4vXantxmoFY7v7
	BMdRZyXPTyrg8xRsA+JN1gzX8A+AxgT8tqENmYHfSlRrVG2nKg9Uusl/JVaRNCw80CQ95LdCUiP
	2ss3hNrMO1oHRChDtjynqv1hVDlo9PfXLU39GOm+sfkPrj7CaqG6vAF77GsJYC28FWVjkhF304N
	fdr939pOQnxHXc9Vi/lE3nSJ4xeM4kc+IJJwSKg7PuxPfP7XCBymuV610MsUlkDEupan34PE0Ju
	/Tn0G6fY5AO2SHgtIbb+bZWNEQdxdXYpcDl2V50HNShWtYdI6QsU84yAcXitpFcuHYtFCBSsj8z
	BmH06fX7IEsrGVz2MgIw7WsDzEBXeQqN6yH1Rdbr2u0KWqQKN94kIOIViafU32MNYHthSk+/FBj
	C4SYeRN3YMg8Y1u4oai4dOqnb5ccILzPzZao/uAZiMK6zpatUnaqAs49Jwkcq/S3BP6egbRXLcK
	4CxqO3bcsoESsEDuMW54pkLRtcqJxW5Nij7gGyx5Z6Cya1XjNZEjr6xrP/hYKYx8Hnn9hJdHFJf
	+QMY6wFbyF7J8nlpkGms9aEE6b5NbjaRkT92+cFwCSR9lLGIfq7xWexVq1wvMl4D6O45r4LkqhN
	V5i5NdCPHsolBHkqqkBBg2pFUi4a2mIjVy6Y2BYoad7rTC6BraLL6Gp9UPP0Nlfg0igndi7Wfb0
	bKj8F+etuLGNIfIriK1U4I07XyF1wVJQihL6bFTQGAKRxj5No+48giqZwnEgg3cwDHl/0S3WM79
	W3o4ma3xca03R6M/utaD2GffWp4bd6tiMFuXX7cGd19dSFd
X-TMASE-XGENCLOUD: 4c7e0f5b-5585-4a43-a61d-4169c7c21cf9-0-0-200-0
X-TM-Deliver-Signature: BD51001B31AAB8519C649754872401D0
X-TM-Addin-Auth: bBcQYN/uED5YiqPswZSNhGBr7pw72EbTbNr+U9G5GdiXzQ2tHhPF1JBt8Md
	5VTs0+bQYRgI2zQa78lvJadLQX5WLMF+ZF8zJ4J4qieT6jbvq5MqLrQecGEWfSKu7l7KzoYM18q
	uicVTEds0DWb/FXWZfxs1E7PG/iPzTNaqba9FkFTFC2Z03Mtwt0wWCPs9uE6yBk00axO3x1GvRx
	Q8VkASkRSWzzzWRZAYZarbUqabJL5SumMPEZ9/tbc2EPRLR3WKJGOXUjLVP59l4CvLHxyd/10Fo
	fDT2L91V/cGB2eg=.o6t6nvJ6vXZcDXk34KMtgGJVc3AFRaH6EX9dikTd12+WRxkj8VNxaP0vBu
	UZ5dd01j8CWGRvdUW7rJLltYZhGsBbUORAigHJWGbEr/7Gqti0VMb6f2S0hWq0QuR3aMbZK06IR
	HrGeXJP1+YjVfBx1GCp7jM0Bc/9QLyJSupbKfT/QCCEPHbZzqOPcdQVQaeKymukumARWO2MaLvd
	hi/9CI2K+v05FpSIzQL/WJuMX81l6gcpJu6nDwmOxzniJhygQky7PUlVoiTZa9OwWiPKxFXMr62
	AppF9HSf2OMpKQMkD1k+fy/4JKvL1S59FjO936vzJWsVO737vU2Y0rVMn+g==
X-TM-Addin-ProductCode: EMS
Subject: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device specification.

This is a partial draft for a Real-Time Clock (RTC) device. The
virtio-rtc device provides information about current time through one or
more clocks.

v2 is a minor update which should match the Linux kernel driver patch
series to be posted soon. It is planned to add a timer/alarm feature as
part of a later draft spec update.

The draft uses the "Timer/Clock" device id which is already part of the
specification. This device id was registered a long time ago and should
be unused according to the author's information. The name "RTC" was
determined to be the best for a device which focuses on current time,
but is up to discussion.

For this device, there is a prototypical Linux kernel driver for which
upstreaming is planned, and a proprietary device implementation.

In the spec text, there is some redundancy between the informative and
the normative text. The intent is that the informative text already
gives all the essential information about the device.

In the spec, clock ids are 64 bit wide to have unique ids when
supporting clock hot-plugging in the future.

Any feedback is appreciated very much.

v2:

- Add VIRTIO_RTC_M_CROSS_CAP message [1].
- Fix various minor issues and improve wording [1].
- Add several clarifications regarding device error statuses.

[1] https://lists.oasis-open.org/archives/virtio-comment/202304/msg00523.html

Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
---
 conformance.tex                         |   2 +
 content.tex                             |   3 +-
 device-types/rtc/description.tex        | 582 ++++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |  10 +
 device-types/rtc/driver-conformance.tex |   9 +
 5 files changed, 605 insertions(+), 1 deletion(-)
 create mode 100644 device-types/rtc/description.tex
 create mode 100644 device-types/rtc/device-conformance.tex
 create mode 100644 device-types/rtc/driver-conformance.tex

diff --git a/conformance.tex b/conformance.tex
index 01ccd693b245..423dc7af1e3c 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -152,6 +152,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/scmi/driver-conformance.tex}
 \input{device-types/gpio/driver-conformance.tex}
 \input{device-types/pmem/driver-conformance.tex}
+\input{device-types/rtc/driver-conformance.tex}
 
 \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
 
@@ -238,6 +239,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/scmi/device-conformance.tex}
 \input{device-types/gpio/device-conformance.tex}
 \input{device-types/pmem/device-conformance.tex}
+\input{device-types/rtc/device-conformance.tex}
 
 \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
 A conformant implementation MUST be either transitional or
diff --git a/content.tex b/content.tex
index d2ab9eb0d775..f5207a6916b9 100644
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
@@ -765,6 +765,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \input{device-types/scmi/description.tex}
 \input{device-types/gpio/description.tex}
 \input{device-types/pmem/description.tex}
+\input{device-types/rtc/description.tex}
 
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
new file mode 100644
index 000000000000..e0fa864a4a9c
--- /dev/null
+++ b/device-types/rtc/description.tex
@@ -0,0 +1,582 @@
+\section{RTC Device}\label{sec:Device Types / RTC Device}
+
+The RTC (Real Time Clock) device provides information about current
+time. The device can provide different clocks, e.g.\ for the UTC or TAI
+time standards, or for physical time elapsed since some past epoch.
+Drivers can read the clocks with simple or more accurate methods.
+
+\subsection{Device ID}\label{sec:Device Types / RTC Device / Device ID}
+
+17
+
+\subsection{Virtqueues}\label{sec:Device Types / RTC Device / Virtqueues}
+
+\begin{description}
+\item[0] readq
+\item[1] controlq
+\end{description}
+
+The driver initiates clock readings through requests to the
+readq.\footnote{The readq is a dedicated virtqueue to facilitate
+reducing latency for clock readings, which may be more
+performance-sensitive than other requests.} The driver uses the controlq
+for other requests to the device.
+
+\subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature bits}
+
+\begin{description}
+\item[VIRTIO_RTC_F_READ_CROSS (0)] Device supports cross-timestamping.
+\end{description}
+
+VIRTIO_RTC_F_READ_CROSS determines whether the device supports clock
+reading with cross-timestamping. Without this feature, the device does
+not support cross-timestamping. Even when this feature was negotiated,
+the device may still not support cross-timestamping for some clocks, or
+for particular requests.
+
+\devicenormative{\subsubsection}{Feature bits}{Device Types / RTC Device / Feature bits}
+
+The device SHOULD offer VIRTIO_RTC_F_READ_CROSS if the device can
+support cross-timestamping for any of its clocks.
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
+For the readq and the controlq, the driver sends a message with a
+request, and receives the response in the device-writable part of the
+message. readq and controlq messages use common request and response
+headers.
+
+\begin{lstlisting}
+/* common request header */
+struct virtio_rtc_req_head {
+	__le16 msg_type;
+	__u8 reserved[2];
+};
+
+/* common response header */
+struct virtio_rtc_resp_head {
+	__u8 status;
+	__u8 reserved[3];
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
+#define VIRTIO_RTC_S_UNSUPP 1
+#define VIRTIO_RTC_S_NODEV 2
+#define VIRTIO_RTC_S_INVAL 3
+#define VIRTIO_RTC_S_DEVERR 4
+\end{lstlisting}
+
+VIRTIO_RTC_S_OK indicates that the device successfully executed the
+request.
+
+If \field{status} is not VIRTIO_RTC_S_OK, the value of the
+message-specific response fields is undefined.
+
+VIRTIO_RTC_S_UNSUPP indicates that the device could not execute the
+specific request due to an implementation limitation. The device also
+returns status VIRTIO_RTC_S_UNSUPP for message requests with unknown
+values in the message-specific \field{msg_type} or \field{hw_counter}
+fields.
+
+VIRTIO_RTC_S_NODEV indicates that the \field{clock_id} field value
+supplied with the message request does not identify a clock.
+
+VIRTIO_RTC_S_INVAL indicates that
+
+\begin{itemize}
+\item the driver request values are not allowed by the specification or
+\item the device read-only part of the message, or device write-only
+	part of the message, is too small.
+\end{itemize}
+
+VIRTIO_RTC_S_DEVERR indicates that the device did not execute the
+request due to an error which was not caused by invalid input from the
+driver.
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
+\devicenormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_OK if the device successfully
+executed the request.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to a status other than VIRTIO_RTC_S_OK if the
+device did not successfully execute the request.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_UNSUPP if the device could not
+execute the specific request due to an implementation limitation.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_UNSUPP for a request with a value
+of the \field{msg_type} field which is not described in this
+specification.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_UNSUPP for a request with a value
+of the \field{hw_counter} field which is neither described in this
+specification nor otherwise known to the implementation.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_NODEV if the \field{clock_id} field
+value supplied with the message request does not identify a clock.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_INVAL if the request values are
+inconsistent with the specification and if the inconsistence is not
+described by the requirements which stipulate status VIRTIO_RTC_S_UNSUPP
+or VIRTIO_RTC_S_NODEV.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_INVAL if the device read-only part
+of the message is too small.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_INVAL if the device write-only part
+of the message is too small, unless the \field{status} field does not
+fit into the device write-only part.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST NOT set the
+\field{status} field if the \field{status} field does not fit into the
+device write-only part.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_DEVERR if none of the previous
+requirements in this document stipulated another \field{status}.
+
+If the device read-only part of a message M is bigger than the size of
+the request specified for message M, the device MUST ignore the
+additional space.
+
+If the device write-only part of a message M is bigger than the size of
+the response specified for message M, the device MUST ignore the
+additional space.
+
+The device MUST NOT interpret \emph{reserved} fields in the
+device-readable part of the message.
+
+The device MUST set \emph{reserved} fields in the device-writable part
+of the message to zero.
+
+The device MUST set unnamed bits in \emph{flags} fields in the
+device-writable part of the message to zero.
+
+After feature negotiation completion the device MUST NOT change the set
+of clocks until device reset.
+
+The device SHOULD NOT change the set of clocks on a device reset after
+the first device reset.
+
+The device MUST use non-negative integers, which are smaller than the
+number of clocks, as clock identifiers.
+
+\drivernormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
+
+If the \field{struct virtio_rtc_resp_head} field \field{status} is not
+VIRTIO_RTC_S_OK, the driver MUST NOT interpret response fields other
+than \field{status}.
+
+The driver MUST set \emph{reserved} fields in the device-readable part
+of the message to zero.
+
+The driver MUST NOT interpret \emph{reserved} fields in the
+device-writable part of the message.
+
+The driver MUST NOT interpret unnamed bits in \emph{flags} fields in the
+device-writable part of the message.
+
+\subsubsection{controlq Operation}\label{sec:Device Types / RTC Device / Device Operation / controlq Operation}
+
+The driver uses the controlq for all requests to the device, other than
+clock readings.
+
+\begin{description}
+
+\item[VIRTIO_RTC_M_CFG] discovers the number of clocks.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_M_CFG 0x1000 /* message type */
+
+struct virtio_rtc_req_cfg {
+	struct virtio_rtc_req_head head;
+	/* no request params */
+	__u8 reserved[4];
+};
+
+struct virtio_rtc_resp_cfg {
+	struct virtio_rtc_resp_head head;
+	__le16 num_clocks;
+	__u8 reserved[10];
+};
+\end{lstlisting}
+
+Field \field{num_clocks} contains the number of clocks. A device
+provides zero or more clocks. Valid clock ids are those smaller than
+\field{num_clocks}.
+
+\item[VIRTIO_RTC_M_CLOCK_CAP] discovers the capabilities of the clock
+identified by the \field{clock_id} field.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_M_CLOCK_CAP 0x1001 /* message type */
+
+struct virtio_rtc_req_clock_cap {
+	struct virtio_rtc_req_head head;
+	__u8 reserved[4];
+	__le64 clock_id;
+};
+
+struct virtio_rtc_resp_clock_cap {
+	struct virtio_rtc_resp_head head;
+	__le16 type;
+	__u8 reserved[10];
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
+\item[VIRTIO_RTC_M_CROSS_CAP] discovers whether the device supports
+cross-timestamping for a particular pair of clock and hardware counter.
+If the VIRTIO_RTC_F_READ_CROSS feature has been negotiated, the driver
+can send the VIRTIO_RTC_M_CROSS_CAP message.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_M_CROSS_CAP 0x1002 /* message type */
+
+struct virtio_rtc_req_cross_cap {
+	struct virtio_rtc_req_head head;
+	__le16 hw_counter;
+	__u8 reserved[2];
+	__le64 clock_id;
+};
+
+#define VIRTIO_RTC_FLAG_CROSS_CAP 0
+
+struct virtio_rtc_resp_cross_cap {
+	struct virtio_rtc_resp_head head;
+	__u8 flags;
+	__u8 reserved[11];
+};
+\end{lstlisting}
+
+The \field{clock_id} field identifies the clock, and the
+\field{hw_counter} field identifies the hardware counter, for which
+cross-timestamp support is probed. The device sets bit
+\field{VIRTIO_RTC_FLAG_CROSS_CAP} in the \field{flags} field if the
+clock supports cross-timestamping for the particular clock and hardware
+counter, and clears the bit otherwise.
+
+\end{description}
+
+\devicenormative{\paragraph}{controlq Operation}{Device Types / RTC Device / Device Operation / controlq Operation}
+
+For a fixed controlq message request value V, the device SHOULD either,
+for every request with value V, always execute successfully, or, for
+every request with value V, always set a fixed \field{status} other than
+VIRTIO_RTC_S_OK.
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST use the UTC
+time standard (Coordinated Universal Time).
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST use the time
+epoch of January 1, 1970, 00:00 UTC.
+
+For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the TAI
+time standard (International Atomic Time).
+
+For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the time
+epoch of January 1, 1970, 00:00 TAI.
+
+For any clock of type VIRTIO_RTC_CLOCK_MONO, the device MUST use SI
+seconds subdivisions.
+
+For any clock of type VIRTIO_RTC_CLOCK_MONO, the device MUST use an
+epoch at a time instant before or during device reset.
+
+For message VIRTIO_RTC_M_CLOCK_CAP, the device MUST set \field{type} to
+one of the clock types defined in this specification, or to a value
+greater than or equal to 0xF000.
+
+For a VIRTIO_RTC_M_CROSS_CAP message M, the device MUST set the
+VIRTIO_RTC_FLAG_CROSS_CAP bit in the \field{flags} field if the device
+would respond to a VIRTIO_RTC_M_READ_CROSS message with the same
+\field{hw_counter} and \field{clock_id} values as in M with status
+VIRTIO_RTC_S_OK, and clear the bit otherwise.
+
+\drivernormative{\paragraph}{controlq Operation}{Device Types / RTC Device / Device Operation / controlq Operation}
+
+The driver MUST put the request into the device-readable part of the
+controlq message.
+
+The driver MUST allocate enough space for the response in the
+device-writable part of the controlq message.
+
+The driver MUST negotiate VIRTIO_RTC_F_READ_CROSS before sending a
+VIRTIO_RTC_M_CROSS_CAP message.
+
+For VIRTIO_RTC_M_CROSS_CAP, the driver MUST set \field{hw_counter} to
+one of the hardware counter identifiers defined in this specification,
+or to a value greater than or equal to 0xF000.
+
+\subsubsection{readq Operation}\label{sec:Device Types / RTC Device / Device Operation / readq Operation}
+
+The driver requests clock readings through readq messages. The device
+obtains device-side clock readings and forwards these clock readings to
+the driver. The driver may enhance and interpret the clock readings
+through methods which are beyond the scope of this specification.
+
+Once DRIVER_OK has been set, the device should continuously support
+reading every clock, even when a clock may yet have to be aligned to
+reference time sources.
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
+	marks readq messages as available.
+
+\item The device marks readq messages for the same clock as used in
+	the order in which the messages were marked as available.
+\end{itemize}
+
+For a clock of type VIRTIO_RTC_CLOCK_MONO, the device always returns
+monotonically increasing clock readings.
+
+The unit of all \field{clock_reading} fields is 1 nanosecond for all
+clock types which are part of the device specification so
+far.\footnote{For time epochs in year 1970 or later, this means that
+time until at least year 2553 can be represented in the \field{__le64
+clock_reading} fields.}
+
+\begin{description}
+
+\item[VIRTIO_RTC_M_READ] reads the clock identified by the
+\field{clock_id} field. The device supports this message for every
+clock.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_M_READ 0x0001 /* message type */
+
+struct virtio_rtc_req_read {
+	struct virtio_rtc_req_head head;
+	__u8 reserved[4];
+	__le64 clock_id;
+};
+
+struct virtio_rtc_resp_read {
+	struct virtio_rtc_resp_head head;
+	__u8 reserved[4];
+	__le64 clock_reading;
+};
+\end{lstlisting}
+
+\field{clock_reading} is a device-side clock reading obtained after the
+message was marked as available.
+
+\item[VIRTIO_RTC_M_READ_CROSS] returns a cross-timestamp for the clock
+identified by the \field{clock_id} field.\footnote{Cross-timestamping
+is similar to the ptp_kvm mechanism in the Linux kernel.} This message
+may yield better performance than using VIRTIO_RTC_M_READ. If the
+VIRTIO_RTC_F_READ_CROSS feature has been negotiated, the driver can send
+the VIRTIO_RTC_M_READ_CROSS message.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_M_READ_CROSS 0x0002 /* message type */
+
+struct virtio_rtc_req_read_cross {
+	struct virtio_rtc_req_head head;
+	__le16 hw_counter;
+	__u8 reserved[2];
+	__le64 clock_id;
+};
+
+struct virtio_rtc_resp_read_cross {
+	struct virtio_rtc_resp_head head;
+	__u8 reserved[4];
+	__le64 clock_reading;
+	__le64 counter_cycles;
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
+Even if VIRTIO_RTC_F_READ_CROSS has been negotiated, the device may not
+support VIRTIO_RTC_M_READ_CROSS for a particular clock or for particular
+hardware counters.
+
+The driver can determine whether VIRTIO_RTC_M_READ_CROSS is supported
+for a specific clock and \field{hw_counter} through message
+VIRTIO_RTC_M_CROSS_CAP.
+
+\end{description}
+
+\devicenormative{\paragraph}{readq Operation}{Device Types / RTC Device / Device Operation / readq Operation}
+
+For a fixed readq message request value V, the device SHOULD either, for
+every request with value V, always execute successfully, or, for every
+request with value V, always set a fixed \field{status} other than
+VIRTIO_RTC_S_OK.
+
+The device SHOULD continuously support reading of all clocks once
+DRIVER_OK has been set.
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MAY insert UTC
+leap seconds.
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MAY smear UTC
+leap seconds through clock slewing.
+
+For any clock C and readq messages \emph{A} and \emph{B} which read C,
+\emph{A} being the message which the driver marks as available before
+\emph{B}, the device MUST obtain the \field{clock_reading} value for the
+message \emph{A} response before the \field{clock_reading} value for the
+message \emph{B} response, or the device MUST obtain the same
+\field{clock_reading} value for both \emph{A} and \emph{B}.
+
+For any clock C, the device MUST mark all readq messages reading C as
+used in the total order in which the driver marked the readq messages as
+available.
+
+For any clock C of type VIRTIO_RTC_CLOCK_MONO and readq messages
+\emph{A} and \emph{B} which read C, \emph{A} being the message which the
+driver marks as available before \emph{B}, the device MUST set the
+\field{clock_reading} value for the message \emph{B} response to a value
+greater than or equal to the \field{clock_reading} value for the message
+\emph{A} response.
+
+The device MUST support VIRTIO_RTC_M_READ for every clock.
+
+For message VIRTIO_RTC_M_READ and for any clock type listed in this
+specification, the device MUST use the nanosecond as unit for field
+\field{clock_reading}.
+
+For readq messages, the device MUST obtain the \field{clock_reading}
+response value after the message is marked as available.
+
+For message VIRTIO_RTC_M_READ_CROSS, the device MUST set
+\field{counter_cycles} to a value which approximates the value which the
+driver would have read from the hardware counter identified by
+\field{hw_counter} at the time instant when the device read the
+\field{clock_reading} value.
+
+For message VIRTIO_RTC_M_READ_CROSS, the device MUST set \field{status}
+to a value other than \field{VIRTIO_RTC_S_OK} if the device cannot
+determine the approximate value which the driver would have read from
+the hardware counter identified by \field{hw_counter} at the time
+instant when the device read the \field{clock_reading} value.
+
+For any clock C, and VIRTIO_RTC_M_READ_CROSS messages \emph{A} and
+\emph{B} which read C and which specify the same hardware counter
+\emph{H} through field \field{hw_counter}, \emph{A} being the message
+which the driver marks as available before \emph{B}, the device MUST set
+the \field{counter_cycles} value for \emph{B} to a value which \emph{H}
+shows after the \field{counter_cycles} value of \emph{A}, or the device
+MUST set the same \field{counter_cycles} value for \emph{A} and
+\emph{B}.
+
+For message VIRTIO_RTC_M_READ_CROSS and for any clock type listed in
+this specification, the device MUST use the nanosecond as unit for
+field \field{clock_reading}.
+
+\drivernormative{\paragraph}{readq Operation}{Device Types / RTC Device / Device Operation / readq Operation}
+
+The driver MUST put the request into the device-readable part of the
+readq message.
+
+The driver MUST allocate enough space for the response in the
+device-writable part of the readq message.
+
+The driver MUST negotiate VIRTIO_RTC_F_READ_CROSS before sending a
+VIRTIO_RTC_M_READ_CROSS message.
+
+For VIRTIO_RTC_M_READ_CROSS, the driver MUST set \field{hw_counter} to
+one of the hardware counter identifiers defined in this specification,
+or to a value greater than or equal to 0xF000.
diff --git a/device-types/rtc/device-conformance.tex b/device-types/rtc/device-conformance.tex
new file mode 100644
index 000000000000..85fdcd3a4fba
--- /dev/null
+++ b/device-types/rtc/device-conformance.tex
@@ -0,0 +1,10 @@
+\conformance{\subsection}{RTC Device Conformance}\label{sec:Conformance / Device Conformance / RTC Device Conformance}
+
+An RTC device MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{devicenormative:Device Types / RTC Device / Feature bits}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / controlq Operation}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / readq Operation}
+\end{itemize}
diff --git a/device-types/rtc/driver-conformance.tex b/device-types/rtc/driver-conformance.tex
new file mode 100644
index 000000000000..18948843e528
--- /dev/null
+++ b/device-types/rtc/driver-conformance.tex
@@ -0,0 +1,9 @@
+\conformance{\subsection}{RTC Driver Conformance}\label{sec:Conformance / Driver Conformance / RTC Driver Conformance}
+
+An RTC driver MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation / controlq Operation}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation / readq Operation}
+\end{itemize}

base-commit: 92295f3cb9479ce9fa5f440c3f34af17d45dab3b
-- 
2.39.2


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

