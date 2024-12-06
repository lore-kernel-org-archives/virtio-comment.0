Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BD31EE033
	for <virtio-comment@lists.linux.dev>; Fri,  6 Dec 2024 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478534; cv=none; b=RP1b+IVw8F231wek2KZXSoEgNLpMxOylCNO44c0J1wxiflqhKtO/dJzvzTGEfnOVkjbbAgC39ENh5xN56Dl7oS7QIw6hfDLYTAbobhPV6bIDt+WTLlBD9bNTkVeMLhuFDxFiTfoNCWqFxA4mAu2ULxWLZU196LkyemSaMT9dhv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478534; c=relaxed/simple;
	bh=2oaBMzrOw6Ug/E+fxVhAAOooSPzzhoQ+LwT7uACrcfQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SrOCKCPnJU81TROk9UZ03drClqZ3MUAFuiICIEBh5gJ6W+o3APo4QjQ7SSh+hHEbLCOEfqVx2UsZmqeB2bMRRhDp/jmOeKolxLlFPIL+Gozue0ADiw9OvShsWMdAzJyynckQLVvtd1GXAe70onBHI6+5C/MSz5BbkeECRw6WMBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NnUmc3Fa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NnUmc3Fa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B678SSu031095;
	Fri, 6 Dec 2024 09:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	59UEKweGBbKSQzV7kAyDLkY8g6SP137hCx2hg+nCj3o=; b=NnUmc3FaRdXvbYXS
	pzg5zW1fMfY97y8zpDJXkKNoS1K7FMKsyUfRfyYJelRKjNEshNDmQDnwMFjMXrym
	yO9MGSbQjoIwGEb1m96YC9gzg5V1yxKlK8srlyqKm6j27qKZB/RtMD9uQ873IJVy
	FcGO/lJtjZ1aHUUhUkJ/a26dufgEfQbP4eSpgF8pwTV7X91aKYUi+mCMY5dAtZGP
	U2dk49S0+dLv5JsTvu5gpInGI06xUC6uQSpjUxUKyqBhf9nq2RoH5ncnlaQAolHP
	e9EtrqikKyCkpTXFRwJLY696BQC7CKOC+LJn2tOu5kkXnLgNHtLbyJjS+Vi4aeEv
	u0eSew==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43be172qxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 09:48:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B69mjgD011928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 09:48:45 GMT
Received: from PHILBER.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 01:48:42 -0800
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
Subject: [RFC PATCH v6 2/4] virtio-rtc: Add initial normative statements
Date: Fri, 6 Dec 2024 10:48:17 +0100
Message-ID: <20241206094819.858-3-quic_philber@quicinc.com>
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
X-Proofpoint-GUID: XIMMZOSteJxQSFF0M-YzVO9X1a-15Eh-
X-Proofpoint-ORIG-GUID: XIMMZOSteJxQSFF0M-YzVO9X1a-15Eh-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060071

Add the normative statements for the initial device specification.

Normative requirements for the following still need to be added:

- Leap second indication for cross-timestamps.

- Clock performance information for cross-timestamps.

Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
---

Notes:
    v6:
    
    - Update requirements to make leap second status information optional if
      if the clock smears (or might smear) leap seconds.
    
    - Allow indicating VIRTIO_RTC_SMEAR_UNSPECIFIED for
      VIRTIO_RTC_CLOCK_SMEARED.
    
    - Shorten some requirements by omitting redundant information.
    
    v5:
    
    - Update normative statements to match v5 changes to non-normative
      statements (patch 1).
    
    v4:
    
    - Require driver to set unused flags to zero.
    
    - Update normative statements to match v4 changes to non-normative
      statements (patch 1).
    
    - Improve formatting.

 conformance.tex                         |   2 +
 device-types/rtc/description.tex        | 285 ++++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |   9 +
 device-types/rtc/driver-conformance.tex |   9 +
 4 files changed, 305 insertions(+)
 create mode 100644 device-types/rtc/device-conformance.tex
 create mode 100644 device-types/rtc/driver-conformance.tex

diff --git a/conformance.tex b/conformance.tex
index d92a2369488e..4ce86a525e84 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -162,6 +162,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/pmem/driver-conformance.tex}
 \input{device-types/can/driver-conformance.tex}
 \input{device-types/spi/driver-conformance.tex}
