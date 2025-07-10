Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DB71F4E4F
	for <virtio-comment@lists.linux.dev>; Thu, 10 Jul 2025 09:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752138505; cv=none; b=pVNZAvi8lQUn2oGWWeB1rucVuXz4AV3LgsClB8EIy2F6ZTyjwJCr0K6wG326pmJhjxT/6HLlDeKGaosO+NC9owt4QqJJXyrl1aSE5Bs6yN2EuFl5+B6jRf86aPFJ2fvw+25gsMHTEsav/Xf+XSNJcazxbzXhpEAYdLSAYLsMyWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752138505; c=relaxed/simple;
	bh=GfuHoQxR3RJBT6dzym6FWIZHr/8a2FpvO8yL/RetaPc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KEWwFVTarT04jT/5OsXyWn3WBSUYsxpjPbJI/qhCPGqUuvAmM0uzdMYElh8w2s2xD30Pg/93GLfKfbVyv4y4c0XzTwxLK/zp3pz2RC0nhq2kzghxZ7xIRNfIrALST4ZBqv5hlSUrXo8ExHXLFZidX8y8htqSzjDNBWNnMqCDzC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Jm37BS5y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Jm37BS5y"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A1g8Jd031777;
	Thu, 10 Jul 2025 09:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OWErFtxXarmRBKuFtHccIR/7K1Vkk+iwpHmKqJLkLcU=; b=Jm37BS5ydeR4wlJb
	FhbuFTiLWjAnBGgqvXAiD/Tk+kNifsgZrzdk6Oevtq+DoqiH9ctGfg3hQ/OJFstf
	rwGhUO6UVUsIYK5xNejS6vyAWz/jj8WyfTp+PEPTX2+PNp8OaXFC1LThkahp6lBR
	CJl7ZHcdI1+Yl3dVe6y1zqFwedqteACP/IaL0OheqjUQICRgVKM93QqXid4gAXMO
	DSUs1F7mMdeuBq0y7h/NaeISgZHRldOaxn447srxvQ0q7e7Yql1j8VWUveEjH7zx
	F5TKUk+Y87hWtOCTE5T/gkeiI+j4G4/R72ftH+TSAQzs8ejxLzeV3e5ZlkvV95dc
	LQ780Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qxxsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 09:08:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56A98J4h028173
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 09:08:19 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 02:08:16 -0700
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
Subject: [PATCH v10 3/4] virtio-rtc: Add alarm feature
Date: Thu, 10 Jul 2025 11:06:48 +0200
Message-ID: <20250710090648.1711-5-quic_philber@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3NyBTYWx0ZWRfX7mGBVhivaZGe
 bYb73LiRwR+fOeqB6pSFts9PhjD32xQK/+03NzmWoLYyRq14oqRkxzQUdfL7p9+uiTHOWsAfxc3
 xOwvzAWhlY4GaP/CWXZp8KWbH1S/UiWMzc9HYXs535zi3i4Re5eA2X+mwuveektWCBfotKOp9LN
 x63QPp4PjpxEapkt4BgnsRbKeVhs9VSTh7JYtlgsEJPgAyaaZJvAP7WOEPGxLID1bmiJbxsIVOI
 HyhYDoASHUmBilLa2rDvNaaBS87NyMMbzTpvMSHLq6/cXTwFOCwfMU5/HlotY5SCdChBYwbpkWS
 CIZ0csDOCv5Siguxs8OfFugawYu+Jtf/mXqrrBkdWGTrbyLVm9ivYgl9pexjV27L9f0VYbPQKuZ
 svk+5goeFJ5Jd6iEy2xcAws8Chx29Dzjvi2qYEcHCiRpK8pyyjj/G7EXALEAtDUjl5kkb+yL
X-Proofpoint-GUID: vI421rXnB-ZuAOPMZsDBAeZQkiD1guuU
X-Proofpoint-ORIG-GUID: vI421rXnB-ZuAOPMZsDBAeZQkiD1guuU
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686f8304 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=bs-e4Z8cAAAA:8
 a=COk6AnOGAAAA:8 a=8vV7Ix6zB6JNe_Bv5PAA:9 a=YFpLQiK6rFjqGb8m0bXF:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100077

Add the VIRTIO_RTC_F_ALARM feature (without normative statements).

The intended use case is: A driver needs to react when an alarm time has
been reached, but at alarm time, the driver may be in a sleep state or
powered off. The alarm feature can resume and notify the driver in this
case. Alarms may be retained across device resets.

Peculiarities
-------------

