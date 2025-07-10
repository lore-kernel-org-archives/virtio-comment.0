Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E465D1F4E4F
	for <virtio-comment@lists.linux.dev>; Thu, 10 Jul 2025 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752138502; cv=none; b=cERLj0t6u2ev5L5hejEt8vfnIN19177gpiWBqsj9D+EAv6CNgfMvHIXwFf38xkqVBf8uihOY82SLwtgGE2YHsA6rJxbkZ/Tu9Ke4TzSt1uYTE8LWITGKLMxJ0KNbzCBStfgVSB7Ia8mlBR7qfPeUBPZrAwQM7hkXZxg4XoqDVYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752138502; c=relaxed/simple;
	bh=afUylsqwktCrFj1/j3T4oT1THv5U8zFWfKjC0dWSax0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AVW2u+GchMqYqgyKrPOI3kKvqqa+MoQ6oPFNSP3JvIYRnIbWOaoinZPbJuJn7roxv+HkkGuSbGj3EyzQ9SZvYZWN4YGsSjnC6G9tnLrbTtobhZstjwtKKQOAcBlcfE2k2XwstcNA7a0lwVlYgYA8vzz+YqdnR/2Q5vhzc5HFZzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CjirxPrt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CjirxPrt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A1QlKC031782;
	Thu, 10 Jul 2025 09:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CGpvL/zToQZOJXAoxLKs/wdk5g7mBWmW6TN+HMSr+Jg=; b=CjirxPrtWV3al+cn
	L4R7tS3A0x20XTU+XhMipq8N6jVRxanEz5PnqV6m+wKjpyQkt/IafgmG/4faB4ND
	ma0F5EUH0iSO+muPLay+xoNWyrHa6KsIRb1zrSDfVWQJEL1j9R25mrpU1UDIrh6K
	DOW10x3zhHnPOZfQk7bXPxRMx5gfIeEjJrCx+fGlRRq9GHLVLL/Dbg3YT6SVy4ij
	5g2fiZNMhCIePlxy82PBFqwwYNOKT4oeaxNjbffb8ViaqrcR3x7ZIb94+hXhdQbQ
	enyrSwbKSeu5kyIizY6HUpxioTqfNhG7aztoT5fQBK0vj6m/F7G5YZFeT10EpNVQ
	ETt5Hg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qxxsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 09:08:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56A98Gc1027846
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 09:08:16 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 02:08:13 -0700
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
Subject: [PATCH v10 2/4] virtio-rtc: Add initial normative statements
Date: Thu, 10 Jul 2025 11:06:47 +0200
Message-ID: <20250710090648.1711-4-quic_philber@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3NyBTYWx0ZWRfX11Ag0ZUVAIVF
 pHrkKqHJ9+KN5BVpYXXclqs7/CjEoyEXIA0jSfXuFfomPF81LdnCQ4BDE0EsIQAzJoFBT0VxC76
 MmQKW69QeeLbfbRBVFXjD6IQ4dGfjBCaHrJHmLlkG5yiCADp1uhR/WfwXUCIjI8Bexu0aE+QYxy
 FjAkgWRTpVYmy6il4o5OA1MODWXDP2IpSmZ5dTB/VjiMhVgCqLrBV2RHnJzLbPZYYdATIp28+ri
 nZKm0/dOQbakTl4iqAROCCMAxR9644OoUqkOjUuER7KtYb8rsXspm4n3yCKPo4AGhZTTNyJ4Cbx
 bmrY62LOiyezpYPqF8EM3Vf8z0GfQRSngRG/usoDiUlbmGQ336wvvBtUN7rQBdDNV2NnXftkSbK
 tnWWe+AHpUh2CR7uGLvSxSe3yqonBfGEyrDNr3AVjcrTyB3sVTC5H8779fC6Juuh8BR/WwIh
X-Proofpoint-GUID: V3l93SH1_DRZuRlN8FQaL2Zhvx9EtSLd
X-Proofpoint-ORIG-GUID: V3l93SH1_DRZuRlN8FQaL2Zhvx9EtSLd
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686f8301 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=bs-e4Z8cAAAA:8
 a=COk6AnOGAAAA:8 a=Ujpo1pBEyZaqQKVwKacA:9 a=YFpLQiK6rFjqGb8m0bXF:22
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

Add the normative statements for the initial device specification.

Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
---

