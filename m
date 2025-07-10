Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A790A28CF77
	for <virtio-comment@lists.linux.dev>; Thu, 10 Jul 2025 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752138503; cv=none; b=eMxI3G/lLQaW+nPgEe4lly9ds+EGNPZaIZwzT9kRIUhH7Md0eZnOlkPXUsrmRARHPxDdFH00AtGzaUSmZ7jnuTHv15tnu/eHY14I9b//FGsgBwSPMulYmGBQKhmDsGTzXvnjnY8y0E05qX1M9ZgGEwSVJqEpzca8TMPumInMaZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752138503; c=relaxed/simple;
	bh=wOL+0EHip00Uv4DmnDPygnVCOfgQIcGIBkqH0dRp2bw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PxV1dowxHd8LfxYWMUoOymO8Dc8E0J6/nDbS1f0Bhe68V7D3Pxw0+liDz5+FWcBhs+meLU5Gzjtm3N0urmM0SXUzYp1Qys39TqluBJhZ3tEwa1Xhey73YlhC5gdAH5CPlJcmqCQpiq3h3IPbG6YijMbMWYVZ9gziZ1/5ciF4aJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J9Y2UPmp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J9Y2UPmp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A1Nw96011520;
	Thu, 10 Jul 2025 09:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AMymlguPT8Ovg+Gg5HGjsGYKqG7aCiAYwsttZEvyO9I=; b=J9Y2UPmpvPLV/ZUQ
	3MMj1GyAP9pkG4pYPJBGi9upDt4FDZ2gKY/UNICaNaSjq54sE8z+QFL5rZQmBVvq
	GvzTUQcgww8X1CDMMIUFUq7/ZVp4zKDcNeu25gojCbwX3ro88V3rRmDewm2sbx1V
	LsWXT1QD+iEDDUoFeJedr2AzrLHbUOLV3QLBQ0wUlztYcYvdL18ATv6dPhFYUoAP
	ZMfjrzx1DXvSX80gIGk6myQMIibjmkl5EiMJJm0nLZpe9RObZHDHoprSMhX6gshq
	p+pEgKLQSonct5nAGKG3gnHw97PMuRJxI79QuybqL8G/aarxZXNr6rRH/+AXJNr2
	cWIxBQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafm9pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 09:08:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56A98DMa025586
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 09:08:13 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 02:08:10 -0700
From: Peter Hilber <quic_philber@quicinc.com>
To: <virtio-comment@lists.linux.dev>
CC: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
        "Jason
 Wang" <jasowang@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        "Ridoux,
 Julien" <ridouxj@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Matias
 Ezequiel Vara Larsen" <mvaralar@redhat.com>,
        "Michael S. Tsirkin"
	<mst@redhat.com>,
        Peter Hilber <quic_philber@quicinc.com>
Subject: [PATCH v10 1/4] virtio-rtc: Add initial device specification
Date: Thu, 10 Jul 2025 11:06:46 +0200
Message-ID: <20250710090648.1711-3-quic_philber@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250710090648.1711-2-quic_philber@quicinc.com>
References: <20250710090648.1711-2-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686f82fe cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=mkMtH7XpAAAA:8 a=VwQbUJbxAAAA:8
 a=bs-e4Z8cAAAA:8 a=JfrnYn6hAAAA:8 a=48vgC7mUAAAA:8 a=uZvujYp8AAAA:8
 a=B6GvL0XKAAAA:8 a=COk6AnOGAAAA:8 a=wrFruwkbETKLvwDz8pkA:9 a=xsmNKGdRZkQA:10
 a=AO8b7GKzmksA:10 a=I9Slk6e--tAXHahELIuT:22 a=YFpLQiK6rFjqGb8m0bXF:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=SLzB8X_8jTLwj6mN0q5r:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GSsJn-NUKW4Kto--cbqhbyAf267cY5ce
