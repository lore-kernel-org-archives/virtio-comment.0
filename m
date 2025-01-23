Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D54320C48A
	for <virtio-comment@lists.linux.dev>; Thu, 23 Jan 2025 10:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737627413; cv=none; b=g2jURnUer5DiJT8E5QLKlITtzFUZvoe/m3mTfhxsrS01zUrUuWcCQfJMvK7AATkicvrgWa/rJh2MMCSj5QXh2Hl2/wiqt/WSyJojNFo9WxKNXHHNa+KkPLxiFpBJupwOeXWFfjLrl4hL0KIEK61TFrfUwrPayCa8ttTxoeM6j74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737627413; c=relaxed/simple;
	bh=upuT344l+CmC3c3B8ZZgI2m9yi8UxUkUKFWmoHKGwBo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L9ALnO01fSg0Cp7Pia6jfx2Fdr4+B3g+fQiiJ5Oe4NTflvgL/WYNGJzSfu+SZmE8AmmcmYPbkY+DZjtUJBS7XnVXSimDwV7YKg5XDEND6x+cjWowlXhZVLQE9N6ya0Z+T9yF9xAKzJAdJIcxjKMV2HbGK4JGWF6gDHskrV0GiDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZYhl8CYA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZYhl8CYA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N4rwKT023879;
	Thu, 23 Jan 2025 10:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEzGzp+uBEqmi+B7Y/3cjYGmH5LDH0WeAMMabW4uVKI=; b=ZYhl8CYALj/Chrt7
	k/g0uPN0xNndlrUk4rujXFwRuHrndRj59QHk7Z+Q9Uxwvx3j3x+57WBU9UTbK1/6
	1m6Lfdf8ZlLRt7ffBkkKYUEUazuOopAdTr0s5fM7zXxNW44nESEusRM4/Ns8713w
	EjIo+e3jcOnj0drfuv8j2p/pBup2RkZThn0A6bPEgQqwa6HqGMHeNKu90hNb1su7
	MLV4hpbm/5ce7Rz2ct1jLHYILJc+n0ht7v5uUTwjsjWdKmIu+MH7EjO8+SsCrtMk
	Wxw4TqfQdQ92QKyGBlwwT5AavNDcp6WLpByBxSiTBFsn/Fbns+uA+Vk3rLDQ08pJ
	Vo1Few==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bf518qb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 10:16:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50NAGlOd028801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 10:16:47 GMT
Received: from PHILBER.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 Jan
 2025 02:16:44 -0800
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
Subject: [PATCH v7 4/4] virtio-rtc: Add normative statements for alarm feature
Date: Thu, 23 Jan 2025 11:16:15 +0100
Message-ID: <20250123101616.664-5-quic_philber@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250123101616.664-1-quic_philber@quicinc.com>
References: <20250123101616.664-1-quic_philber@quicinc.com>
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
X-Proofpoint-ORIG-GUID: -wZdZ5I7QMGGmIstOPJpLZ9IfBOQkOia
X-Proofpoint-GUID: -wZdZ5I7QMGGmIstOPJpLZ9IfBOQkOia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501230078

Add the normative statements for the alarm feature added previously.

Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
---

Notes:
    v7:
    
    - Remove inadvertent v6 changes, which should have been part of
      preceding patches.
    
    v4:
    
    - Update normative statements to match v4 changes to non-normative
      statements (patch 3).
    
    - Driver should read clock to confirm that alarm has expired.
    
    - Formatting and wording improvements.

 device-types/rtc/description.tex        | 157 ++++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |   4 +
 device-types/rtc/driver-conformance.tex |   2 +
 3 files changed, 163 insertions(+)

diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
index 47ad50cd95ca..32fed5f8620f 100644
--- a/device-types/rtc/description.tex
+++ b/device-types/rtc/description.tex
@@ -32,6 +32,11 @@ \subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature bits}
 VIRTIO_RTC_F_ALARM determines whether the device supports setting an
 alarm for some of the clocks.
 
+\devicenormative{\subsubsection}{Feature bits}{Device Types / RTC Device / Feature bits}
+
+The device SHOULD offer VIRTIO_RTC_F_ALARM if the device can support
+setting an alarm for any of its clocks.
+
 \subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
 
 There is no configuration data for the device.
@@ -715,6 +720,12 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
 this specification, the device MUST use the nanosecond as unit for
 field \field{clock_reading}.
 
