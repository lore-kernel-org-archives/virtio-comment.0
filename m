Return-Path: <virtio-comment-return-4874-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D68C61DA4
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Mar 2023 04:11:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C803F2B01E
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Mar 2023 04:11:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B30F598633C
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Mar 2023 04:11:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9EC90986210; Mon, 13 Mar 2023 04:11:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 85312986267
	for <virtio-comment@lists.oasis-open.org>; Mon, 13 Mar 2023 04:11:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1678680706.314000
X-TM-MAIL-UUID: d5b6bb49-a518-481f-bacf-32613bcda332
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQb0pxDgpq5cM84U1K48Byy0sjZehOaWQp1y1KG201cJNddEtM2BVk1zqs2AWInejbB00Rac2lPDNi+EVY6KRBRlvv9YK0UCabbnrQRKgDZr/1m1zbOcpoirbqoiNN7KkYmgMeGKf19YK17cT+iH63Ye+MtZ9glGGEGVWRIA562jpW3wnNBTPh/yvcPUqnCye/fXyH7p68XCeolAc18jn4BCAHC1WuCyYN2O7QCGEBZ9eqLXAMG3ocm1KkykCr7NG8sQOfKK2K4JUnCiL4WY+AdkBCenktKWv2bM4TMiCaFj9VYoNawrR/kVzOBzoA9RVtKVy83tsVOiMHQMJE4LKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MzcTwFI4kcKKo/Bc+246j3MvSzybOhAibUA7zMqg2Q=;
 b=EM63m/5tKIhww0YBkgXT3tIVtcceE53ut46NiPkaJqNN+Gqwqb7ctW1zmFX6Q/U1/sPAjYcU/qe1KTy2OjQzQ5gpCpUDI38IZz/j0ovSbUpM6nQtdmOB/uevQgJ0CFS2nzDJoSwua8x3XloTFyAPOKU1FfLiJOdfvGSPWGo2zdQxfCBmUgSbOfnPjhMu52rH4HTzNZX9SSB5F3UH1tfTUr74YyHp3mkF3KvdVuZjxJKAXEH0FHRPhSxVe3XWp9lY1wObH8X1C3Dn/E/zaUFGKYca6vNzy3rxR7k7u2e4YqWgw3pSO4FGo5b+TlCqS+MdstquseyPYQRyKpNmU3aWfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 217.66.60.4) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=opensynergy.com; dmarc=pass (p=none sp=none pct=100)
 action=none header.from=opensynergy.com; dkim=none (message not signed);
 arc=none
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 217.66.60.4)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=opensynergy.com;
Received-SPF: Pass (protection.outlook.com: domain of opensynergy.com
 designates 217.66.60.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.66.60.4; helo=SR-MAIL-03.open-synergy.com; pr=C
From: Peter Hilber <peter.hilber@opensynergy.com>
To: virtio-comment@lists.oasis-open.org
Cc: Peter Hilber <peter.hilber@opensynergy.com>
Date: Mon, 13 Mar 2023 05:11:16 +0100
Message-Id: <20230313041116.126953-1-peter.hilber@opensynergy.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6EUR05FT022:EE_|BE1P281MB1586:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 55f503cd-2079-49cb-c5bd-08db23790ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KCiuNd8lq+GQrSP1LonnJcKkoUDr5/mzlQKd+rMKVviZthMf9DCSJ0xFW19UwerPuun3Smebpmt7fEj6RZVEXFiX61LVpjS82FITfRtCxFMilrYDqf6kuESop+Gl4yuf/xoztWIolZyFbV1nZPUCnmiwJF5aSBkSAhXBnaSyg77NCBdk5l71XMsDpd98GKswZ3UtST7bdx6Yu7MACer0HkMaJ1m98XwGEQhSZtyxfMHgq1ImnuDYWwUIHzKlwdrsLNFWRSPrj6xlYW4UHGG0m9ojCxGfPVHWWzlSv+0ZRdaHYHTY4kfo17pulHOMv/DNR7xQ+o7pDH+m0zyHWb3Q+/JTtFbCze1sHFcWqcu2w9kUo9Yu+NCXnDlLc4thCcAph/2pkFaVUQMIjs7ULE76HdIQkntelXtHZtLR9iSkbsi8d7q/Eo+OnwhST6WkYeOSEYeRQPT2map13rWNDF4CqKeGIrCrs7/zVi6TKzxtUHjp13ybgxdVbReSAKP5tD0xPKQlrZe7A3BohOmUBkEt7g4EfEHaB5H3uAm7ZpQi1SqWHDW0ceDDqoruF8fWlNWeVIP01QNczDdSolz4FOieDJribqNpT4r5HSGQ72/qp9nnEA/JghLToQyOX7akkW+7opQ/gYEqvqK37NbufdmDUVCpB8Tjg4GDfVDJNLOGv1Bg4+6/HL1nEQZDQ/P1Qk6esy5BV0bAn07qQ2dSGk1WRA==
X-Forefront-Antispam-Report:
	CIP:217.66.60.4;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(396003)(346002)(39830400003)(136003)(376002)(451199018)(46966006)(36840700001)(81166007)(66899018)(2906002)(83380400001)(36756003)(44832011)(30864003)(5660300002)(40480700001)(70206006)(70586007)(41300700001)(8936002)(4326008)(6916009)(8676002)(36860700001)(86362001)(42186006)(316002)(82310400005)(478600001)(47076005)(186003)(336012)(2616005)(26005)(107886003)(1076003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 04:11:43.3059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f503cd-2079-49cb-c5bd-08db23790ddf
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[217.66.60.4];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM6EUR05FT022.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB1586
X-TM-AS-ERS: 104.47.11.175-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1006-27500.005
X-TMASE-Result: 10--29.856400-4.000000
X-TMASE-MatchedRID: sZua6XOqWyU0b21ExFN2+hFbgtHjUWLyUh4weWPqOWTozDhGeQC9En70
	A4ClcIA86Y0NhLe2qGXAla7FuUkcWkRV7C9ojOZ1rMZ+BqQt2NpNLPQl0QAltEZCAhWuYEvkL6o
	ZUmkwXy2OdTVdSqE7E54gPdT8iLOToDlDgS6jzLS5x7uAXGEprT/FEHo4advawLkNMQzGl5B+Kr
	WCPbERP4+pAn19BHXOfRebBeurGSV1qnwsUimTHK5bb5QEYSkdX098A7fr3VdYC5LPd7BvbdPQ+
	kcNsyKz5BTo84QrjA6o8E/KKmmRUsLV1Ya6vtpD8Jb881FGn9l5IzfKVROBsx1VsgYzsXjClPCV
	1PehGgWIUW5joP14TSg1+1Ef4uXaFzf70NhciTtLVtf5IDutyTqu3dM+YhFRAolyO2xxVAUZ6mT
	iEUoyEkpTbdrdnhKCLSlPrzccxCv7dcWB6WPzwiwjpa51oXxrI249JK45aW2go0DxI7WwdIf61d
	bc+smNQMnbpl8rs6TDRC6H8CcjsSDhJglWIMN0xVQFfLw4zf9pkBMYDn8FeDxzAG47ocHfj0hcJ
	BCoQNFosxIdK6wN72t7nQ//sxplU+cRZYiWEzTl2CNM+DA49JQ7eT0DII9NDmmxK0Skkb1URtba
	WlO5VE6DZslMGRyGG2YnLyXCQfdfoxt2LOs25w7LUBXy1QPwCoPXqoZQJeZxej34c1tyiMEYHnJ
	ZxFh9/d5ANSJgPmDIoJ+R7C0wkxtybdvWAMHwfsrJIMK37At9LQinZ4QefBTJFL84IP3FlR1cT9
	YafQVGsz39UMlNSY6HM5rqDwqtlExlQIQeRG0=
X-TMASE-XGENCLOUD: ad340986-c399-4a34-8dc0-55c6da998e5e-0-0-200-0
X-TM-Deliver-Signature: 64F441C5172B8380F52E3524E29306AD
X-TM-Addin-Auth: IP2vqdChFnv9ppvtlM5itXSJ9Mwr9UyqPPV3PpaAAVpxrKgNUNv0E85/Lcq
	yEbujPH0VBmAO215o7KfMeQbDLYu0uSAVLaKS9U7RitNBdbmCbR9zbV4VIQ94gvbEEZT1ZFgeMd
	VpQOcDCFYsSrv8SYYM1GRaLGveGqlfrkUz7m/XADt0rIXZlh8y0uwvKCQHl/mVn4w/PbtjCZjvb
	ts/Aa11AmsnBkpPCxjv5VKw01HGiOrQ02clrxy/v/MjCMhSqGgCOQeKt38N26NBt5a9Ljp/RhRj
	rlpge93h3HwnV1g=.NpSHX9PQjX66TzEVbCKKrup6ZkCI5voaJI2bMsONain4a/e1nOTzCBw07t
	sW3BeYoX4eas5N84ZLNtQnjhdNQIcwIQRyELST5Nq1FA56uAW8/pDmQRLyHRLxqINaHpsfVwPj2
	b9Pk5SHXVwzqUtG/uZgYBPfht7oQtbVAbrwevv1Z6f20A7Jnxbl11qeYbMRKbX3mT7gqmZ1LQy0
	GZbnIc4M89QlMhCalSA9xkeTQ6396T+3+B+kVL40GjPqpQVEefO6yHmi7SHPPSrekqr5DHc6Fmv
	Jwae/1ToFaxliZH+1mj6eeSEOgEzBHl3uYH5tavVxrsZ7W4l/al2/VRgcqQ==
X-TM-Addin-ProductCode: EMS
Subject: [virtio-comment] [RFC PATCH] virtio-rtc: Add device specification.

This is a partial draft for a Real-Time Clock (RTC) device. The
virtio-rtc device provides information about current time through one or
more clocks.

It is planned to add a timer/alarm feature as part of a draft spec
update.

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

Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
---
 conformance.tex                         |   2 +
 content.tex                             |   3 +-
 device-types/rtc/description.tex        | 523 ++++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |  10 +
 device-types/rtc/driver-conformance.tex |   9 +
 5 files changed, 546 insertions(+), 1 deletion(-)
 create mode 100644 device-types/rtc/description.tex
 create mode 100644 device-types/rtc/device-conformance.tex
 create mode 100644 device-types/rtc/driver-conformance.tex

diff --git a/conformance.tex b/conformance.tex
index 01ccd69..423dc7a 100644
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
index cff548a..7c2aefe 100644
--- a/content.tex
+++ b/content.tex
@@ -628,7 +628,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 16         &   GPU device       \\
 \hline
-17         &   Timer/Clock device \\
+17         &   RTC (Timer/Clock) device \\
 \hline
 18         &   Input device \\
 \hline
@@ -710,6 +710,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \input{device-types/scmi/description.tex}
 \input{device-types/gpio/description.tex}
 \input{device-types/pmem/description.tex}
+\input{device-types/rtc/description.tex}
 
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
new file mode 100644
index 0000000..061f108
--- /dev/null
+++ b/device-types/rtc/description.tex
@@ -0,0 +1,523 @@
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
+values in the message-specific \field{message_type} or
+\field{hw_counter} fields.
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
+VIRTIO_RTC_S_DEVERR indicates that the device encountered an error while
+executing the request, which could not be attributed to invalid input
+from the driver.
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
+\field{status} field to VIRTIO_RTC_S_UNSUPP if the device could not
+execute the specific request due to an implementation limitation.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_UNSUPP for a request with a value
+of the \field{message_type} field which is neither described in this
+specification nor otherwise known to the implementation.
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
+\field{status} field to VIRTIO_RTC_S_INVAL if the request values are not
+allowed by the specification and none of the previous requirements in
+this document stipulated another \field{status}.
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
+\drivernormative{\paragraph}{controlq Operation}{Device Types / RTC Device / Device Operation / controlq Operation}
+
+The driver MUST put the request into the device-readable part of the
+controlq message.
+
+The driver MUST allocate enough space for the response in the
+device-writable part of the controlq message.
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
+The driver determines whether VIRTIO_RTC_M_READ_CROSS is supported for a
+specific clock and \field{hw_counter} by requesting the message and
+testing that the status is VIRTIO_RTC_S_OK.
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
+If VIRTIO_RTC_F_READ_CROSS was not negotiated, the driver MUST NOT send
+the VIRTIO_RTC_M_READ_CROSS message.
+
+For VIRTIO_RTC_M_READ_CROSS, the driver MUST set \field{hw_counter} to
+one of the hardware counter identifiers defined in this specification,
+or to a value greater than or equal to 0xF000.
diff --git a/device-types/rtc/device-conformance.tex b/device-types/rtc/device-conformance.tex
new file mode 100644
index 0000000..85fdcd3
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
index 0000000..1894884
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

base-commit: 8797f4d4e41032cea86b1a3a93df1bb5a9fd9a9b
-- 
2.37.2


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