Unlike usual alarm clocks, a virtio-rtc alarm-capable clock may step
autonomously at any time: An alarm may change back from "expired" to
"not expired" before the driver has started processing an alarm
notification.

To address the above, and the device resets, define "alarm expiration"
in such a way that the driver always has a chance to react to an alarm,
and make the device always responsible for notifying the driver about an
alarm expiration.

The VIRTIO_RTC_REQ_SET_ALARM_ENABLED request is there so that the Linux
ioctls RTC_AIE_ON and RTC_AIE_OFF only need to emit one request.

Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
---

Notes:
    v9:
    
    - Allow more implementation-specific behavior when alarm actions become
      obsolete (Matias Ezequiel Vara Larsen).
    
    - Reword multiple sentences (Matias Ezequiel Vara Larsen).
    
    - Change "feature was negotiated" to "feature has been negotiated"
      (Matias Ezequiel Vara Larsen).
    
    - "Mark available"/"use" buffers instead of messages (Michael S.
      Tsirkin).
    
    - Clarify that notification structs also contain clock ids (Michael S.
      Tsirkin).
    
    - Reduce ambiguity in how a statement refers to multiple enumeration
      items (Michael S. Tsirkin).
    
    v8:
    
    - Explicitly describe alarm enabled status, where relevant (Matias
      Ezequiel Vara Larsen).
    
    - Change word order from "field X" to "the X field" (Matias Ezequiel
      Vara Larsen).
    
    - Change word order from "flag X" to "the X flag" or "X".
    
    - Change "once" to "when" (Matias Ezequiel Vara Larsen).
    
    v7:
    
    - Change flag numeric value due to removing leap second indication.
    
    v5:
    
    - Reformat.
    
    v4:
    
    - Change requirements so that driver can reset alarm to clean slate, and
      document how driver can achieve this (Cornelia Hell, Jason Wang) [1].
    
    - Require device to support all expressible alarm times.
    
    - Formatting and wording improvements.
    
    [1] https://lore.kernel.org/all/2ae67401-a8f5-4686-9321-cb3105df594d@opensynergy.com/

 device-types/rtc/description.tex | 265 ++++++++++++++++++++++++++++++-
 1 file changed, 261 insertions(+), 4 deletions(-)

diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
index 3339bec..5a70c42 100644
--- a/device-types/rtc/description.tex
+++ b/device-types/rtc/description.tex
@@ -4,6 +4,7 @@ \section{RTC Device}\label{sec:Device Types / RTC Device}
 time. The device can provide different clocks, e.g.\ for the UTC or TAI
 time standards, or for physical time elapsed since some past epoch. The
 driver reads the clocks with simple or more accurate methods.
+Optionally, the driver can set an alarm.
 
 \subsection{Device ID}\label{sec:Device Types / RTC Device / Device ID}
 
@@ -13,13 +14,23 @@ \subsection{Virtqueues}\label{sec:Device Types / RTC Device / Virtqueues}
 
 \begin{description}
 \item[0] requestq
+\item[1] alarmq
 \end{description}
 
 The driver enqueues requests to the requestq.
 
+Through the alarmq, the device notifies the driver about alarm
+expirations. The alarmq exists only if VIRTIO_RTC_F_ALARM has been
+negotiated.
+
 \subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature bits}
 
-None currently defined.
+\begin{description}
+\item[VIRTIO_RTC_F_ALARM (0)] Device supports alarm.
+\end{description}
+
+VIRTIO_RTC_F_ALARM determines whether the device supports setting an
+alarm for some of the clocks.
 
 \subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
 
@@ -96,8 +107,8 @@ \subsection{Device Operation}\label{sec:Device Types / RTC Device / Device Opera
 The set of clocks does not change after feature negotiation completion,
 until device reset. The set of clocks should not change on device reset
 either (similar to negotiated features). Clock identifiers are
-zero-based, dense indices. In request structures, all fields named
-\field{clock_id} contain clock identifiers.
+zero-based, dense indices. In request structures and notification
+structures, all fields named \field{clock_id} contain clock identifiers.
 
 \drivernormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
 
@@ -382,7 +393,8 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
         struct virtio_rtc_resp_head head;
         u8 type;
         u8 leap_second_smearing;
-        u8 reserved[6];
+        u8 flags;
+        u8 reserved[5];
 };
 \end{lstlisting}
 
@@ -393,6 +405,15 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
 variant} through the \field{leap_second_smearing} field. All other
 clocks set \field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED.
 
