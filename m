Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B5D1DE8AB
	for <virtio-comment@lists.linux.dev>; Fri,  6 Dec 2024 09:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478538; cv=none; b=RRUXkDlvDMuZgbIeZ0qEvQ+374N9hXfA6URtixuEVxGnV4cvBC3SkLRapeb/xpynVRI5Sq6MoULdtD8FQwplfJYol6361Q/pHX95FTiNItJr2Z5xQ3sXWV5MKQmEfz4yzpCXaT9zn/ilb9qIiBmFJRmY3yMY2UKQc1WCvI9XUFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478538; c=relaxed/simple;
	bh=CABUMMwK4sx7IOdt/ofo0o/ewCoftSTnPAX3k3eRg2U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r5DItQo9axFXebKPkKmoZcQqVyPvadYx69LlUbhpMgd5TrAAaLmnrG1gXILdMnBidKi/QtOlPH2nN1zMF1tfMc6R1qfwH2B7g6xe4LdxRDtACamPhSDYwhHOZkdX+4ED30gCI3PIXuxac2myImEfEbLTZi3V7ZQ6j3uj4iX8tKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kPldrjCn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kPldrjCn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B67c5LR005219;
	Fri, 6 Dec 2024 09:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+Znuh8/ne3a1EMeKtX2mqN2ZP8CTa8QYKGrXGmd9SU=; b=kPldrjCnMLVLwF47
	jjAh3h4xd00w+AQ/+4bgkbVMOmQKYavSHfypPgJxhTFmOru530hEe/NpYdRiF/kH
	s1w5g1ZsEV+tpL+fjTZ2cAoofzmwltRl7XJfNSK4pnmqi8bkmz4xq5pQTkKG6/Vf
	+dG0e3TYKDUq6wPlnrY1stRRAHewT1ZUZvfwLn5GhFpKhUoBYDOcdRhMWU3T3beL
	P8WCfPkCi7TU03G8G203E+ykhr5b7+xqjGAnXgua9sNe5YaFrBpjrmoeazOAtm/8
	QQLD8vK4YCX7IJuxmHXy/kaOLj8ef7XbmXpThsaYUPzCBjxnFEum+m69TrB+4aWJ
	VQk7/Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba143epc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 09:48:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B69mowr012002
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 09:48:50 GMT
Received: from PHILBER.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 01:48:48 -0800
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
Subject: [RFC PATCH v6 4/4] virtio-rtc: Add normative statements for alarm feature
Date: Fri, 6 Dec 2024 10:48:19 +0100
Message-ID: <20241206094819.858-5-quic_philber@quicinc.com>
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
X-Proofpoint-GUID: rTz_p2-7LF_J8v6I2QvNaJNtzjsHVBCk
X-Proofpoint-ORIG-GUID: rTz_p2-7LF_J8v6I2QvNaJNtzjsHVBCk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060070

Add the normative statements for the alarm feature added previously.

Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
---

Notes:
    v4:
    
    - Update normative statements to match v4 changes to non-normative
      statements (patch 3).
    
    - Driver should read clock to confirm that alarm has expired.
    
    - Formatting and wording improvements.

 device-types/rtc/description.tex        | 194 +++++++++++++++++++++---
 device-types/rtc/device-conformance.tex |   4 +
 device-types/rtc/driver-conformance.tex |   2 +
 3 files changed, 181 insertions(+), 19 deletions(-)

diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
index a13feb06530b..b28b3c9bcd4b 100644
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
@@ -329,7 +334,7 @@ \subsubsection{Common Definitions}\label{sec:Device Types / RTC Device / Device
 
         \item that a leap second is currently in progress, and
 
-        \item that a leap second happened in the recent past.
+        \item that a leap second happened in the previous month.
 
 \end{itemize}
 
@@ -365,7 +370,7 @@ \subsubsection{Common Definitions}\label{sec:Device Types / RTC Device / Device
 \end{lstlisting}
 
 For convenience, some of the above leap second indications have the
-following flags set as part of the indication's encoding:
+following bits set as part of the indication's encoding:
 
 \begin{lstlisting}
 #define VIRTIO_RTC_LEAP_SMEAR_NEAR      0x10
@@ -415,7 +420,8 @@ \subsubsection{Common Definitions}\label{sec:Device Types / RTC Device / Device
 means that there is a leap second in the near future, at present, or in
 the near past, and that this leap second is currently being smeared.
 
-Clocks of types VIRTIO_RTC_CLOCK_UTC_SMEARED and
+Clocks of type VIRTIO_RTC_CLOCK_UTC always indicate the leap second
+state. Clocks of types VIRTIO_RTC_CLOCK_UTC_SMEARED and
 VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED indicate the leap second state only
 if the device sets a respective flag.
 
@@ -440,7 +446,7 @@ \subsubsection{Common Definitions}\label{sec:Device Types / RTC Device / Device
 #define VIRTIO_RTC_COUNTER_ARM_VCT      0
 /* x86 Time-Stamp Counter */
 #define VIRTIO_RTC_COUNTER_X86_TSC      1
-/* Reserved */
+/* Invalid */
 #define VIRTIO_RTC_COUNTER_INVALID   0xFF
 \end{lstlisting}
 
@@ -549,7 +555,7 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
         indicate all leap seconds.
 
 \item Flag VIRTIO_RTC_FLAG_TAI_OFFSET_CAP indicates that the clock will
-        always indicate the offset of the UTC standard to TAI.
+        always indicate the offset of the UTC standard from TAI.
 
 \item Flag VIRTIO_RTC_FLAG_SMEAR_OFFSET_CAP indicates that the clock
         will always indicate the offset of the clock from the UTC
@@ -764,7 +770,7 @@ \subsubsection{Data Structures}
 
 The \field{tai_offset_sec} field indicates the current offset of the UTC
 standard from the TAI standard, in the form $\mbox{tai_offset_sec} =
-\mbox{TAI} - \mbox{UTC}$. The offset unit is seconds.
+\mbox{TAI} - \mbox{UTC}$. The field unit is seconds.
 
 The \field{tai_offset_sec} field is interpreted as a signed integer in
 little-endian, two's complement, representation.
@@ -773,7 +779,7 @@ \subsubsection{Data Structures}
 the clock from the UTC standard, in the form
 $\mbox{smear_offset_nsec} = \mbox{UTC} - \mbox{clock}$. The
 \field{smear_offset_nsec} field can only be non-zero while a clock is
-smearing time in the vicinity of a leap second. The offset unit is
+smearing time in the vicinity of a leap second. The field unit is
 nanoseconds.
 
 The \field{smear_offset_nsec} field is interpreted as a signed
@@ -783,9 +789,8 @@ \subsubsection{Data Structures}
 
 The \emph{clock performance} describes the difference between clock
 readings obtained by the driver from the device, and clock readings
-obtained from an ideal clock. Through \field{struct virtio_rtc_perf},
-the device reports the clock performance. \field{struct virtio_rtc_perf}
-describes the performance of a particular clock reading obtained by the
+obtained from an ideal clock. \field{struct virtio_rtc_perf} describes
+the clock performance of a particular clock reading obtained by the
 driver.
 
 \begin{lstlisting}
@@ -821,22 +826,21 @@ \subsubsection{Data Structures}
 is ppm (parts per million) with a 44-bit fractional part (a field value
 of 1 corresponds to $2^{-44}$ ppm).
 
-The device sets the flag VIRTIO_RTC_FLAG_FREQ_MAXERROR_VALID resp.\
-VIRTIO_RTC_FLAG_FREQ_ESTERROR_VALID to indicate that the value of the
-\field{freq_maxerror} resp.\ \field{freq_esterror} field is valid.
+The device sets the flag VIRTIO_RTC_FLAG_FREQ_ESTERROR_VALID resp.\
+VIRTIO_RTC_FLAG_FREQ_MAXERROR_VALID to indicate that the value of the
+\field{freq_esterror} resp.\ \field{freq_maxerror} field is valid.
 
 The clock \emph{time error} is the absolute value of the offset of the
 clock to an ideal clock according to the clock definition. Field
-\field{time_maxerror} is an upper bound to the absolute offset of the
-clock from the clock definition. Field \field{time_esterror} is the
-device's point estimate of that absolute offset.
+\field{time_maxerror} is an upper bound to the time error. Field
+\field{time_esterror} is the device's point estimate of the time error.
 
 The unit of the \field{time_maxerror} and \field{time_esterror}
 fields is 1 nanosecond.
 
-The device sets the flag VIRTIO_RTC_FLAG_TIME_MAXERROR_VALID resp.\
-VIRTIO_RTC_FLAG_TIME_ESTERROR_VALID to indicate that the value of the
-\field{time_maxerror} resp.\ \field{time_esterror} field is valid.
+The device sets the flag VIRTIO_RTC_FLAG_TIME_ESTERROR_VALID resp.\
+VIRTIO_RTC_FLAG_TIME_MAXERROR_VALID to indicate that the value of the
+\field{time_esterror} resp.\ \field{time_maxerror} field is valid.
 
 \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Operation / Read Requests}
 
@@ -1025,6 +1029,12 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
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
@@ -1138,6 +1148,79 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
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
@@ -1234,6 +1317,62 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
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
@@ -1269,3 +1408,20 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
 
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