Notes:
    v10:
    
    - Add RTC clauses to the "Conformance Targets" section.
    
    - Fix merge conflicts with recently merged virtio-media device.
    
    v9:
    
    - Allow more implementation-specific behavior when alarm actions become
      obsolete (Matias Ezequiel Vara Larsen).
    
    - Reword multiple sentences (Matias Ezequiel Vara Larsen).
    
    - Change "feature was negotiated" to "feature has been negotiated"
      (Matias Ezequiel Vara Larsen).
    
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

 conformance.tex                         |  12 +-
 device-types/rtc/description.tex        | 269 ++++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |   9 +
 device-types/rtc/driver-conformance.tex |   9 +
 4 files changed, 295 insertions(+), 4 deletions(-)
 create mode 100644 device-types/rtc/device-conformance.tex
 create mode 100644 device-types/rtc/driver-conformance.tex

diff --git a/conformance.tex b/conformance.tex
index 85a227f..fb16c16 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -35,8 +35,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / CAN Driver Conformance},
-\ref{sec:Conformance / Driver Conformance / SPI Controller Driver Conformance} or
-\ref{sec:Conformance / Driver Conformance / Media Driver Conformance}.
+\ref{sec:Conformance / Driver Conformance / SPI Controller Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / Media Driver Conformance} or
+\ref{sec:Conformance / Driver Conformance / RTC Driver Conformance}.
 
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
   \end{itemize}
@@ -65,8 +66,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \ref{sec:Conformance / Device Conformance / GPIO Device Conformance},
 \ref{sec:Conformance / Device Conformance / PMEM Device Conformance},
 \ref{sec:Conformance / Device Conformance / CAN Device Conformance},
-\ref{sec:Conformance / Device Conformance / SPI Controller Device Conformance} or
-\ref{sec:Conformance / Device Conformance / Media Device Conformance}.
+\ref{sec:Conformance / Device Conformance / SPI Controller Device Conformance},
+\ref{sec:Conformance / Device Conformance / Media Device Conformance} or
+\ref{sec:Conformance / Device Conformance / RTC Device Conformance}.
 
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
   \end{itemize}
@@ -165,6 +167,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/can/driver-conformance.tex}
 \input{device-types/spi/driver-conformance.tex}
 \input{device-types/media/driver-conformance.tex}
+\input{device-types/rtc/driver-conformance.tex}
 
 \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
 
@@ -258,6 +261,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/can/device-conformance.tex}
 \input{device-types/spi/device-conformance.tex}
 \input{device-types/media/device-conformance.tex}
+\input{device-types/rtc/device-conformance.tex}
 
 \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
 A conformant implementation MUST be either transitional or
diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
index ae4b302..3339bec 100644
--- a/device-types/rtc/description.tex
+++ b/device-types/rtc/description.tex
@@ -99,6 +99,110 @@ \subsection{Device Operation}\label{sec:Device Types / RTC Device / Device Opera
 zero-based, dense indices. In request structures, all fields named
 \field{clock_id} contain clock identifiers.
 
+\drivernormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
+
+The driver MUST interpret response fields other than the \field{struct
+virtio_rtc_resp_head} field \field{status} only when \field{status} is
+VIRTIO_RTC_S_OK.
+
+The driver MUST set \emph{reserved} fields in a device-readable buffer
+to zero.
+
+The driver MUST NOT set bits in \emph{flags} fields in a device-readable
+buffer which are not allowed according to the negotiated features.
+
+The driver MUST NOT interpret \emph{reserved} fields in a
+device-writable buffer.
+
+The driver MUST only interpret these bits in \emph{flags} fields in a
+device-writable buffer which are allowed according to the negotiated
+features.
+
+The driver MUST allocate enough space for the response in a
+device-writable requestq buffer.
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
+\field{status} field to VIRTIO_RTC_S_EINVAL if the request specified in
+the request header through the \field{msg_type} field does not fit into
+the device read-only buffer.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EINVAL if the response specified in
+the request header through the \field{msg_type} field does not fit into
+the device write-only buffer, unless the \field{status} field does not
+fit into the device write-only buffer.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST NOT set the
+\field{status} field if the \field{status} field does not fit into the
+device write-only buffer.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EIO if none of the previous
+requirements in this document stipulated another \field{status}.
+
+If the device read-only buffer is bigger than the size of the request
+specified in the request header, the device MUST ignore the additional
+space.
+
+If the device write-only buffer is bigger than the size of the response
+corresponding to the request header, the device MUST ignore the
+additional space.
+
+The device MUST set \emph{reserved} fields in a device-writable buffer
+to zero.
+
+The device MUST NOT set bits in \emph{flags} fields in a device-writable
+buffer which are not allowed according to the negotiated features.
+
+During any period where the device remains live (keeps the DRIVER_OK
+\field{device status} bit set), the device MUST emit the same response
+for all repetitions of any specific request of type VIRTIO_RTC_REQ_CFG,
+VIRTIO_RTC_REQ_CLOCK_CAP, or VIRTIO_RTC_REQ_CROSS_CAP.
+
+Whenever the device has a specific set of negotiated features, the
+device SHOULD emit the same response for all repetitions of any specific
+request of type VIRTIO_RTC_REQ_CFG, VIRTIO_RTC_REQ_CLOCK_CAP, or
+VIRTIO_RTC_REQ_CROSS_CAP, irrespective of any intermediate device
+resets.\footnote{Failure to do so would interfere with resuming from
+suspend and error recovery.}
+
+The device MUST use non-negative integers, which are smaller than the
+number of clocks, as clock identifiers.
+
 \subsubsection{Common Definitions}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions}
 
 This section makes common definitions.
