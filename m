Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CD7296D16
	for <virtio-comment@lists.linux.dev>; Tue, 15 Apr 2025 12:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744721196; cv=none; b=JgeHETJVginwZQ0wo9r5NdXSCW/fOc19xZTxUwYY6kSI8ILuXAw25iL0LOp1qpd4nCdZWDsVuJkosmlUhwFcz/CNbuXSAn18zxbzExN+Gupv9bA/O862YRqhfyA203901FYJuFDindgDafDLkacrWzzGi318SukUfMp05ruUJoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744721196; c=relaxed/simple;
	bh=QJULe39SX6TPLPxs5JvCOfL0na0RIDe6gTZmUcx2U8w=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jygoeuS2v6AHVv+em8DRi/tmjqg7Y+Fs/JfCQPhzxVf+3Og34mw/jpiiyO6XbX1ssotDUKlnpmUFHL7lz7g5bYXHLPUV2PQVfjeXJev1MWetqMQp1+pAjE9tFaK31XmYvQLRI16WWIHHl10UKvE1qiNdRHzgN9u7CzdeU3HdCcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R8pLNQKS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R8pLNQKS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tG4Z012563;
	Tue, 15 Apr 2025 12:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=luaxr/bKvlRmbjs82hqOBaZU
	onJAn09I7SG+M1sa/l4=; b=R8pLNQKSiO4bu2/m/iuqR6WG6NsBzfex+F9GQ3vC
	18DCqk9q6E73dsxDcrfZtx9YL6xr7GgfFsKEvraPgSkHgJHl+OzUQUuNipmuWBYx
	9ySxXlCifriZ4PyNK4kMerKEReuuBFGBeOxAl5lVa02qrUiN/K3t0y3bWq9uweBV
	u6jZmnSQenTDNF41CeUs6vFPIi+w4kKNAbDlita++qCZt8cY2ZX2l/f42YpJ/yRR
	7BHDYJK1qf4fBKrH0R2kf1cWDgn2rHD25Yzm8g+/23w4RRLftDnf3lZZxuN+/qBt
	HU5/m5ydCJLKAq1WkZTeY0QQmZ0Z7TX3cUTVktNmP8pkSQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq8bgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 12:46:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53FCkLhS008414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 12:46:21 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Apr 2025 05:46:19 -0700
Date: Tue, 15 Apr 2025 14:46:16 +0200
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
 Ezequiel Vara Larsen" <mvaralar@redhat.com>
Subject: Re: [PATCH v8 0/4] virtio-rtc: Add device specification
Message-ID: <lx6uov4b4gvvi4n7vhz4i2kaa7mxhplrkkzmohcsxpfc5sckdl@3lv4n3u4d4oo>
References: <20250306095112.1293-1-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250306095112.1293-1-quic_philber@quicinc.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8OVrSBMImBmThoH5dOAvcYzoVxwfBc9K
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67fe551e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=z_VWhMTPAWRYM-85L9wA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 8OVrSBMImBmThoH5dOAvcYzoVxwfBc9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=939
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150091

On Thu, Mar 06, 2025 at 10:51:08AM +0100, Peter Hilber wrote:
> This iteration of the spec should address multiple review findings from
> Matias Ezequiel Vara Larsen.
> 
> Summary
> -------
> 
> The RTC (Real Time Clock) device provides information about current
> time. The device can provide different clocks, for the UTC or TAI time
> standards, or for physical time elapsed since some past epoch. For UTC
> clocks, the device can also indicate how leap seconds are handled. The
> driver can read the clocks with simple or more accurate methods.
> Optionally, the driver can set an alarm.
> 

Could you please open a voting ballot for these changes?

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/221

This version of the patch series should have addressed all issues raised
so far. Since posting it 5 weeks ago, there has been no additional
feedback.

Best regards,

Peter
