Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A14D1C4600
	for <virtio-comment@lists.linux.dev>; Tue, 27 Aug 2024 13:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724766764; cv=none; b=Tqk1f6gNCGCGQS61D8eiTqfos04OFdwdLa2deJegfRT6bzQIraUkJSa3M21NvPrxJUWYCwdthRajWycN8jPv2EYsEi/H7RHNxGDqVLmyCZ8mqXz1QsEaxc19rFtwhfjwYTrIi9JhnOGwYZpJlTr7UjYDNdzCKiHylQzRfVokuls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724766764; c=relaxed/simple;
	bh=PDpCS6q/YqSeIIO2gJ6aUGryjF0ZHiFEpMZ9neAMS/k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kszAphuTzC9JTQoxS28LlXJKFUmTMJ1YjC3HLxu0T31hBrpFKnbF3X2c/G1B1UUaa2J/boG4YY7nMpeeq0gcgFHuQB5ysl4lzHA2m67+BNSDhfNop365JchCP0JPe++JVTUxFR6xYNTGW8LaTXx0DT7Wi1OaGccSUnzgh95+Lvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EsZtqXRU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EsZtqXRU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R7YwkF017528;
	Tue, 27 Aug 2024 13:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QBHqfBjCV19IIyNC8gTUPGv8xLM5gCxH2SIRTdcqI8s=; b=EsZtqXRUaMHU1Igh
	Ujf70LsEDrMfs5aC83/0Rjti2kk83/T3cOzgKQdi+nrYZzzBlvTAwXzgFQ/SVSXW
	P+Fe0QqImzhb7fgcnWzhRJglsQ9ThpXmnz9piKbIDb3Q7cdUNMR8ohBn5gxCt8DC
	LZew1EJV2TgN792eeVu3hUMY1aQKREKQ5JKhkPJaVuIYe9wxa9P/X+Lwzbg/Qh6V
	39LZWe5tHYZEd5QY4Trkb3qizaaL9DrmazlaZv9+MaRT1KmJQbwBWN25ZuUyMhQL
	Ti7i5Rq9YJ3vfA0Qd7qRgKrJ2QKi+b4B9bXSztoqVpfGZwF9+tB/xBCg2YlE7vq2
	T84BpA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4179duy1my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 13:52:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47RDqcVZ005868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 13:52:38 GMT
Received: from PHILBER.qualcomm.com (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 27 Aug
 2024 06:52:35 -0700
From: Peter Hilber <quic_philber@quicinc.com>
To: <virtio-comment@lists.linux.dev>
CC: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
        "Jason
 Wang" <jasowang@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        "Ridoux,
 Julien" <ridouxj@amazon.com>,
        Trilok Soni <tsoni@quicinc.com>,
        "Srivatsa
 Vaddagiri" <quic_svaddagi@quicinc.com>,
        Peter Hilber
	<quic_philber@quicinc.com>
Subject: [RFC PATCH v5 4/4] virtio-rtc: Add normative statements for alarm feature
Date: Tue, 27 Aug 2024 15:52:01 +0200
Message-ID: <20240827135201.1251-5-quic_philber@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827135201.1251-1-quic_philber@quicinc.com>
References: <20240827135201.1251-1-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wy5RJ0M8oU8Kt78cgYCMqItmQKu0P3-k
X-Proofpoint-ORIG-GUID: wy5RJ0M8oU8Kt78cgYCMqItmQKu0P3-k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_07,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408270102

Add the normative statements for the alarm feature added previously.

Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
---

Notes:
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
index 1627cc5fe1a2..f77b1099b32a 100644
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
@@ -994,6 +999,12 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
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
@@ -1107,6 +1118,79 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
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
@@ -1203,6 +1287,62 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
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
@@ -1238,3 +1378,20 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
 
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