@@ -320,6 +424,102 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
 
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
+VIRTIO_RTC_CLOCK_UTC_SMEARED, the device MUST set the
+\field{leap_second_smearing} field to VIRTIO_RTC_SMEAR_UNSPECIFIED.
+
+For VIRTIO_RTC_REQ_CLOCK_CAP, and clock type
+VIRTIO_RTC_CLOCK_UTC_SMEARED, the device MUST set the
+\field{leap_second_smearing} field to VIRTIO_RTC_SMEAR_UNSPECIFIED,
+VIRTIO_RTC_SMEAR_NOON_LINEAR, VIRTIO_RTC_SMEAR_UTC_SLS, or to a value
+greater than or equal to 0xF0.
+
+The device SHOULD set the VIRTIO_RTC_FLAG_CROSS_CAP flag in the
+VIRTIO_RTC_REQ_CROSS_CAP response if and only if the device would set
+status VIRTIO_RTC_S_OK for a VIRTIO_RTC_REQ_READ_CROSS response with the
+same \field{hw_counter} and \field{clock_id} request values.
+
 \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Operation / Read Requests}
 
 Through \emph{read requests}, the driver requests clock readings from
@@ -436,3 +636,72 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
 \ref{sec:Device Types / RTC Device / Device Operation / Common Definitions / Hardware Counters}.
 
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
+After DRIVER_OK has been set, the device SHOULD continuously support
+reading of all clocks.
+
+For any two read requests to the same clock, the device MUST either
+obtain the \field{clock_reading} response value for the request which
+the driver makes available first before obtaining the
+\field{clock_reading} response value for the other request, or the
+device MUST return the same \field{clock_reading} values.
+
+For any clock C, the device MUST mark all read requests reading C as
+used in the total order in which the driver marked these requests as
+available.
+
+For any clock C of type VIRTIO_RTC_CLOCK_MONOTONIC and read requests
+\emph{A} and \emph{B} which read C, \emph{A} being the request which the
+driver marks as available before \emph{B}, the device MUST set the
+\field{clock_reading} response value for request \emph{B} to a value
+greater than or equal to the \field{clock_reading} response value for
+request \emph{A}.
+
+For every clock, the device MUST support VIRTIO_RTC_REQ_READ.
+
+For VIRTIO_RTC_REQ_READ and for any clock type listed in this
+specification, the device MUST use the nanosecond as unit for the
+\field{clock_reading} field.
+
+For read requests, the device MUST obtain the \field{clock_reading}
+response value after the driver made the read request available.
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
+If two VIRTIO_RTC_REQ_READ_CROSS requests read the same clock and the
+same hardware counter, and one request is made available before the
+other, the device MUST either
+
+\begin{itemize}
+\item set the later request's \field{counter_cycles} response to a value
+that the hardware counter shows after the earlier request's
+\field{counter_cycles} response, or
+
+\item set the same \field{counter_cycles} value in both responses.
+\end{itemize}
+
+For VIRTIO_RTC_REQ_READ_CROSS and for any clock type listed in this
+specification, the device MUST use the nanosecond as unit for the
+\field{clock_reading} field.
diff --git a/device-types/rtc/device-conformance.tex b/device-types/rtc/device-conformance.tex
new file mode 100644
index 0000000..4303cd4
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
index 0000000..689c18d
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

