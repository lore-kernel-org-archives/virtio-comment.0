Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A6C1F4E4F
	for <virtio-comment@lists.linux.dev>; Thu, 10 Jul 2025 09:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752138508; cv=none; b=P2Q/fNA7AqJPYGAs5m5ZcZvKR7Xo7eZ7nFbaooyrucjHfvQKJLOKUexabpzPqS0pWCv8R8SH95ux/HxzYF7ESzrV5eGkJ1oTgII7sNBlUDVFtiEhCH5aArnhdq3CF5a861CiMZi5byqX1cn0RcxzAZvHf1zLAzI+/OYK8hoQ8qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752138508; c=relaxed/simple;
	bh=sXIz5jnd8Us1IeO17iF7FQa+B+oOjiD0HxI8TK5XRgI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=naWzJt+mb/DEaZj+sAYRLqWn7isXWoa31hmZ5V+DHegyay9ZHwT/DYLtGUhPKZE0jKqdndlpj3RD2toHpbDbUO3ser45jtX9FPn6nyhuexCPxmgTxVuc9xOZe6OrkzREiQjyA5k75csk52GweWxCf/lGipRIf8d5azUG75A7SRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ozpfzyb3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ozpfzyb3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A6GcQ5022579;
	Thu, 10 Jul 2025 09:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T1M5uKF+ou8rHBnXsr8Rptc6aDstOFt8kkElhouQf34=; b=Ozpfzyb34e3wuHn+
	7vcJaRNvkMxjn4P5EzCaYEWdZwVEOSG3lSlRVmUV3j4mefZnGH1ndgoxtDtbcRj0
	oVUmg0+LbdQn4cH46G/2k7OgZGf+7ccBjZSj/v/isM9Zp3Tn64LCqn0CO7K7FMpv
	nLUsdVupM7bPCf0MJVJEaw60AyFbncJRuERXDrdBHVUQAta9pJBL2D0F6+g239BN
	t6MH+pC3GUu/WvPpv812aBbaYuM/kpJsVzn1SrkKWo0c1+nWFS1yJVKIRCBfHoHy
	x6YEnwT+Bze6bgpmBaAnSJLYaHyOeMxokIPPumryfYT+krlpyGefhOf91vO7vwtf
	ZU/hzw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47t83u0j0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 09:08:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56A98Nth028432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 09:08:23 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 02:08:19 -0700
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
Subject: [PATCH v10 4/4] virtio-rtc: Add normative statements for alarm feature
Date: Thu, 10 Jul 2025 11:06:49 +0200
Message-ID: <20250710090648.1711-6-quic_philber@quicinc.com>
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
X-Proofpoint-ORIG-GUID: c4rkPuZRm8ReVNWBbrnuKFwmpBZB24z3
X-Authority-Analysis: v=2.4 cv=OotPyz/t c=1 sm=1 tr=0 ts=686f8307 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=ur0yVZ1vKWtdrCNW7kMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3NyBTYWx0ZWRfX9Lbit+NOzUnz
 oYmjx31YfGA5DiHZrCkOmcJBkvlB2dRpOkDUcrByoY+pQwqhoqcLWveV6cUtiaXJTnn6xyZaVbH
 xeY6qYZuFToXX9beljRxQNfR5r6BgNWLeYm6kJA4TDm4llwMm6QS4tdqvcd7inZQpxFl1YQHYlR
 pAab2GSPiUN7RVVQJbuS5vndbYJjZImBMUVaiGmz7je7JcRwBqZe9tUjmLx3z41F/LAWCG/bmqz
 PRbNeAVkq/S21X8A44zSfZGAuQ244F5kWtILaswe+JONpILGcMOZHYNB4TzMEA2fX+zHjpxLYXl
 ZnqQa7nKMx1WBvKTWUDwW3O9Kh+etVcupXngQdwMa7WpnCEIcetEX2Xw0rQDel3lS+yaJRcUETK
 U3sRQTdumKoXHHOI48lBzIsI+7Hx2tsKs7/Ly4TEg5GKwPuq7rwt0wHR5cVBJkUeLe6g0a38
X-Proofpoint-GUID: c4rkPuZRm8ReVNWBbrnuKFwmpBZB24z3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100077

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
index 5a70c42..0784155 100644
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
index 4303cd4..705691a 100644
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
index 689c18d..a87c4cd 100644
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