+If VIRTIO_RTC_F_ALARM was negotiated, and the device sent an alarm
+notification N for clock C with alarm time A, the device MUST, for all
+read requests of C which the driver marks as available after the device
+marked N as used, return a \field{clock_reading} which does not precede
+A, unless C stepped backwards to before A.
+
 \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Operation / Alarm Operation}
 
 Through the optional alarm feature, the driver can set an alarm time. On
@@ -828,6 +839,79 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
 To prevent the above issues, the driver also marks buffers in the alarmq
 as available only after completing the above steps for all clocks.
 
+\devicenormative{\paragraph}{Alarm Operation}{Device Types / RTC Device / Device Operation / Alarm Operation}
+
+The device MAY retain both \field{driver_alarm_time} and
+\field{alarm_enabled} of a clock across a device reset.
+
+If the device did not retain \field{driver_alarm_time} and
+\field{alarm_enabled} of a clock across a device reset, the device MUST
+initialize \field{driver_alarm_time} to 0.
+
+If the device did not retain \field{driver_alarm_time} and
+\field{alarm_enabled} of a clock across a device reset, the device MUST
+initialize \field{alarm_enabled} to false.
+
+While \field{alarm_enabled} for a clock is true, the device MUST set the
+alarm time to \field{driver_alarm_time}.
+
+While \field{alarm_enabled} for a clock is false, the device MUST act as
+if the alarm time was in the future.
+
+If VIRTIO_RTC_F_ALARM was negotiated, the device MUST support the alarm
+messages, VIRTIO_RTC_REQ_READ_ALARM, VIRTIO_RTC_REQ_SET_ALARM,
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, and VIRTIO_RTC_NOTIF_ALARM, for one or
+more clocks.
+
+If VIRTIO_RTC_F_ALARM was not negotiated, the device MUST NOT support the
+alarm messages.
+
+The device MUST set flag VIRTIO_RTC_FLAG_ALARM_CAP in \field{struct
+virtio_rtc_resp_clock_cap.flags} if the respective clock supports alarm
+messages, and clear the flag otherwise.
+
+The device MUST consider it an alarm expiration event when the
+associated clock progresses (also: steps) from a time prior to the alarm
+time to the alarm time, or to a time after the alarm time.
+
+The device MUST consider it an alarm expiration event when the
+driver sets an alarm time which the associated clock has already reached
+or passed.
+
+If the device retained \field{driver_alarm_time} and
+\field{alarm_enabled} of a clock across a device reset, and the clock
+has already reached or passed the alarm time, the device MUST consider
+this device reset an alarm expiration event.
+
+If an alarm expiration event E happens, the device MUST start serving
+the alarm expiration event E.
+
+If the driver successfully requests VIRTIO_RTC_REQ_SET_ALARM, or
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, for clock C, the device MUST stop
+serving any previous alarm expiration event for C before the device
+marks the message as used.
+
+If a clock C steps to a time previous to C's alarm time, the device MUST
+stop serving any previous alarm expiration event for C, within a grace
+period.
+
+If an alarm expiration event happens for clock C, the device MUST stop
+serving any previous alarm expiration event for C, within a grace
+period.
+
+If the device is currently serving an alarm expiration event E, the
+device MUST send a single VIRTIO_RTC_NOTIF_ALARM notification for E, as
+soon as an alarmq buffer is available for this purpose.
+
+While the device is serving an alarm expiration event, the device MAY
+execute implementation-specific alarm actions.
+
+The device MAY ignore the device status when executing
+implementation-specific alarm actions.
+
+The device MAY ignore whether VIRTIO_RTC_F_ALARM was negotiated when
+executing implementation-specific alarm actions.
+
 \paragraph{Alarm Control Requests}
 
 If VIRTIO_RTC_F_ALARM is negotiated,
@@ -924,6 +1008,62 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
 \field{driver_alarm_time}.
 \end{description}
 