+\input{device-types/rtc/driver-conformance.tex}
 
 \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
 
@@ -254,6 +255,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/pmem/device-conformance.tex}
 \input{device-types/can/device-conformance.tex}
 \input{device-types/spi/device-conformance.tex}
+\input{device-types/rtc/device-conformance.tex}
 
 \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
 A conformant implementation MUST be either transitional or
diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
index dd9ebe0c81c6..f83ee25e6b94 100644
--- a/device-types/rtc/description.tex
+++ b/device-types/rtc/description.tex
@@ -98,6 +98,111 @@ \subsection{Device Operation}\label{sec:Device Types / RTC Device / Device Opera
 zero-based, dense indices. All fields named \field{clock_id} contain
 clock identifiers.
 
+\drivernormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
+
+If the \field{struct virtio_rtc_resp_head} field \field{status} is not
+VIRTIO_RTC_S_OK, the driver MUST NOT interpret response fields other
+than \field{status}.
+
+The driver MUST set \emph{reserved} fields in the device-readable part
+of the message to zero.
+
+The driver MUST set unnamed bits in \emph{flags} fields in the
+device-readable part of the message to zero.
+
+The driver MUST NOT interpret \emph{reserved} fields in the
+device-writable part of the message.
+
+The driver MUST NOT interpret unnamed bits in \emph{flags} fields in the
+device-writable part of the message.
+
+The driver MUST put the request into the device-readable part of the
+message.
+
+The driver MUST allocate enough space for the response in the
+device-writable part of a requestq message.
+
+\devicenormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_OK if the device successfully
+executed the request.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to a status other than VIRTIO_RTC_S_OK if the
+device did not successfully execute the request.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EOPNOTSUPP if the device could not
+execute the specific request due to an implementation limitation.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EOPNOTSUPP for a request with a
+value of the \field{msg_type} field which is not described in this
+specification.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EOPNOTSUPP for a request with a
+value of the \field{hw_counter} field which is neither described in this
+specification nor otherwise known to the implementation.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_ENODEV if the \field{clock_id}
+field value supplied with the request does not identify a clock.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EINVAL if the request values are
+inconsistent with the specification and if the inconsistence is not
+described by the requirements which stipulate status
+VIRTIO_RTC_S_EOPNOTSUPP or VIRTIO_RTC_S_ENODEV.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EINVAL if the device read-only part
+of the message is too small.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EINVAL if the device write-only
+part of the message is too small, unless the \field{status} field does
+not fit into the device write-only part.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST NOT set the
+\field{status} field if the \field{status} field does not fit into the
+device write-only part.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EIO if none of the previous
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
+The device MUST set unnamed bits in \emph{flags} fields in the
+device-writable part of the message to zero.
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
+For a fixed request value V, the device SHOULD either, for every request
+with value V, always execute successfully, or, for every request with
+value V, always set a fixed \field{status} other than VIRTIO_RTC_S_OK.
+
 \subsubsection{Common Definitions}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions}
 
 This section makes common definitions.
@@ -472,6 +577,119 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
 
 \end{description}
 
