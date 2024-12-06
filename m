Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599A01DF96F
	for <virtio-comment@lists.linux.dev>; Fri,  6 Dec 2024 09:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478530; cv=none; b=l5U9f96RkHqAQl1yaNyNcoA9HsIcRSoPlwrNKpIfsixRdzMbFMNRnr5eZTCJT9r/tPnaboxZ/wCcM+Qya8+ztIN4YNSCjLOxE1woeqHf5k9XE2TpYVKj8zUcF3BiL8EyURVKLgOdSXpps7WMEBP8NpKulDSY4otRPPZ+8+Au7s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478530; c=relaxed/simple;
	bh=arOxJTVmGKW6fuH8hSMjZs+p7v/lBIENGL8+qb+kQW8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pAUbodBHHqnFwGXTuJnpBRkwGtRY/MR+OT3e5HViLPOcQkTxnamUjdZs61U/sNCL977ZCN++DRui3eAuej0Y2IHprpqIZF4LqPtFW8qAa7zhifB9/9VllPMfgaGKnKH/SSggkrg2nbmW9c1D7RQZfA2FU4zeYe1HtMg0iNZcW3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YqTA1Wfd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YqTA1Wfd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B67lkGG005269;
	Fri, 6 Dec 2024 09:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BI+slrsx2/nGhO9rqYCyusYKlWpnUuJ2LjES9nZ8Aoc=; b=YqTA1Wfd4TJ8thWi
	TupJ+MD+BIueP8eMZBapO+ejb4C2kTIGctcsAVLa+9xAZkLhsNpEpN7van76TZhe
	H65vtzkEPiZ7qKEhYwXEkaE19oJtIAmdYOk6IhOitnyXhCs5YbDLx9gBAbUToTj7
	kCB6g3qVuLcOs1UtTuen7GU86rSt7TM6pDioDj9lp26sSdteE3bmPNlsAgQy1+DM
	73vtWTT2lfNtT2sobIzh28tEvo6Urt+BtolywSxaKHBAsIElj+KsxF8d8ctFIHeI
	g0uGel/66h8Jx3CsrhZXuQoET1w0GCAFHoeRVC1Cxu10GX5hgq/S+3z2aN1/k4ag
	9Et4rg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbqm34us-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 09:48:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B69mgWD032267
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 09:48:42 GMT
Received: from PHILBER.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 01:48:39 -0800
From: Peter Hilber <quic_philber@quicinc.com>
To: <virtio-comment@lists.linux.dev>
CC: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
        "Jason
 Wang" <jasowang@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        "Ridoux,
 Julien" <ridouxj@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Srivatsa
 Vaddagiri" <quic_svaddagi@quicinc.com>,
        Peter Hilber
	<quic_philber@quicinc.com>
Subject: [RFC PATCH v6 1/4] virtio-rtc: Add initial device specification
Date: Fri, 6 Dec 2024 10:48:16 +0100
Message-ID: <20241206094819.858-2-quic_philber@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206094819.858-1-quic_philber@quicinc.com>
References: <20241206094819.858-1-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jKmMncg52Cjq5OdYf2yVNgXXarY0sgBw
X-Proofpoint-ORIG-GUID: jKmMncg52Cjq5OdYf2yVNgXXarY0sgBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060071

The virtio-rtc device provides information about current time through
one or more clocks. As such, it is a Real-Time Clock (RTC) device.

The normative statements for this device follow in the next patch.

For this device, there is an RFC Linux kernel driver which is being
upstreamed, and a proprietary device implementation.

Miscellaneous
-------------

The spec does not specify how a driver should interpret clock readings,
esp. also not how to perform clock synchronization.

The device uses the "Timer/Clock" device id which is already part of the
specification. This device id was registered a long time ago and should
be unused according to the author's information. The name "RTC" was
determined to be the best for a device which focuses on current time.

TBD
---

- The VIRTIO_RTC_STATUS_UNRELIABLE definition is vague.

- The minimum leap second pre-/post-announce time is not defined.

Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
---

Notes:
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
 device-types/rtc/description.tex | 726 +++++++++++++++++++++++++++++++
 introduction.tex                 |   6 +
 3 files changed, 734 insertions(+), 1 deletion(-)
 create mode 100644 device-types/rtc/description.tex

diff --git a/content.tex b/content.tex
index 67b1bf3c35ab..b1d93a8aebb4 100644
--- a/content.tex
+++ b/content.tex
@@ -684,7 +684,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 16         &   GPU device       \\
 \hline
-17         &   Timer/Clock device \\
+17         &   RTC (Timer/Clock) device \\
 \hline
 18         &   Input device \\
 \hline
