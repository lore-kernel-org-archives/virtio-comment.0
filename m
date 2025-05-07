Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B7328C2CF
	for <virtio-comment@lists.linux.dev>; Wed,  7 May 2025 15:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633084; cv=none; b=QqT+B2qeNesCPgQkbhA8s7bIVxQcI6DEUnQ5j/wNW+sfvizzztGyrb71pVUtD5N1zU6/PE+z2QcUUvPdufqG/0xNR6Twy8tdEoj1ZPnGdszf9L/GXqZtOoy2Yuy0bfjhPjGrRfQqpQpQWBprfxeenrBz/bWtnRZeRSnf3cLjKog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633084; c=relaxed/simple;
	bh=mw+81XZub7rd11doSblFJTr7o6Oo3iYVT7jBprhdXUM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LroX7mL2spcSOxRyzObLVIjran90YWvoSBCI0ac79SQ56KAgLhvjaQ5p8N1hjD/xlgOHCDi01tedOuc+J6MRIrZB7JhSZ2vQ8LBtdjjhb/A8ASHtQXyYOTlTAaFtOO2W86EpYy2K6BT1jO8U66m6tevP01l7lme70cFY9ygGkqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PzT3GK6i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PzT3GK6i"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547AbvSf024523;
	Wed, 7 May 2025 15:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSWDestpx+fZSqDVjIaVlF1UWAxmW7q9gQa4Q00uFqg=; b=PzT3GK6iBaQgsCNx
	LAkKr0nrjA5XlHJjthl1hvMSN17bxoRbnmN/s3OUmxDVYNSazsETTG/tSqDsip1X
	qgn5IwOuN/2dmxZsKx3ih0hQtIVXBCLLQ868Lpl4APhkpsPwfD/QdYTnjPhyepPH
	hkvT5Ai6hleWE3yO6WLWI5OX8gDSS7oV1bCtSiDKerYISdggnzaSVdsXxZkgWa1o
	T5ZMZexRFUfB+yyy4/eeXk4WCvqwGQwKUq5pDLzdIHH4mD4DJv1+G9N3j4MINTsN
	fRaUmMzdB2ObYUXe9fZMkcbB4CYFjivrgCza0c9c4YJNLC3uymV0iKD4XyShIHeO
	l2ZbVg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5w3e9ew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 15:51:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 547FpJkM015280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 15:51:19 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 08:51:16 -0700
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
Subject: [PATCH v9 4/4] virtio-rtc: Add normative statements for alarm feature
Date: Wed, 7 May 2025 17:50:36 +0200
Message-ID: <20250507155036.1489-5-quic_philber@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507155036.1489-1-quic_philber@quicinc.com>
References: <20250507155036.1489-1-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE0OCBTYWx0ZWRfX2qeCrbN6oAKy
 oJSjdwuDXmzC2CR0irfijSj4lnodwk+Zi9bypCvVEr+28u6fc+7lX5NhM3joejJMopprLOHS2Yb
 NwfGNhm7yh69N0xfZScZUf3WFaFCe45v+Vjen+34h28elXkZlOQHuFQICRziigKz0MZYQes3zEH
 o5chSMsM5Sw35lXSgY3QtpUXBnV3ETW/yJmFJxvuTlBeqTAmaSF1HykPu6beSjAIfftOJEVOlRk
 NZ8QNPkmh1tAKRGhldnsuBhjfJlnb6AK6Kjn5YAqzIm6xd9SzvhycEA7RSQPQtnwGLLSRLRUvZT
 E+Oy3n/kO88JDdPNiKeRlNOAnMC090bmXU0K6IoQizFhhSL33UjZsF09cnBH8nbeBqCT0sSTF1z
 vFVpxcDMXGI65SqM3kZ2gwnQjlMd1nFhWIfRnNuzHDNkwglQdacEVrB1tWAKlIh7izprCD/p
X-Proofpoint-GUID: 9-CZptlCHvxsIkNzDcpvaVSDY19AhfDo
X-Proofpoint-ORIG-GUID: 9-CZptlCHvxsIkNzDcpvaVSDY19AhfDo
X-Authority-Analysis: v=2.4 cv=W+s4VQWk c=1 sm=1 tr=0 ts=681b8178 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=ur0yVZ1vKWtdrCNW7kMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_05,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070148

Add the normative statements for the alarm feature added previously.

Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
---