+\drivernormative{\paragraph}{Control Requests}{Device Types / RTC Device / Device Operation / Control Requests}
+
+For VIRTIO_RTC_REQ_CROSS_CAP, the driver MUST set \field{hw_counter} to
+one of the hardware counter identifiers defined in this specification,
+or to a value between 0xF0 and 0xFE.
+
+\devicenormative{\paragraph}{Control Requests}{Device Types / RTC Device / Device Operation / Control Requests}
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST use the UTC
+time standard (Coordinated Universal Time).
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC_SMEARED or
+VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED, the device MUST use the UTC time
+standard, insofar as the following requirements do not say otherwise.
+
+For any UTC-like clock, the device MUST use the time epoch of January 1,
+1970, 00:00 UTC.
+
+For any UTC-like clock, the device MUST count seconds since the epoch
+according to \hyperref[intro:EPOCH]{EPOCH}.
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST apply a
+positive leap second according to the UTC time standard by
+instantaneously stepping the clock backwards by 1 s at the start of the
+leap second.
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST apply a
+negative leap second according to the UTC time standard by
+instantaneously stepping the clock forward by 1 s at the start of the
+leap second.
+
+For any leap smearing clock, the device MUST NOT step the clock due to a
+leap second.
+
+For any leap smearing clock, on a positive leap second, the device MUST
+slow down the clock during part of the day containing the leap second
+and/or part of the day after the leap second.
+
+For any leap smearing clock, on a negative leap second, the device MUST
+speed up the clock during part of the day containing the leap second
+and/or part of the day after the leap second.
+
+For any clock with smearing variant VIRTIO_RTC_SMEAR_NOON_LINEAR, on a
+leap second, the device MUST change the frequency of the clock exactly
+from noon prior to the leap second until noon after the leap second.
+
+For any clock with smearing variant VIRTIO_RTC_SMEAR_NOON_LINEAR, while
+changing the frequency of the clock due to a positive leap second, the
+device MUST decrease the frequency of the clock by $1/86400$.
+
+For any clock with smearing variant VIRTIO_RTC_SMEAR_NOON_LINEAR, while
+changing the frequency of the clock due to a negative leap second, the
+device MUST increase the frequency of the clock by $1/86400$.
+
+For any clock with smearing variant VIRTIO_RTC_SMEAR_UTC_SLS, on a leap
+second, the device MUST change the frequency of the clock exactly during
+the last 1000 seconds of the day with the leap second.
+
+For any clock with smearing variant VIRTIO_RTC_SMEAR_UTC_SLS, while
+changing the frequency of the clock due to a positive leap second, the
+device MUST decrease the frequency of the clock by 0.1\%.
+
+For any clock with smearing variant VIRTIO_RTC_SMEAR_UTC_SLS, while
+changing the frequency of the clock due to a negative leap second, the
+device MUST increase the frequency of the clock by 0.1\%.
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED, the device MAY
+deviate from the UTC standard with respect to leap second introduction.
+
+For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the TAI
+time standard (International Atomic Time).
+
+For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the time
+epoch of January 1, 1970, 00:00 TAI.
+
+For any clock of type VIRTIO_RTC_CLOCK_MONOTONIC, the device MUST use SI
+seconds subdivisions.
+
+For any clock of type VIRTIO_RTC_CLOCK_MONOTONIC, the device MUST use an
+epoch at a time instant before or during device reset.
+
+For VIRTIO_RTC_REQ_CLOCK_CAP, and clock types other than
+VIRTIO_RTC_CLOCK_UTC_SMEARED, the device MUST set field
+\field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED.
+
+For VIRTIO_RTC_REQ_CLOCK_CAP, and clock type
+VIRTIO_RTC_CLOCK_UTC_SMEARED, the device MUST set field
+\field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED,
+VIRTIO_RTC_SMEAR_NOON_LINEAR, VIRTIO_RTC_SMEAR_UTC_SLS, or to a value
+greater than or equal to 0xF0.
+
+For VIRTIO_RTC_REQ_CLOCK_CAP, the device MUST set flag
+VIRTIO_RTC_FLAG_LEAP_CAP in field \field{flags} if the respective
+UTC-like clock will indicate all leap seconds, and clear the flag
+otherwise.
+
+For VIRTIO_RTC_REQ_CLOCK_CAP, the device MUST set the flag
+VIRTIO_RTC_FLAG_TAI_OFFSET_CAP in field \field{flags} if the respective
+UTC-like clock will always indicate the offset of the UTC standard to
+TAI, and clear the flag otherwise.
+
+For VIRTIO_RTC_REQ_CLOCK_CAP, the device MUST set the flag
+VIRTIO_RTC_FLAG_SMEAR_OFFSET_CAP in field \field{flags} if the
+respective UTC-like clock will always indicate the offset of the clock
+from the UTC standard while the clock is smearing time in the vicinity
+of a leap second.
+
+For a VIRTIO_RTC_REQ_CROSS_CAP message M, the device MUST set the
+VIRTIO_RTC_FLAG_CROSS_CAP flag in the \field{flags} field if the device
+would respond to a VIRTIO_RTC_REQ_READ_CROSS message with the same
+\field{hw_counter} and \field{clock_id} values as in M with status
+VIRTIO_RTC_S_OK, and clear the flag otherwise.
+
 \subsubsection{Data Structures}
 
 This section describes data structures.
@@ -724,3 +942,70 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
 \ref{sec:Device Types / RTC Device / Device Operation / Data Structures / Clock Performance Information}.
 
 \end{description}