X-Proofpoint-GUID: GSsJn-NUKW4Kto--cbqhbyAf267cY5ce
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3NyBTYWx0ZWRfX7sQYgwepVa+z
 eMvnubDhoXOcmggDJ3aNZwFVrnmhT1fuKSAjTePJmppIh9VAOSj/nxXbhwvFZkFuFME/LgrDeXT
 9gTeTutl4RyFJCBjAq+jObf53Vfxx1i+LigDrdNgQhQCoFYK1HcEIBIm6r8oQ8fKd9/kJlVoCsD
 7L7Ef7Xbut9kLAHWt83verJYSrKTeBkr+Qb2SACmMAGajT7yc/aw8n1ZjSxfSm57M906AgGzF9z
 D3bddn/e7qUdMydPasBFzMXle80t0lPAL/uPguPDj1XqR2iqXVBJF/rFAHtla+GjrEtTTGHeK9V
 9+rMoDyNTQFYJ3ZueEai3EflhKg71f4YRbCzMJin/orUJPBJpcvEaKz8NxmSZue/KK/34BRf0uA
 N5doI8FNC2XuaWdrbP+mhguDZHDN4u4nHSvnpY8HTzu7TWU+kN4edjUZ0AKYgGpkP9iYX2eS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100077

The virtio-rtc device provides information about current time through
one or more clocks. As such, it is a Real-Time Clock (RTC) device.

The normative statements for this device follow in the next patch.

For this device, there is a Linux kernel driver patch series which is
being upstreamed, and a proprietary device implementation.

Miscellaneous
-------------

The spec does not specify how a driver should interpret clock readings,
esp. also not how to perform clock synchronization.

The device uses the former "Timer/Clock" device id which is already part
of the specification. This device id was registered a long time ago and
should be unused according to the author's information. The name "RTC"
was determined to be the best for a device which focuses on current
time.

Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
---

Notes:
    v9:
    
    - Restrict implementation-specific id ranges to experimental
      implementations (Michael S. Tsirkin).
    
    - Document that device converts hardware counter value, accounting for
      device/driver differences in offset/multiplier (Michael S. Tsirkin).
    
    - State that an error-free device sets status OK for all requests from a
      well-behaved driver (Michael S. Tsirkin).
    
    - "Mark available"/"use" buffers instead of messages (Michael S.
      Tsirkin).
    
    - Change name to "Real Time Clock" in device type list (Michael S.
      Tsirkin).
    
    - Reword multiple sentences (Matias Ezequiel Vara Larsen).
    
    - Reduce ambiguity in how statements refer to multiple enumeration items
      (Michael S. Tsirkin).
    
    - Use "None currently defined." like other devices (Michael S. Tsirkin).
    
    - Clarify that request structs contain clock ids (Michael S. Tsirkin).
    
    - Add fixes which were mistakenly placed in patch 2 in v8 (Cornelia
      Huck).
    
    - Remove statement implying that device must not check that reserved
      fields are zero.
    
    v8:
    
    - Change word order from "field X" to "the X field" (Matias Ezequiel
      Vara Larsen).
    
    - Split up sentences about implementation-specific definitions (Matias
      Ezequiel Vara Larsen).
    
    v7:
    
    - Remove leap second and performance indications from struct
      virtio_rtc_resp_read_cross. Remove backing definitions.
    
    - Add wording change which was previously mistakenly placed in last
      patch.
    
    v6:
    
    - Make leap second status information optional if the clock smears (or
      might smear) leap seconds.
    
    - Do not use union for leap second indication.
    
    - Improve wording.
    
    - Refer to the new POSIX.1-2024 for UTC epoch definition.
    
    v5:
    
    - Change structure and wording to support adding shared memory like
      vmclock [8].
    
    - Add dedicated clock types for UTC leap second smearing (David
      Woodhouse).
    
    - Extend leap second indications.
    
    - Split UTC-TAI offset and fractional offset due to smearing (David
      Woodhouse).
    
    - Remove requirement that TAI offset must not be a whole second while
      clock is being smeared.
    
    - Align bit widths, and some names, with '[RFC PATCH v4] ptp: Add
      vDSO-style vmclock support' [8].
    
    - Replace VIRTIO_RTC_SUBTYPE_ by VIRTIO_RTC_SMEAR_.
    
    - For Arm Generic Timer, only support Virtual Count Register (David
      Woodhouse).
    
    - Rename MONO clock to MONOTONIC clock.
    
    v4:
    
    - Drop distinction of Arm Generic Timer virtual and physical counter [7].
    
    - Add requirement that device should assume that driver reads clock from
      first vCPU (David Woodhouse) [6].
    
    - Formatting and wording improvements.
    
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
    [6] https://lore.kernel.org/lkml/d796d9a5-8eda-4528-a6d8-1c4eba24aa1e@opensynergy.com/
    [7] https://lore.kernel.org/all/20231218064253.9734-2-peter.hilber@opensynergy.com/
    [8] https://lore.kernel.org/lkml/20240708092924.1473461-1-dwmw2@infradead.org/

 content.tex                      |   3 +-
 device-types/rtc/description.tex | 438 +++++++++++++++++++++++++++++++
 introduction.tex                 |   6 +
 3 files changed, 446 insertions(+), 1 deletion(-)
 create mode 100644 device-types/rtc/description.tex