Notes:
    v9:
    
    - Weaken requirements about aborting alarm actions which became obsolete
      (Matias Ezequiel Vara Larsen).
    
    - Change "feature was negotiated" to "feature has been negotiated" (Matias
      Ezequiel Vara Larsen).
    
    - "Mark available"/"use" buffers instead of messages (Michael S.
      Tsirkin).
    
    v8:
    
    - Explicitly describe alarm enabled status, where relevant (Matias
      Ezequiel Vara Larsen).
    
    - Simplify requirement about clock readings after alarm (Matias Ezequiel
      Vara Larsen).
    
    - Move requirements to serve alarm expiration events before requirements
      about stopping to serve (Matias Ezequiel Vara Larsen).
    
    - Change word order from "field X" to "the X field" (Matias Ezequiel
      Vara Larsen).
    
    - Change word order from "flag X" to "the X flag" or "X".
    
    v7:
    
    - Remove inadvertent v6 changes, which should have been part of
      preceding patches.
    
    v4:
    
    - Update normative statements to match v4 changes to non-normative
      statements (patch 3).
    
    - Driver should read clock to confirm that alarm has expired.
    
    - Formatting and wording improvements.

 device-types/rtc/description.tex        | 153 ++++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |   4 +
 device-types/rtc/driver-conformance.tex |   2 +
 3 files changed, 159 insertions(+)

diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
index 5a70c42c2c4f..0784155bcb06 100644
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
 
 None currently defined.
@@ -727,6 +732,11 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
 specification, the device MUST use the nanosecond as unit for the
 \field{clock_reading} field.
 
+If the device sent an alarm notification for clock C with alarm time A,
+the device MUST, for all read requests of C which the driver marks as
+available after the notification, return a \field{clock_reading} which
+does not precede A (except if C stepped backwards to before A).
+
 \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Operation / Alarm Operation}
 
 Through the optional alarm feature, the driver can set an alarm time. On
@@ -833,6 +843,79 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
 To prevent the above issues, the driver also marks buffers in the alarmq
 as available only after completing the above steps for all clocks.
 
+\devicenormative{\paragraph}{Alarm Operation}{Device Types / RTC Device / Device Operation / Alarm Operation}
+
+The device MAY retain both alarm time and alarm enabled status of a
+clock across a device reset.
+
+If the device did not retain alarm time and alarm enabled status of a
+clock across a device reset, the device MUST initialize alarm time to 0.
+
+If the device did not retain alarm time and alarm enabled status of a
+clock across a device reset, the device MUST disable the alarm.
+
+If VIRTIO_RTC_F_ALARM has been negotiated, the device MUST support the
+alarm messages, VIRTIO_RTC_REQ_READ_ALARM, VIRTIO_RTC_REQ_SET_ALARM,
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, and VIRTIO_RTC_NOTIF_ALARM, for one or
+more clocks.
+
+If VIRTIO_RTC_F_ALARM has not been negotiated, the device MUST NOT
+support the alarm messages.
+
+The device MUST set the VIRTIO_RTC_FLAG_ALARM_CAP flag in \field{struct
+virtio_rtc_resp_clock_cap.flags} if the respective clock supports alarm
+messages, and clear the flag otherwise.
+
+The device MUST consider it an alarm expiration event when the
+associated clock progresses (also: steps) from a time prior to the alarm
+time to the alarm time, or to a time after the alarm time, while the
+alarm is enabled.
+
+The device MUST consider it an alarm expiration event when the
+driver sets an alarm time which the associated clock has already reached
+or passed, while also setting the alarm to enabled.
+
+The device MUST consider it an alarm expiration event when the driver
+sets the alarm to enabled, if the clock has already reached or passed
+the alarm time.
+
+If the device retained alarm time and alarm enabled status of a clock
+across a device reset, and the clock has already reached or passed the
+alarm time, the device MUST consider this device reset an alarm
+expiration event, if the alarm is enabled.
+
+If an alarm expiration event E happens, the device MUST start serving
+the alarm expiration event E.
+
+If the device is currently serving an alarm expiration event E, the
+device MUST use a single VIRTIO_RTC_NOTIF_ALARM notification for E, as
+soon as an alarmq buffer is available for this purpose.
+
+While the device is serving an alarm expiration event, the device MAY
+execute implementation-specific alarm actions.
+
+The device MAY ignore the device status when executing
+implementation-specific alarm actions.
+
+The device MAY ignore whether VIRTIO_RTC_F_ALARM has been negotiated
+when executing implementation-specific alarm actions.
+
+If the driver successfully disables an alarm for clock C with request
+VIRTIO_RTC_REQ_SET_ALARM or VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device
+MUST stop serving any previous alarm expiration event for C before the
+device uses the response buffer.
+
+If the driver successfully requests VIRTIO_RTC_REQ_SET_ALARM, or
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, for clock C, keeping the alarm
+enabled, the device MAY stop serving any previous alarm expiration event
+for C.
+
+After a clock C stepped to a time previous to C's alarm time, the device
+MAY stop serving any previous alarm expiration event for C.
+
+If an alarm expiration event happens for clock C, the device MAY stop
+serving any previous alarm expiration event for C.
+
 \paragraph{Alarm Control Requests}
 
 If VIRTIO_RTC_F_ALARM has been negotiated,