+The \field{flags} field provides the following information:
+
+\begin{lstlisting}
+#define VIRTIO_RTC_FLAG_ALARM_CAP               (1 << 0)
+\end{lstlisting}
+
+If VIRTIO_RTC_F_ALARM has been negotiated, the VIRTIO_RTC_FLAG_ALARM_CAP
+flag indicates that the clock supports an alarm.
+
 \item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device supports
 cross-timestamping for a particular pair of clock and hardware counter.
 
@@ -705,3 +726,239 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
 For VIRTIO_RTC_REQ_READ_CROSS and for any clock type listed in this
 specification, the device MUST use the nanosecond as unit for the
 \field{clock_reading} field.
+
+\subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Operation / Alarm Operation}
+
+Through the optional alarm feature, the driver can set an alarm time. On
+alarm expiration, the device notifies the driver. On alarm expiration,
+the device may also wake up the driver, while the driver is in a sleep
+state, or while the driver is powered off. How this is done is beyond
+the scope of the specification. The driver can set one alarm time per
+clock, if the clock supports this.
+
+The device may retain alarm times across device resets.\footnote{Drivers
+        may reset the device on boot or on resume from sleep state. It
+        can make sense for the device to retain the alarm time then,
+        similar to other alarm clocks.}
+
+If VIRTIO_RTC_F_ALARM has been negotiated, the device supports the alarm
+feature and the associated alarmq for notifications from the device. In
+addition, if the driver previously set an alarm time, even if the device
+
+\begin{itemize}
+\item no longer is live and/or
+\item no longer has negotiated VIRTIO_RTC_F_ALARM,
+\end{itemize}
+
+the device may still execute implementation-specific actions on alarm
+expiration.
+
+An alarm expires in any of the following cases:
+
+\begin{itemize}
+\item When the associated clock progresses (also: steps) from a time
+        prior to the alarm time to the alarm time, or to a time after
+        the alarm time, while the alarm is enabled,
+
+\item when the driver sets an alarm time which is not in the future,
+        while also setting the alarm to enabled,
+
+\item when the driver sets the alarm to enabled, and the alarm time is
+        not in the future,
+
+\item when the device is reset, if the alarm time is retained and not in
+        the future, and if the alarm is enabled.\footnote{The device is
+                always responsible for detecting alarm expiration
+                events. This avoids that the driver needs to reason
+                about when it shall poll for alarm expiration.}
+\end{itemize}
+
+When an alarm expires, the driver can disable it. Otherwise, the alarm
+expires each time when one of the above expiration events occurs, even
+if it occurred before.\footnote{This avoids that the driver may
+        miss an alarm when the clock steps backwards after alarm
+        expiration, but before the driver has resumed operation. This
+        also facilitates distinct drivers using the same device,
+        e.g.\ a driver in the bootloader, and a driver in the OS.}
+
+On alarm expiration, the device executes the alarm actions. The alarm
+actions are:
+
+\begin{itemize}
+\item The device notifies the driver through the alarmq. If the device
+        is not live, or no buffers are available in the alarmq, the
+        device will notify once the device is live and buffers are
+        available.
+
+\item Optionally, the device executes other, implementation-specific,
+        actions. The device may execute those immediately, regardless of
+        the device state.
+\end{itemize}
+
+An alarm \emph{expiration} becomes obsolete on any of the following
+events:
+
+\begin{itemize}
+\item The driver disables the alarm.
+
+\item The driver sets an alarm time.
+
+\item The clock jumps backwards, before the alarm time.
+
+\item Another alarm expiration event happens.
+\end{itemize}
+
+If an alarm expiration becomes obsolete, it is unspecified which alarm
+actions the device executes for this alarm expiration. When the driver
+disables an alarm, the device stops any alarm action for this alarm
+before using the buffer.
+
+The device supports all alarm time values which the driver can request
+through alarm control requests. Initially, the alarm time is 0, and the
+alarm is disabled.
+
+Alarms set prior to reset may cause unwanted alarm expiration
+notifications, and information leakage, after the reset. To prevent both
+issues, the driver can do the following after the reset, for each clock
+which supports alarm:
+
+\begin{enumerate}
+\item Make a VIRTIO_RTC_REQ_SET_ALARM request available, with
+        \field{alarm_time} set to 0, and \field{flags} set to 0.
+
+\item Wait until the device uses the buffer, with status
+        VIRTIO_RTC_S_OK.
+\end{enumerate}
+
+To prevent the above issues, the driver also marks buffers in the alarmq
+as available only after completing the above steps for all clocks.
+
+\paragraph{Alarm Control Requests}
+
+If VIRTIO_RTC_F_ALARM has been negotiated,
+
+\begin{itemize}
+\item the driver can determine if a clock supports an alarm through the
+        VIRTIO_RTC_FLAG_ALARM_CAP flag in the VIRTIO_RTC_REQ_CLOCK_CAP
+        response,
+
+\item the driver can enqueue the alarm control requests into the
+        requestq: VIRTIO_RTC_REQ_READ_ALARM, VIRTIO_RTC_REQ_SET_ALARM,
+        and VIRTIO_RTC_REQ_SET_ALARM_ENABLED.
+\end{itemize}
+
+The unit of all \field{alarm_time} fields is 1 nanosecond.
+
+\begin{description}
+\item[VIRTIO_RTC_REQ_READ_ALARM] reads the current alarm.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_READ_ALARM 0x1003 /* message type */
+
+struct virtio_rtc_req_read_alarm {
+        struct virtio_rtc_req_head head;
+        le16 clock_id;
+        u8 reserved[6];
+};
+
+struct virtio_rtc_resp_read_alarm {
+        struct virtio_rtc_resp_head head;
+        le64 alarm_time;
+#define VIRTIO_RTC_FLAG_ALARM_ENABLED   (1 << 0)
+        u8 flags;
+        u8 reserved[7];
+};
+\end{lstlisting}
+
+\field{clock_id} identifies the alarm through its associated clock. The
+\field{alarm_time} field returns the alarm time. In the \field{flags}
+field, VIRTIO_RTC_FLAG_ALARM_ENABLED indicates whether the alarm is
+enabled.
+
+\item[VIRTIO_RTC_REQ_SET_ALARM] sets the alarm.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_SET_ALARM 0x1004 /* message type */
+
+struct virtio_rtc_req_set_alarm {
+        struct virtio_rtc_req_head head;
+        le64 alarm_time;
+        le16 clock_id;
+        /* flag: VIRTIO_RTC_FLAG_ALARM_ENABLED */
+        u8 flags;
+        u8 reserved[5];
+};
+
+struct virtio_rtc_resp_set_alarm {
+        struct virtio_rtc_resp_head head;
+        /* no response params */
+};
+\end{lstlisting}
+
+\field{clock_id} identifies the alarm through its associated clock. The
+\field{alarm_time} field sets the alarm time. If
+VIRTIO_RTC_FLAG_ALARM_ENABLED is set in the \field{flags} field, the
+device enables the alarm; otherwise, the device disables the alarm.
+
+\item[VIRTIO_RTC_REQ_SET_ALARM_ENABLED] enables or disables the alarm.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_SET_ALARM_ENABLED 0x1005 /* message type */
+
+struct virtio_rtc_req_set_alarm_enabled {
+        struct virtio_rtc_req_head head;
+        le16 clock_id;
+        /* flag: VIRTIO_RTC_FLAG_ALARM_ENABLED */
+        u8 flags;
+        u8 reserved[5];
+};
+
+struct virtio_rtc_resp_set_alarm_enabled {
+        struct virtio_rtc_resp_head head;
+        /* no response params */
+};
+\end{lstlisting}
+
+\field{clock_id} identifies the alarm through its associated clock. If
+VIRTIO_RTC_FLAG_ALARM_ENABLED is set in the \field{flags} field, the
+device enables the alarm; otherwise, the device disables the alarm.
+
+When processing this request, the device retains the alarm time.
+
+\end{description}
+
+\paragraph{Alarm Notifications}
+
+If the alarmq is present, the driver should make buffers available in
+the alarmq, which the device uses for alarm notifications. All alarmq
+fields are device-writable. The alarmq uses a common notification
+header.
+
+\begin{lstlisting}
+/* common notification header */
+struct virtio_rtc_notif_head {
+        le16 msg_type;
+        u8 reserved[6];
+};
+\end{lstlisting}
+
+The \field{msg_type} field identifies the message type.
+
+\begin{description}
+\item[VIRTIO_RTC_NOTIF_ALARM] notifies the driver about an alarm
+        expiration.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_NOTIF_ALARM 0x2000 /* message type */
+
+struct virtio_rtc_notif_alarm {
+        struct virtio_rtc_notif_head head;
+        le16 clock_id;
+        u8 reserved[6];
+};
+\end{lstlisting}
+
+\end{description}
+
+\field{clock_id} identifies the expired alarm through its associated
+clock.
-- 
2.43.0