+\drivernormative{\subparagraph}{Alarm Control Requests}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
+
+For VIRTIO_RTC_REQ_SET_ALARM and for any clock type listed in this
+specification, the driver MUST use the nanosecond as unit for the
+\field{alarm_time} field.
+
+\devicenormative{\subparagraph}{Alarm Control Requests}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
+
+If VIRTIO_RTC_F_ALARM was not negotiated, the device MUST set status
+VIRTIO_RTC_S_ENODEV for VIRTIO_RTC_REQ_READ_ALARM,
+VIRTIO_RTC_REQ_SET_ALARM, and VIRTIO_RTC_REQ_SET_ALARM_ENABLED.
+
+If the clock does not support alarm messages, the device MUST set status
+VIRTIO_RTC_S_ENODEV for VIRTIO_RTC_REQ_READ_ALARM,
+VIRTIO_RTC_REQ_SET_ALARM, and VIRTIO_RTC_REQ_SET_ALARM_ENABLED.
+
+For VIRTIO_RTC_REQ_READ_ALARM, the device MUST set field
+\field{alarm_time} to \field{driver_alarm_time}.
+
+For VIRTIO_RTC_REQ_READ_ALARM, the device MUST set flag
+VIRTIO_RTC_FLAG_ALARM_ENABLED in field \field{flags} if
+\field{alarm_enabled} is true, and clear the flag otherwise.
+
+For VIRTIO_RTC_REQ_READ_ALARM and for any clock type listed in this
+specification, the device MUST use the nanosecond as unit for the
+\field{alarm_time} field.
+
+For VIRTIO_RTC_REQ_SET_ALARM, the device MUST accept any
+\field{alarm_time} value.
+
+If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
+the device MUST set \field{driver_alarm_time} to the time
+represented by field \field{alarm_time}.
+
+If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
+the device MUST set \field{alarm_enabled} to true if flag
+VIRTIO_RTC_FLAG_ALARM_ENABLED is set in field \field{flags}.
+
+If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
+the device MUST set \field{alarm_enabled} to false if flag
+VIRTIO_RTC_FLAG_ALARM_ENABLED is cleared in field \field{flags}.
+
+If the device sets status VIRTIO_RTC_S_OK for
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST set
+\field{alarm_enabled} to true if flag VIRTIO_RTC_FLAG_ALARM_ENABLED is
+set in field \field{flags}.
+
+If the device sets status VIRTIO_RTC_S_OK for
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST set
+\field{alarm_enabled} to false if flag VIRTIO_RTC_FLAG_ALARM_ENABLED is
+cleared in field \field{flags}.
+
+If the device sets status VIRTIO_RTC_S_OK for
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST retain
+\field{driver_alarm_time}.
+
 \paragraph{Alarm Notifications}
 
 If the alarmq is present, the driver should make buffers available in
@@ -959,3 +1099,20 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
 
 \field{clock_id} identifies the expired alarm through its associated
 clock.
+
+\drivernormative{\subparagraph}{Alarm Notifications}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
+
+If VIRTIO_RTC_F_ALARM was negotiated, the driver SHOULD populate the
+alarmq with buffers.
+
+The driver MUST allocate enough space for any alarmq message in the
+device-writable part of an alarmq buffer.
+
+If the driver receives a VIRTIO_RTC_NOTIF_ALARM notification, the driver
+SHOULD read the associated clock instead of assuming that the alarm time
+which the driver set last has been reached.
+
+\devicenormative{\subparagraph}{Alarm Notifications}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
+
+The device MUST NOT send a VIRTIO_RTC_NOTIF_ALARM notification for a
+clock which does not support alarm messages.
diff --git a/device-types/rtc/device-conformance.tex b/device-types/rtc/device-conformance.tex
index 4303cd450542..705691a7319f 100644
--- a/device-types/rtc/device-conformance.tex
+++ b/device-types/rtc/device-conformance.tex
@@ -3,7 +3,11 @@
 An RTC device MUST conform to the following normative statements:
 
 \begin{itemize}
+\item \ref{devicenormative:Device Types / RTC Device / Feature bits}
 \item \ref{devicenormative:Device Types / RTC Device / Device Operation}
 \item \ref{devicenormative:Device Types / RTC Device / Device Operation / Control Requests}
 \item \ref{devicenormative:Device Types / RTC Device / Device Operation / Read Requests}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Alarm Operation}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
 \end{itemize}
diff --git a/device-types/rtc/driver-conformance.tex b/device-types/rtc/driver-conformance.tex
index 689c18d158d0..a87c4cde99c2 100644
--- a/device-types/rtc/driver-conformance.tex
+++ b/device-types/rtc/driver-conformance.tex
@@ -6,4 +6,6 @@
 \item \ref{drivernormative:Device Types / RTC Device / Device Operation}
 \item \ref{drivernormative:Device Types / RTC Device / Device Operation / Control Requests}
 \item \ref{drivernormative:Device Types / RTC Device / Device Operation / Read Requests}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
 \end{itemize}
-- 
2.43.0

