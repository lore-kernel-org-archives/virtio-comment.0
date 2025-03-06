Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B85E20A5D5
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741254706; cv=none; b=mmiDyuxvrXaBVmjvUCbQK/heQXxmVBY0IG4mvpTGpfuUbeVJKsTdb2jf8cH/yf84nR2+EEUw3F7XCKfDf+5EXZzFdpeQeL/uNnUWRFOhMRAUViLBcelI7vw78gdHUaqwnZ2jQ3k4J05cNWxEe1Aaog9im1SaLaMU042Dv7qqRx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741254706; c=relaxed/simple;
	bh=315lcfuHUILSmapARnNnZjt8oSdR1CEl0jIRneLsJUk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jKqjovNm2HJq7gZa4oTxZx5aDvEa740KwQgJyqrUgfhKXXHac2MCY/nv3UnkEznc18Hogqm4buZYLBT69i/nR416JC9eAYIvHW2INkJUFI+FqZgEeIN0+dyKKVZu3ahWaRcX/xJiocSeHqKyXxNsc7sgUADcnsT3im8DzJ4uDEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XYELHc6N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XYELHc6N"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526927Ke014538;
	Thu, 6 Mar 2025 09:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdx3rO8L+abiE9KRg8tcvMt3sBeMGYxwSIV0fYu33Ro=; b=XYELHc6NG0rSUmCX
	Zsi8fbYr+/3rMMNwZTl2mV/PI+tTsPtoTOxzqo+lA9r+aUUA8XUNOWuL6R3ii0AV
	iWujy1PY7eGU+BWYCBgztdmjwbyT5IBnepZflVDQbSrupE7i9AKaQfjhz85GaMbw
	gWqxNBZ4GepWV3NF09Sy64PiozImdX5WG1UoCIbha/v8Zh9Jrj4Y2sKNeon/F5+9
	s8LFXwQblskDpkpRkNnjsOymBXVdbyoIl1rlrzqyX6gTTceHowgcqkq2mBt6J1Bj
	mOIDTmSQ5sUYVZJrqAk9h2i4uJGvilMOwdNCoxEcbeOOVEfDWKS4+8d5TWMnF5VE
	in8Hig==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6vrhyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 09:51:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5269pfVd020568
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 09:51:41 GMT
Received: from PHILBER.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 01:51:38 -0800
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
        Peter Hilber
	<quic_philber@quicinc.com>
Subject: [PATCH v8 3/4] virtio-rtc: Add alarm feature
Date: Thu, 6 Mar 2025 10:51:11 +0100
Message-ID: <20250306095112.1293-4-quic_philber@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306095112.1293-1-quic_philber@quicinc.com>
References: <20250306095112.1293-1-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6aCfT6pcD4jC95A6Vc-uaKbe_uHNy3TL
X-Authority-Analysis: v=2.4 cv=LYfG6ifi c=1 sm=1 tr=0 ts=67c9702d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=bs-e4Z8cAAAA:8 a=COk6AnOGAAAA:8 a=8qEshuefgE35KYI6xC8A:9
 a=YFpLQiK6rFjqGb8m0bXF:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6aCfT6pcD4jC95A6Vc-uaKbe_uHNy3TL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_04,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060073

Add the VIRTIO_RTC_F_ALARM feature (without normative statements).

The intended use case is: A driver needs to react when an alarm time has
been reached, but at alarm time, the driver may be in a sleep state or
powered off. The alarm feature can resume and notify the driver in this
case. Alarms may be retained across device resets (including reset on
boot).

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

 device-types/rtc/description.tex | 262 ++++++++++++++++++++++++++++++-
 1 file changed, 260 insertions(+), 2 deletions(-)

diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
index f2a3907de511..93bcf178b042 100644
--- a/device-types/rtc/description.tex
+++ b/device-types/rtc/description.tex
@@ -4,6 +4,7 @@ \section{RTC Device}\label{sec:Device Types / RTC Device}
 time. The device can provide different clocks, e.g.\ for the UTC or TAI
 time standards, or for physical time elapsed since some past epoch. The
 driver can read the clocks with simple or more accurate methods.