+
+\drivernormative{\paragraph}{Read Requests}{Device Types / RTC Device / Device Operation / Read Requests}
+
+For VIRTIO_RTC_REQ_READ_CROSS, the driver MUST set \field{hw_counter} to
+one of the hardware counter identifiers defined in this specification,
+or to a value between 0xF0 and 0xFE.
+
+\devicenormative{\paragraph}{Read Requests}{Device Types / RTC Device / Device Operation / Read Requests}
+
+The device SHOULD continuously support reading of all clocks once
+DRIVER_OK has been set.
+
+For any clock C and read requests \emph{A} and \emph{B} which read C,
+\emph{A} being the message which the driver marks as available before
+\emph{B}, the device MUST obtain the \field{clock_reading} value for the
+message \emph{A} response before the \field{clock_reading} value for the
+message \emph{B} response, or the device MUST obtain the same
+\field{clock_reading} value for both \emph{A} and \emph{B}.
+
+For any clock C, the device MUST mark all read requests reading C as
+used in the total order in which the driver marked these messages as
+available.
+
+For any clock C of type VIRTIO_RTC_CLOCK_MONOTONIC and read requests
+\emph{A} and \emph{B} which read C, \emph{A} being the message which the
+driver marks as available before \emph{B}, the device MUST set the
+\field{clock_reading} value for the message \emph{B} response to a value
+greater than or equal to the \field{clock_reading} value for the message
+\emph{A} response.
+
+The device MUST support VIRTIO_RTC_REQ_READ for every clock.
+
+For VIRTIO_RTC_REQ_READ and for any clock type listed in this
+specification, the device MUST use the nanosecond as unit for field
+\field{clock_reading}.
+
+For read requests, the device MUST obtain the \field{clock_reading}
+response value after the read request is marked as available.
+
+For VIRTIO_RTC_REQ_READ_CROSS, the device MUST set
+\field{counter_cycles} to a value which approximates the value which the
+driver would have read from the hardware counter identified by
+\field{hw_counter} at the time instant when the device read the
+\field{clock_reading} value.
+
+For VIRTIO_RTC_REQ_READ_CROSS, the device SHOULD assume that the driver
+reads the hardware counter identified by \field{hw_counter} through the
+CPU which the driver enumerates as the first.
+
+For VIRTIO_RTC_REQ_READ_CROSS, the device MUST set \field{status} to a
+value other than VIRTIO_RTC_S_OK if the device cannot determine the
+approximate value which the driver would have read from the hardware
+counter identified by \field{hw_counter} at the time instant when the
+device read the \field{clock_reading} value.
+
+For any clock C, and VIRTIO_RTC_REQ_READ_CROSS messages \emph{A} and
+\emph{B} which read C and which specify the same hardware counter
+\emph{H} through field \field{hw_counter}, \emph{A} being the message
+which the driver marks as available before \emph{B}, the device MUST set
+the \field{counter_cycles} value for \emph{B} to a value which \emph{H}
+shows after the \field{counter_cycles} value of \emph{A}, or the device
+MUST set the same \field{counter_cycles} value for \emph{A} and
+\emph{B}.
+
+For VIRTIO_RTC_REQ_READ_CROSS and for any clock type listed in
+this specification, the device MUST use the nanosecond as unit for
+field \field{clock_reading}.
diff --git a/device-types/rtc/device-conformance.tex b/device-types/rtc/device-conformance.tex
new file mode 100644
index 000000000000..4303cd450542
--- /dev/null
+++ b/device-types/rtc/device-conformance.tex
@@ -0,0 +1,9 @@
+\conformance{\subsection}{RTC Device Conformance}\label{sec:Conformance / Device Conformance / RTC Device Conformance}
+
+An RTC device MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Control Requests}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Read Requests}
+\end{itemize}
diff --git a/device-types/rtc/driver-conformance.tex b/device-types/rtc/driver-conformance.tex
new file mode 100644
index 000000000000..689c18d158d0
--- /dev/null
+++ b/device-types/rtc/driver-conformance.tex
@@ -0,0 +1,9 @@
+\conformance{\subsection}{RTC Driver Conformance}\label{sec:Conformance / Driver Conformance / RTC Driver Conformance}
+
+An RTC driver MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Control Requests}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Read Requests}
+\end{itemize}
-- 
2.43.0