@@ -927,6 +1010,59 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
 
 \end{description}
 
+\drivernormative{\subparagraph}{Alarm Control Requests}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
+
+For VIRTIO_RTC_REQ_SET_ALARM and for any clock type listed in this
+specification, the driver MUST use the nanosecond as unit for the
+\field{alarm_time} field.
+
+\devicenormative{\subparagraph}{Alarm Control Requests}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
+
+If VIRTIO_RTC_F_ALARM has not been negotiated, the device MUST set
+status VIRTIO_RTC_S_ENODEV for VIRTIO_RTC_REQ_READ_ALARM,
+VIRTIO_RTC_REQ_SET_ALARM, and VIRTIO_RTC_REQ_SET_ALARM_ENABLED.
+
+If the clock does not support alarm messages, the device MUST set status
+VIRTIO_RTC_S_ENODEV for VIRTIO_RTC_REQ_READ_ALARM,
+VIRTIO_RTC_REQ_SET_ALARM, and VIRTIO_RTC_REQ_SET_ALARM_ENABLED.
+
+For VIRTIO_RTC_REQ_READ_ALARM, the device MUST set the
+\field{alarm_time} field to the alarm time.
+
+For VIRTIO_RTC_REQ_READ_ALARM, the device MUST set the
+VIRTIO_RTC_FLAG_ALARM_ENABLED flag in the \field{flags} field if the
+alarm is enabled, and clear the flag otherwise.
+
+For VIRTIO_RTC_REQ_READ_ALARM and for any clock type listed in this
+specification, the device MUST use the nanosecond as unit for the
+\field{alarm_time} field.
+
+For VIRTIO_RTC_REQ_SET_ALARM, the device MUST accept any
+\field{alarm_time} value.
+
+If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
+the device MUST set the alarm time to the time represented by the
+\field{alarm_time} field.
+
+If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
+the device MUST enable the alarm if VIRTIO_RTC_FLAG_ALARM_ENABLED is set
+in the \field{flags} field.
+
+If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
+the device MUST disable the alarm if VIRTIO_RTC_FLAG_ALARM_ENABLED is
+cleared in the \field{flags} field.
+
+If the device sets status VIRTIO_RTC_S_OK for
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST enable the alarm if
+VIRTIO_RTC_FLAG_ALARM_ENABLED is set in the \field{flags} field.
+
+If the device sets status VIRTIO_RTC_S_OK for
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST disable the alarm if
+VIRTIO_RTC_FLAG_ALARM_ENABLED is cleared in the \field{flags} field.
+
+If the device sets status VIRTIO_RTC_S_OK for
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST retain the alarm time.
+
 \paragraph{Alarm Notifications}
 
 If the alarmq is present, the driver should make buffers available in
@@ -962,3 +1098,20 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
 
 \field{clock_id} identifies the expired alarm through its associated
 clock.
+
+\drivernormative{\subparagraph}{Alarm Notifications}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
+
+If VIRTIO_RTC_F_ALARM has been negotiated, the driver SHOULD populate
+the alarmq with buffers.
+
+The driver MUST allocate enough space for any alarmq notification in the
+device-writable part of an alarmq buffer.
+
+If the driver receives a VIRTIO_RTC_NOTIF_ALARM notification, the driver
+SHOULD read the associated clock instead of assuming that the alarm time
+which the driver set last has been reached.
+
+\devicenormative{\subparagraph}{Alarm Notifications}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
+
+The device MUST NOT use a VIRTIO_RTC_NOTIF_ALARM notification for a
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