+Optionally, the driver can set an alarm.
 
 \subsection{Device ID}\label{sec:Device Types / RTC Device / Device ID}
 
@@ -13,13 +14,23 @@ \subsection{Virtqueues}\label{sec:Device Types / RTC Device / Virtqueues}
 
 \begin{description}
 \item[0] requestq
+\item[1] alarmq
 \end{description}
 
 The driver enqueues requests to the requestq.
 
+Through the alarmq, the device notifies the driver about alarm
+expirations. The alarmq exists only if VIRTIO_RTC_F_ALARM was
+negotiated.
+
 \subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature bits}
 
-No device-specific feature bits are defined yet.
+\begin{description}
+\item[VIRTIO_RTC_F_ALARM (0)] Device supports alarm.
+\end{description}
+
+VIRTIO_RTC_F_ALARM determines whether the device supports setting an
+alarm for some of the clocks.
 
 \subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
 
@@ -373,7 +384,8 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
         struct virtio_rtc_resp_head head;
         u8 type;
         u8 leap_second_smearing;
-        u8 reserved[6];
+        u8 flags;
+        u8 reserved[5];
 };
 \end{lstlisting}
 
@@ -384,6 +396,15 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
 variant} through the \field{leap_second_smearing} field. All other
 clocks set \field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED.
 
+The \field{flags} field provides the following information:
+
+\begin{lstlisting}
+#define VIRTIO_RTC_FLAG_ALARM_CAP               (1 << 0)
+\end{lstlisting}
+
+If VIRTIO_RTC_F_ALARM was negotiated, the VIRTIO_RTC_FLAG_ALARM_CAP flag
+indicates that the clock supports an alarm.
+
 \item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device supports
 cross-timestamping for a particular pair of clock and hardware counter.
 
@@ -690,3 +711,240 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
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
+The alarm feature, and the associated alarmq for notifications from the
+device, are available if VIRTIO_RTC_F_ALARM was negotiated. In addition,
+if the driver previously set an alarm time, even if the device no longer
+both
+
+\begin{itemize}
+\item is live and
+\item has negotiated VIRTIO_RTC_F_ALARM,
+\end{itemize}
+
+the device may still execute implementation-specific actions on alarm
+expiration.
+
+An alarm expires
+
+\begin{itemize}
+\item when the associated clock progresses (also: steps) from a time
+        prior to the alarm time to the alarm time, or to a time after
+        the alarm time, while the alarm is enabled, or
+
+\item when the driver sets an alarm time which is not in the future,
+        while also setting the alarm to enabled, or
+
+\item when the driver sets the alarm to enabled, and the alarm time is
+        not in the future, or
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
+An alarm \emph{expiration} becomes obsolete
+
+\begin{itemize}
+\item when the driver disables the alarm, or
+
+\item when the driver sets an alarm time, or
+
+\item when the clock jumps backwards, before the alarm time, or
+
+\item when another alarm expiration event happens.
+\end{itemize}
+
+If an alarm expiration becomes obsolete, it is unspecified which alarm
+actions the device executes for this alarm expiration, and the device
+stops executing these alarm actions after a grace period.
+
+The device supports all alarm time values which the driver can request
+through alarm control requests.
+
+Initially, the alarm time is the epoch of the clock ($0$), and the alarm
+is disabled.
+
+Alarms set prior to reset may cause unwanted alarm expiration
+notifications, and information leakage, after the reset. To prevent both
+issues, the driver can do the following after the reset, for each clock
+which supports alarm:
+
+\begin{enumerate}
+\item Send a VIRTIO_RTC_REQ_SET_ALARM message, with \field{alarm_time}
+        set to 0, and \field{flags} set to 0.
+
+\item Wait until the device marks the VIRTIO_RTC_REQ_SET_ALARM message
+        as used, with status VIRTIO_RTC_S_OK.
+\end{enumerate}
+
+To prevent the above issues, the driver also marks buffers in the alarmq
+as available only after completing the above steps for all clocks.
+
+\paragraph{Alarm Control Requests}
+
+If VIRTIO_RTC_F_ALARM is negotiated,
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
+the alarmq, which the device uses for alarm notification messages. All
+alarmq fields are device-writable. The alarmq uses a common notification
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

