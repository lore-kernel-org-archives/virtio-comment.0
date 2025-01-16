Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AC41DE2B8
	for <virtio-comment@lists.linux.dev>; Thu, 16 Jan 2025 11:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737027539; cv=none; b=oiwZbY2NL73v8vnPRQVEHnEMK4cid0nPuhKLyDT+Akdf1R0dMXeM/AbNlaXuch/Apc8jfV81jsgLQXoUCZ4T9KLw4PT+OAULfso+Agva0uUJz+bVKwXMkWsULzAV5cHcgb/nN1vFxh4gKdq7hrrOruxKUUTjl2bJf0DDwi5sLK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737027539; c=relaxed/simple;
	bh=D3YearrWHUM2JC8eGMrSln1A3szilOp6AQif4LNC/S8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/R/kIgjbYSx5u6o9Oz5fI5CjKZXNYkvO0VJ+f4WdSq0WeBPxQ2jMuZOofUACK5c0zXsf+WsvB4peDj+hVLr/XjMshHWKcsYU4wh5iYux/BkJOXAL2t8JP8PX0bE3vsP6RTD6DO3d0riiDg1hWmOaKO987NxnZW1g3F+Z5yFZg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kxX/9Tzj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kxX/9Tzj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G9DUbk005424;
	Thu, 16 Jan 2025 11:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BukSGdJjbcA6EucA4XuJsbEY
	4nwc4MT2nsqNRV5+O+E=; b=kxX/9TzjDIuATCKMEQOeKDv1X7f3NtTXdkKAyun+
	Ad72mqIXb9bT+jQbozijgO9lEdGpFZg+jSLO7BPlanuHA5HRUZDtW2rZaxGw7TCp
	zudTIk1dZrCsIvHYE2YjSY923OiYFP4A/JI3FHdzj8UWRGsdNxHD5t9JNXy8s+ON
	d5ZdQh3QP91Du+9Qd2Xj8Q7fmm47pll7CyILWJroiIIja7RSp2nMaVT1BRJqB0rZ
	jWXjm2+qDaDc4bXhXwiqVPmlsJCQMb8GpFyrjzeFCfB9fsFtn3zI0vXNYBjX2lwh
	qPkWd2SPa0CXk33QP7emvGgUT8Wg0hUg5pqHHUoAncNKGA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446y9wgcx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 11:38:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50GBcm8L011757
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 11:38:48 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 Jan 2025 03:38:46 -0800
Date: Thu, 16 Jan 2025 12:38:43 +0100
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
 Vaddagiri" <quic_svaddagi@quicinc.com>
Subject: Re: [RFC PATCH v6 0/4] virtio-rtc: Add device specification
Message-ID: <q44ssnsrxlz6uaoudzamiqgnkbmq6rbknipfp77vechwto44wj@ihouwl6zpdct>
References: <20241206094819.858-1-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241206094819.858-1-quic_philber@quicinc.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1x_zcUbAArT5S1x_r1UM8I8d7XEJQSid
X-Proofpoint-ORIG-GUID: 1x_zcUbAArT5S1x_r1UM8I8d7XEJQSid
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_05,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=788 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 adultscore=0 mlxscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160087

On Fri, Dec 06, 2024 at 10:48:15AM +0100, Peter Hilber wrote:
> This iteration of the virtio-rtc RFC spec revises the leap second
> support some more. In cases where leap seconds are smeared (or might be
> smeared), the driver might not care about the particular smearing
> algorithm, and the time during which smearing will be applied.
> Therefore, make the leap second status information optional for such
> clocks. The compatibility with vmclock [3] is not affected.
> 

In the meantime, the v4 Linux kernel driver, implementing the v6 spec,
has been published.  To expose the leap second status and the
performance metrics to user space, a patch series for the driver
proposed a UAPI extension [4].  Unfortunately, the response to the UAPI
extension has been negative so far, leaving no good interface to user
space.

Therefore, I intend to remove the leap second status and performance
metrics from the next iteration of the spec. This basically means
removing the .leap_info and .perf fields from struct
virtio_rtc_resp_read_cross, and removing the definitions for the fields.
The clock types, and the compatibility with the vmclock device [5], are
not affected by this.

I also plan to remove the "RFC" from the next iteration of the spec,
since the remainder has not changed a lot lately.

Peter

[4] https://lore.kernel.org/lkml/20241219204208.3160-1-quic_philber@quicinc.com/
[5] https://lore.kernel.org/lkml/ZwQHtD5lVNuc4aAf@hoboy.vegasvil.org/T/