@@ -776,6 +776,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \input{device-types/pmem/description.tex}
 \input{device-types/can/description.tex}
 \input{device-types/spi/description.tex}
+\input{device-types/rtc/description.tex}
 
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
new file mode 100644
index 000000000000..dd9ebe0c81c6
--- /dev/null
+++ b/device-types/rtc/description.tex
@@ -0,0 +1,726 @@
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
+        part of the message, is too small.
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
+        clock steps accordingly. This clock announces leap seconds.
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
+        clock steps due to UTC leap seconds. This clock optionally
+        announces the smearing of leap seconds. Otherwise, this clock is
+        similar to VIRTIO_RTC_CLOCK_UTC.
+
+\item[VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED] This clock
+
+\begin{itemize}
+\item may deviate from the UTC standard by smearing time in the vicinity
+        of a leap second (similar to VIRTIO_RTC_CLOCK_UTC_SMEARED), or
+
+\item may step at the start of leap seconds like VIRTIO_RTC_CLOCK_UTC.
+\end{itemize}
+
+A clock of type VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED can change this
+behavior for every leap second. This clock does not necessarily announce
+leap seconds.
+
+\end{description}
+
+In the following, \emph{UTC-like clock} designates any clock of type
+VIRTIO_RTC_CLOCK_UTC, VIRTIO_RTC_CLOCK_UTC_SMEARED, or
+VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED.
+
+Additional clock types may be standardized in the future.
+Implementation-specific definitions of clock types are not recommended
+and use ids between 0xF0 and 0xFF.
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
+recommended and use ids greater than or equal to 0xF0.
+
+\paragraph{Leap Second Indication}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions / Leap Second Indication}
+
+A clock can indicate leap seconds as follows.
+
+If a clock steps according to leap seconds, the clock can indicate
+
+\begin{itemize}
+
+        \item that a (positive or negative) leap second will be
+                introduced at the end of the month,
+
+        \item that a leap second is currently in progress, and
+
+        \item that a leap second happened in the recent past.
+
+\end{itemize}
+
+A clock which smears leap seconds on occurrence can indicate
+
+\begin{itemize}
+
+        \item that a leap second smear will start around the next turn
+                of the month,
+
+        \item that the leap second is currently being smeared into the
+                clock, and
+
+        \item that a leap second smearing occurred recently.
+
+\end{itemize}
+
+The following leap second indications are defined:
+
+\begin{lstlisting}
+#define VIRTIO_RTC_LEAP_NONE            0x00
+#define VIRTIO_RTC_LEAP_PRE_POS         0x01
+#define VIRTIO_RTC_LEAP_PRE_NEG         0x02
+#define VIRTIO_RTC_LEAP_POS             0x03
+#define VIRTIO_RTC_LEAP_POST_POS        0x04
+#define VIRTIO_RTC_LEAP_POST_NEG        0x05
+#define VIRTIO_RTC_LEAP_SMEAR_PRE_POS   0x16
+#define VIRTIO_RTC_LEAP_SMEAR_PRE_NEG   0x17
+#define VIRTIO_RTC_LEAP_SMEAR_POS       0x38
+#define VIRTIO_RTC_LEAP_SMEAR_NEG       0x39
+#define VIRTIO_RTC_LEAP_SMEAR_POST_POS  0x1A
+#define VIRTIO_RTC_LEAP_SMEAR_POST_NEG  0x1B
+\end{lstlisting}
+
+For convenience, some of the above leap second indications have the
+following flags set as part of the indication's encoding:
+
+\begin{lstlisting}
+#define VIRTIO_RTC_LEAP_SMEAR_NEAR      0x10
+#define VIRTIO_RTC_LEAP_SMEAR_NOW       0x20
+\end{lstlisting}
+
+VIRTIO_RTC_LEAP_NONE indicates that no leap second is in the nearby
+future, present, or past.
+
+VIRTIO_RTC_LEAP_PRE_POS resp.\ VIRTIO_RTC_LEAP_PRE_NEG pre-announce a
+positive resp.\ negative leap second upon which the clock will step.
+
+VIRTIO_RTC_LEAP_PRE_SMEAR_POS resp.\ VIRTIO_RTC_LEAP_PRE_SMEAR_NEG
+pre-announce a positive resp.\ negative leap second, and pre-announce
+that the clock will smear the time in the vicinity of the leap second
+(rather than step).
+
+Pre-announcing starts at the earliest at the 17th day of the month
+including the leap second.
+
+VIRTIO_RTC_LEAP_POS indicates that a positive leap second is currently
+in progress, after the clock stepped backwards.
+
+VIRTIO_RTC_LEAP_SMEAR_POS resp.\ VIRTIO_RTC_LEAP_SMEAR_NEG indicate that
+the clock is currently slowed down resp.\ sped up in order to smear a
+leap second into the clock. This does not indicate whether the leap
+second itself is in the future, present, or past.
+
+VIRTIO_RTC_LEAP_POST_POS resp.\ VIRTIO_RTC_LEAP_POST_NEG indicate that a
+positive resp.\ negative leap second occurred in the recent past, during
+which the clock stepped. The leap second itself has already passed.
+These indications stop before the 16th day of the month after the leap
+second.
+
+VIRTIO_RTC_LEAP_SMEAR_POST_POS resp.\ VIRTIO_RTC_LEAP_SMEAR_POST_NEG
+indicate that the clock was recently slowed down resp.\ sped up in order
+to smear the leap second into the clock. The leap second itself has
+already passed, and the clock is no longer being smeared. These
+indications stop before the 16th day of the month after the leap second.
+
+If a leap second indication has flag VIRTIO_RTC_LEAP_SMEAR_NEAR set,
+this means that there is a leap second in the near future, at present,
+or in the near past, and that this leap second will be, is being, or was
+smeared.
+
+If a leap second indication has flag VIRTIO_RTC_LEAP_SMEAR_NOW set, this
+means that there is a leap second in the near future, at present, or in
+the near past, and that this leap second is currently being smeared.
+
+Clocks of types VIRTIO_RTC_CLOCK_UTC_SMEARED and
+VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED indicate the leap second state only
+if the device sets a respective flag.
+
+In the following, \emph{leap smearing clock} designates
+
+\begin{itemize}
+
+\item any clock of type VIRTIO_RTC_CLOCK_UTC_SMEARED
+
+\item any clock of type VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED at any time
+        when the clock leap second indication has bit
+        VIRTIO_RTC_LEAP_SMEAR_NEAR set.
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
+/* Reserved */
+#define VIRTIO_RTC_COUNTER_INVALID   0xFF
+\end{lstlisting}
+
+Additional hardware counter identifiers may be standardized in the
+future. Implementation-specific hardware counter identifiers are not
+recommended and have values between 0xF0 and 0xFE.
+
+\paragraph{Clock Status}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions / Clock Status}
+
+A clock is in one of the following states:
+
+\begin{lstlisting}
+#define VIRTIO_RTC_STATUS_UNKNOWN       0
+#define VIRTIO_RTC_STATUS_INITIALIZING  1
+#define VIRTIO_RTC_STATUS_SYNCHRONIZED  2
+#define VIRTIO_RTC_STATUS_FREERUNNING   3
+#define VIRTIO_RTC_STATUS_UNRELIABLE    4
+\end{lstlisting}
+
+These describe the state of the clock as follows:
+
+\begin{description}
+
+\item[VIRTIO_RTC_STATUS_UNKNOWN] The status of the clock is unknown.
+\item[VIRTIO_RTC_STATUS_INITIALIZING] The clock is initializing.
+\item[VIRTIO_RTC_STATUS_SYNCHRONIZED] The clock is synchronized as per
+        the clock requirements.
+\item[VIRTIO_RTC_STATUS_FREERUNNING] The clock is not synchronized.
+\item[VIRTIO_RTC_STATUS_UNRELIABLE] The current clock readings are
+        unreliable.
+
+\end{description}
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
+        struct virtio_rtc_req_head head;
+        le16 clock_id;
+        u8 reserved[6];
+};
+
+struct virtio_rtc_resp_clock_cap {
+        struct virtio_rtc_resp_head head;
+        u8 type;
+        u8 leap_second_smearing;
+        u8 flags;
+        u8 reserved[5];
+};
+\end{lstlisting}
+
+The \field{type} field identifies the clock type. A device provides
+zero or more clocks for a clock type.
+
+Clocks of type VIRTIO_RTC_CLOCK_UTC_SMEARED indicate the \emph{smearing
+variant} through field \field{leap_second_smearing}. All other clocks
+set \field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED.
+
+The \field{flags} field provides the following information:
+
+\begin{lstlisting}
+#define VIRTIO_RTC_FLAG_LEAP_CAP                (1 << 0)
+#define VIRTIO_RTC_FLAG_TAI_OFFSET_CAP          (1 << 1)
+#define VIRTIO_RTC_FLAG_SMEAR_OFFSET_CAP        (1 << 2)
+\end{lstlisting}
+
+A UTC-like clock indicates the capability to always provide leap second
+related information:
+
+\begin{itemize}
+
+\item Flag VIRTIO_RTC_FLAG_LEAP_CAP indicates that the clock will
+        indicate all leap seconds.
+
+\item Flag VIRTIO_RTC_FLAG_TAI_OFFSET_CAP indicates that the clock will
+        always indicate the offset of the UTC standard to TAI.
+
+\item Flag VIRTIO_RTC_FLAG_SMEAR_OFFSET_CAP indicates that the clock
+        will always indicate the offset of the clock from the UTC
+        standard when the clock is smearing time in the vicinity of a
+        leap second.
+
+\end{itemize}
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
+cross-timestamp support is probed. The device sets flag
+VIRTIO_RTC_FLAG_CROSS_CAP in the \field{flags} field if the clock
+supports cross-timestamping for the particular clock and hardware
+counter, and clears the flag otherwise.
+
+\end{description}
+
+\subsubsection{Data Structures}
+
+This section describes data structures.
+
+\paragraph{Leap Second Information}\label{sec:Device Types / RTC Device / Device Operation / Data Structures / Leap Second Information}
+
+The device can report information about impending and ongoing UTC leap
+seconds, and about the current UTC offset from TAI, through
+\field{struct virtio_rtc_leap_info}. The device can report this
+information for any UTC-like clock. For all other clock types, the
+device sets all fields of \field{struct virtio_rtc_leap_info} to zero.
+
+The device only provides leap second information if the device indicates
+this through the respective flags. The information applies to the clock
+reading to which the struct is associated to.
+
+\begin{lstlisting}
+struct virtio_rtc_leap_info {
+        le32 smear_offset_nsec;
+        le16 tai_offset_sec;
+        u8 leap;
+#define VIRTIO_RTC_FLAG_LEAP_VALID              (1 << 0)
+#define VIRTIO_RTC_FLAG_TAI_OFFSET_VALID        (1 << 1)
+#define VIRTIO_RTC_FLAG_SMEAR_OFFSET_VALID      (1 << 2)
+        u8 flags;
+};
+\end{lstlisting}
+
+Field \field{flags} can indicate the following:
+
+\begin{description}
+
+\item[VIRTIO_RTC_FLAG_LEAP_VALID] indicates whether the
+        \field{leap} field is valid. The device always sets this flag
+        for type VIRTIO_RTC_CLOCK_UTC. The device can set this flag for
+        types VIRTIO_RTC_CLOCK_UTC_SMEARED and
+        VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED. If this flag is cleared, the
+        device sets \field{leap} to VIRTIO_RTC_LEAP_NONE.
+
+\item[VIRTIO_RTC_FLAG_TAI_OFFSET_VALID] indicates that field
+        \field{tai_offset_sec} is valid. The device always sets this
+        flag for type VIRTIO_RTC_CLOCK_UTC. The device can set
+        this flag for types VIRTIO_RTC_CLOCK_UTC_SMEARED and
+        VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED. If this flag is cleared,
+        the device sets \field{tai_offset_sec} to 0.
+
+\item[VIRTIO_RTC_FLAG_SMEAR_OFFSET_VALID] indicates that field
+        \field{smear_offset_nsec} is valid. The device can set this flag
+        for types VIRTIO_RTC_CLOCK_UTC_SMEARED and
+        VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED. If this flag is cleared, the
+        device sets \field{smear_offset_nsec} to 0.
+
+\end{description}
+
+The \field{leap} field indicates leap seconds according to
+\ref{sec:Device Types / RTC Device / Device Operation / Common Definitions / Leap Second Indication}.
+
+The \field{tai_offset_sec} field indicates the current offset of the UTC
+standard from the TAI standard, in the form $\mbox{tai_offset_sec} =
+\mbox{TAI} - \mbox{UTC}$. The offset unit is seconds.
+
+The \field{tai_offset_sec} field is interpreted as a signed integer in
+little-endian, two's complement, representation.
+
+The \field{smear_offset_nsec} field indicates the current offset of
+the clock from the UTC standard, in the form
+$\mbox{smear_offset_nsec} = \mbox{UTC} - \mbox{clock}$. The
+\field{smear_offset_nsec} field can only be non-zero while a clock is
+smearing time in the vicinity of a leap second. The offset unit is
+nanoseconds.
+
+The \field{smear_offset_nsec} field is interpreted as a signed
+integer in little-endian, two's complement, representation.
+
+\paragraph{Clock Performance Information}\label{sec:Device Types / RTC Device / Device Operation / Data Structures / Clock Performance Information}
+
+The \emph{clock performance} describes the difference between clock
+readings obtained by the driver from the device, and clock readings
+obtained from an ideal clock. Through \field{struct virtio_rtc_perf},
+the device reports the clock performance. \field{struct virtio_rtc_perf}
+describes the performance of a particular clock reading obtained by the
+driver.
+
+\begin{lstlisting}
+struct virtio_rtc_perf {
+        le64 freq_esterror;
+        le64 freq_maxerror;
+        le64 time_esterror;
+        le64 time_maxerror;
+#define VIRTIO_RTC_FLAG_FREQ_ESTERROR_VALID     (1 << 3)
+#define VIRTIO_RTC_FLAG_FREQ_MAXERROR_VALID     (1 << 4)
+#define VIRTIO_RTC_FLAG_TIME_ESTERROR_VALID     (1 << 5)
+#define VIRTIO_RTC_FLAG_TIME_MAXERROR_VALID     (1 << 6)
+        u8 flags;
+        u8 clock_status;
+        u8 reserved[6];
+};
+\end{lstlisting}
+
+Field \field{clock_status} describes the current status of the clock
+according to
+\ref{sec:Device Types / RTC Device / Device Operation / Common Definitions / Clock Status}.
+
+Other fields indicate the accuracy of the clock. Flags indicate whether
+the accuracy information is valid.
+
+The clock \emph{frequency error} is the (absolute) drift rate of the
+clock w.r.t.\ the clock definition. Field \field{freq_maxerror} is an
+upper bound to the frequency error of the clock. Field
+\field{freq_esterror} is the device's point estimate of the frequency
+error.
+
+The unit of the \field{freq_maxerror} and \field{freq_esterror} fields
+is ppm (parts per million) with a 44-bit fractional part (a field value
+of 1 corresponds to $2^{-44}$ ppm).
+
+The device sets the flag VIRTIO_RTC_FLAG_FREQ_MAXERROR_VALID resp.\
+VIRTIO_RTC_FLAG_FREQ_ESTERROR_VALID to indicate that the value of the
+\field{freq_maxerror} resp.\ \field{freq_esterror} field is valid.
+
+The clock \emph{time error} is the absolute value of the offset of the
+clock to an ideal clock according to the clock definition. Field
+\field{time_maxerror} is an upper bound to the absolute offset of the
+clock from the clock definition. Field \field{time_esterror} is the
+device's point estimate of that absolute offset.
+
+The unit of the \field{time_maxerror} and \field{time_esterror}
+fields is 1 nanosecond.
+
+The device sets the flag VIRTIO_RTC_FLAG_TIME_MAXERROR_VALID resp.\
+VIRTIO_RTC_FLAG_TIME_ESTERROR_VALID to indicate that the value of the
+\field{time_maxerror} resp.\ \field{time_esterror} field is valid.
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
+\item The device marks read requests for the same clock as used in
+        the order in which the messages were marked as available.
+\end{itemize}
+
+For a clock of type VIRTIO_RTC_CLOCK_MONOTONIC, the device always returns
+monotonically increasing clock readings through read request responses.
+
+The unit of all \field{clock_reading} fields is 1
+nanosecond.\footnote{For time epochs in year 1970 or later, this means
+that time until at least year 2553 can be represented in the \field{le64
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
+message was marked as available.
+
+\item[VIRTIO_RTC_REQ_READ_CROSS] returns a cross-timestamp for the clock
+identified by the \field{clock_id} field.\footnote{Cross-timestamping
+is similar to the ptp_kvm mechanism in the Linux kernel.} This message
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
+        struct virtio_rtc_leap_info leap_info;
+        struct virtio_rtc_perf perf;
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
+the scope of this specification. In case hardware counter reads differ
+among CPUs used by the driver, the device should assume that the driver
+reads the hardware counter from the CPU which the driver enumerates as
+the first.
+
+The hardware counter identifiers are defined in
+\ref{sec:Device Types / RTC Device / Device Operation / Common Definitions / Hardware Counters}.
+
+The field \field{leap_info} provides information as per
+\ref{sec:Device Types / RTC Device / Device Operation / Data Structures / Leap Second Information}.
+
+The field \field{perf} provides clock performance information as per
+\ref{sec:Device Types / RTC Device / Device Operation / Data Structures / Clock Performance Information}.
+
+\end{description}
diff --git a/introduction.tex b/introduction.tex
index e60298a4d78b..34f9485bc393 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -168,6 +168,12 @@ \section{Normative References}\label{sec:Normative References}
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