diff --git a/content.tex b/content.tex
index 56b2cb1..5aed40b 100644
--- a/content.tex
+++ b/content.tex
@@ -684,7 +684,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 16         &   GPU device       \\
 \hline
-17         &   Timer/Clock device \\
+17         &   RTC (Real Time Clock) device \\
 \hline
 18         &   Input device \\
 \hline
@@ -779,6 +779,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \input{device-types/can/description.tex}
 \input{device-types/spi/description.tex}
 \input{device-types/media/description.tex}
+\input{device-types/rtc/description.tex}
 
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
new file mode 100644
index 0000000..ae4b302
--- /dev/null
+++ b/device-types/rtc/description.tex
@@ -0,0 +1,438 @@
+\section{RTC Device}\label{sec:Device Types / RTC Device}
+
+The RTC (Real Time Clock) device provides information about current
+time. The device can provide different clocks, e.g.\ for the UTC or TAI
+time standards, or for physical time elapsed since some past epoch. The
+driver reads the clocks with simple or more accurate methods.
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
+None currently defined.
+
+\subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
+
+None currently defined.
+
+\subsection{Device Initialization}\label{sec:Device Types / RTC Device / Device Initialization}
+
+The device determines the set of clocks. The device provides zero or
+more clocks.
+
+\subsection{Device Operation}\label{sec:Device Types / RTC Device / Device Operation}
+
+The driver makes a request available in the requestq. The device fills
+in the response and uses the buffer. The requestq uses common request
+and response headers.
+
+\begin{lstlisting}
+/* common request header */
+struct virtio_rtc_req_head {
+        le16 msg_type;
+        u8 reserved[6];
+};
+
+/* common response header */
+struct virtio_rtc_resp_head {
+        u8 status;
+        u8 reserved[7];
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
+#define VIRTIO_RTC_S_OK         0
+#define VIRTIO_RTC_S_EOPNOTSUPP 2
+#define VIRTIO_RTC_S_ENODEV     3
+#define VIRTIO_RTC_S_EINVAL     4
+#define VIRTIO_RTC_S_EIO        5
+\end{lstlisting}
+
+VIRTIO_RTC_S_OK indicates that the device successfully executed the
+request. If a driver only makes requests according to the device
+capabilities detected by the driver, an error-free device will always
+set status VIRTIO_RTC_S_OK.
+
+If \field{status} is not VIRTIO_RTC_S_OK, the value of other response
+fields is undefined.
+
+VIRTIO_RTC_S_EOPNOTSUPP indicates that the device could not execute the
+specific request due to an implementation limitation. The device also
+returns status VIRTIO_RTC_S_EOPNOTSUPP for requests with unknown values
+in the \field{msg_type} or \field{hw_counter} fields.
+
+VIRTIO_RTC_S_ENODEV indicates that the \field{clock_id} field value
+supplied with the request does not identify a clock.
+
+VIRTIO_RTC_S_EINVAL indicates one or more of the following conditions:
+
+\begin{itemize}
+\item The driver request values are not allowed by the specification.
+\item The device read-only buffer is too small to fit the request.
+\item The device write-only buffer is too small to fit the response.
+\end{itemize}
+
+VIRTIO_RTC_S_EIO indicates that the device did not execute the request
+due to an error which was not caused by invalid input from the driver.
+
+All \field{reserved} fields are written as zero.
+
+The set of clocks does not change after feature negotiation completion,
+until device reset. The set of clocks should not change on device reset
+either (similar to negotiated features). Clock identifiers are
+zero-based, dense indices. In request structures, all fields named
+\field{clock_id} contain clock identifiers.
+
+\subsubsection{Common Definitions}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions}
+
+This section makes common definitions.
+
+\paragraph{Clock Types}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions / Clock Types}
+
+The following clock types are defined:
+
+\begin{lstlisting}
+#define VIRTIO_RTC_CLOCK_UTC                    0
+#define VIRTIO_RTC_CLOCK_TAI                    1
+#define VIRTIO_RTC_CLOCK_MONOTONIC              2
+#define VIRTIO_RTC_CLOCK_UTC_SMEARED            3
+#define VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED      4
+\end{lstlisting}
+
+\begin{description}
+
+\item[VIRTIO_RTC_CLOCK_UTC] uses the UTC (Coordinated Universal Time)
+        time standard. This clock uses the time epoch of January 1,
+        1970, 00:00 UTC. This is the same epoch as \emph{Unix time}. The
+        clock's seconds since the epoch are related to UTC time as
+        defined by \hyperref[intro:EPOCH]{EPOCH}.
+
+        This clock observes positive and negative leap seconds as
+        announced by standard bodies. At the start of leap seconds, the
+        clock steps accordingly.
+
+\item[VIRTIO_RTC_CLOCK_TAI] uses the TAI (International Atomic Time)
+        time standard. This clock uses the time epoch of January 1,
+        1970, 00:00 TAI.
+
+\item[VIRTIO_RTC_CLOCK_MONOTONIC] uses monotonic physical time (SI
+        seconds subdivisions) since some unspecified epoch. The epoch is
+        before or during device reset.
+
+\item[VIRTIO_RTC_CLOCK_UTC_SMEARED] deviates from the UTC standard by
+        smearing time in the vicinity of a leap second. This avoids
+        clock steps due to UTC leap seconds. Otherwise, this clock is
+        similar to VIRTIO_RTC_CLOCK_UTC.
+
+\item[VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED] This clock either
+
+\begin{itemize}
+\item deviates from the UTC standard by smearing time in the vicinity of
+        a leap second (similar to VIRTIO_RTC_CLOCK_UTC_SMEARED), or
+
+\item steps at the start of leap seconds like VIRTIO_RTC_CLOCK_UTC.
+\end{itemize}
+
+A clock of type VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED can change this
+behavior for every leap second.
+
+\end{description}
+
+In the following, \emph{UTC-like clock} designates any clock of type
+VIRTIO_RTC_CLOCK_UTC, VIRTIO_RTC_CLOCK_UTC_SMEARED, or
+VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED.
+
+Additional clock types may be standardized in the future.
+Implementation-specific definitions of clock types are not recommended
+and are reserved for experimental implementations.
+Implementation-specific definitions use ids between 0xF0 and 0xFF.
+
+\paragraph{Smearing Variants}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions / Smearing Variants}
+
+Leap second \emph{smearing variants} describe the deviation from the UTC
+standard in the vicinity of a leap second. The following smearing
+variants are currently defined:
+
+\begin{lstlisting}
+#define VIRTIO_RTC_SMEAR_UNSPECIFIED    0
+#define VIRTIO_RTC_SMEAR_NOON_LINEAR    1
+#define VIRTIO_RTC_SMEAR_UTC_SLS        2
+\end{lstlisting}
+
+\begin{description}
+
+        \item[VIRTIO_RTC_SMEAR_UNSPECIFIED] means that it is unspecified
+                how time is smeared in the vicinity of leap seconds.
+
+        \item[VIRTIO_RTC_SMEAR_NOON_LINEAR] specifies a linear smear
+                from noon prior to the leap second until noon after the
+                leap second.
+
+        \item[VIRTIO_RTC_SMEAR_UTC_SLS] specifies a linear smear as per
+                the \hyperref[intro:UTC-SLS]{UTC-SLS} proposal.
+
+\end{description}
+
+Clocks of type VIRTIO_RTC_CLOCK_UTC_SMEARED always behave according to a
+smearing variant. The smearing variant does not change over the clock's
+lifetime.
+
+For clocks of type VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED, it is unspecified
+whether leap seconds are smeared, and how leap seconds are smeared.
+
+Additional smearing variants may be standardized in the future.
+Implementation-specific definitions of smearing variants are not
+recommended and are reserved for experimental implementations.
+Implementation-specific definitions use ids greater than or equal to
+0xF0.
+
+In the following, \emph{leap smearing clock} designates any of the
+following clocks:
+
+\begin{itemize}
+
+\item any clock of type VIRTIO_RTC_CLOCK_UTC_SMEARED
+
+\item any clock of type VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED at any time
+        when the clock is smearing a leap second.
+
+\end{itemize}
+
+\paragraph{Hardware Counters}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions / Hardware Counters}
+
+The following hardware counter identifiers are specified:
+
+\begin{lstlisting}
+/* Arm Generic Timer Counter-timer Virtual Count Register (CNTVCT_EL0) */
+#define VIRTIO_RTC_COUNTER_ARM_VCT      0
+/* x86 Time-Stamp Counter */
+#define VIRTIO_RTC_COUNTER_X86_TSC      1
+/* Invalid */
+#define VIRTIO_RTC_COUNTER_INVALID   0xFF
+\end{lstlisting}
+
+Additional hardware counter identifiers may be standardized in the
+future. Implementation-specific hardware counter identifiers are not
+recommended and are reserved for experimental implementations.
+Implementation-specific hardware counter identifiers have values between
+0xF0 and 0xFE.
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
+        struct virtio_rtc_req_head head;
+        /* no request params */
+};
+
+struct virtio_rtc_resp_cfg {
+        struct virtio_rtc_resp_head head;
+        le16 num_clocks;
+        u8 reserved[6];
+};
+\end{lstlisting}
+
+The \field{num_clocks} field contains the number of clocks. A device
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
+        struct virtio_rtc_req_head head;
+        le16 clock_id;
+        u8 reserved[6];
+};
+
+struct virtio_rtc_resp_clock_cap {
+        struct virtio_rtc_resp_head head;
+        u8 type;
+        u8 leap_second_smearing;
+        u8 reserved[6];
+};
+\end{lstlisting}
+
+The \field{type} field identifies the clock type. A device provides
+zero or more clocks for a clock type.
+
+Clocks of type VIRTIO_RTC_CLOCK_UTC_SMEARED indicate the \emph{smearing
+variant} through the \field{leap_second_smearing} field. All other
+clocks set \field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED.
+
+\item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device supports
+cross-timestamping for a particular pair of clock and hardware counter.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_CROSS_CAP 0x1002 /* message type */
+
+struct virtio_rtc_req_cross_cap {
+        struct virtio_rtc_req_head head;
+        le16 clock_id;
+        u8 hw_counter;
+        u8 reserved[5];
+};
+
+
+struct virtio_rtc_resp_cross_cap {
+        struct virtio_rtc_resp_head head;
+#define VIRTIO_RTC_FLAG_CROSS_CAP       (1 << 0)
+        u8 flags;
+        u8 reserved[7];
+};
+\end{lstlisting}
+
+The \field{clock_id} field identifies the clock, and the
+\field{hw_counter} field identifies the hardware counter, for which
+cross-timestamp support is probed. The device sets the
+VIRTIO_RTC_FLAG_CROSS_CAP flag in the \field{flags} field if the clock
+supports cross-timestamping for the particular clock and hardware
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
+        i.e.\ clocks may run at a frequency other than their current
+        best frequency estimate.
+\end{itemize}
+
+As long as a clock does not jump backwards, the driver clock readings
+through read request responses increase monotonically:
+
+\begin{itemize}
+\item As long as a clock does not jump backwards in-between device-side
+        clock readings, the driver-side readings for that clock increase
+        monotonically as well, in the order in which the driver
+        marks read requests as available.
+
+\item The device marks buffers with read requests for the same clock as
+        used in the order in which the buffers are available.
+\end{itemize}
+
+For a clock of type VIRTIO_RTC_CLOCK_MONOTONIC, the device always
+returns monotonically increasing clock readings through read request
+responses.
+
+The unit of all \field{clock_reading} fields is 1
+nanosecond.\footnote{For time epochs in year 1970 or later, this means
+that time until at least year 2553 can be represented in the \field{le64
+clock_reading} fields.}
+
+\begin{description}
+
+\item[VIRTIO_RTC_REQ_READ] reads the clock identified by the
+\field{clock_id} field. The device supports this request for every
+clock.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_READ 0x0001 /* message type */
+
+struct virtio_rtc_req_read {
+        struct virtio_rtc_req_head head;
+        le16 clock_id;
+        u8 reserved[6];
+};
+
+struct virtio_rtc_resp_read {
+        struct virtio_rtc_resp_head head;
+        le64 clock_reading;
+};
+\end{lstlisting}
+
+\field{clock_reading} is a device-side clock reading obtained after the
+buffer was marked as available.
+
+\item[VIRTIO_RTC_REQ_READ_CROSS] returns a cross-timestamp for the clock
+identified by the \field{clock_id} field.\footnote{Cross-timestamping
+is similar to the ptp_kvm mechanism in the Linux kernel.} This request
+may yield better performance than using VIRTIO_RTC_REQ_READ.
+
+The driver can determine whether the device supports
+VIRTIO_RTC_REQ_READ_CROSS for a specific clock and \field{hw_counter}
+through VIRTIO_RTC_REQ_CROSS_CAP.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_READ_CROSS 0x0002 /* message type */
+
+struct virtio_rtc_req_read_cross {
+        struct virtio_rtc_req_head head;
+        le16 clock_id;
+        u8 hw_counter;
+        u8 reserved[5];
+};
+
+struct virtio_rtc_resp_read_cross {
+        struct virtio_rtc_resp_head head;
+        le64 clock_reading;
+        le64 counter_cycles;
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
+from the hardware counter identified by \field{hw_counter}.
+
+To determine the \field{counter_cycles} value, the device converts the
+hardware counter value the device has read, accounting for any
+differences in counter offsets or counter multipliers between device and
+driver at the time of the reading.
+
+In case hardware counter reads differ among CPUs used by the driver, the
+device should assume that the driver reads the hardware counter from the
+CPU which the driver enumerates as the first.
+
+The hardware counter identifiers are defined in
+\ref{sec:Device Types / RTC Device / Device Operation / Common Definitions / Hardware Counters}.
+
+\end{description}
diff --git a/introduction.tex b/introduction.tex
index 80aa67a..9a9cbde 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -180,6 +180,12 @@ \section{Normative References}\label{sec:Normative References}
     Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words", BCP
     14, RFC 8174, DOI 10.17487/RFC8174, May 2017
         \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
+	\phantomsection\label{intro:EPOCH}\textbf{[EPOCH]} &
+    POSIX.1-2024, Base Definitions, Seconds Since the Epoch
+	\newline\url{https://pubs.opengroup.org/onlinepubs/9799919799/basedefs/V1_chap04.html#tag_04_19}\\
+	\phantomsection\label{intro:UTC-SLS}\textbf{[UTC-SLS]} &
+    UTC with Smoothed Leap Seconds (UTC-SLS)
+	\newline\url{https://www.cl.cam.ac.uk/~mgk25/time/utc-sls/}\\
 \end{longtable}
 
 \section{Non-Normative References}
-- 
2.43.0

