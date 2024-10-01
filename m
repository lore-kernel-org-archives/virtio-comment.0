Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5B11BF33F
	for <virtio-comment@lists.linux.dev>; Tue,  1 Oct 2024 11:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727780755; cv=none; b=WsncNn6UzoUG1r//rwW8Q7p1EMVP/8R6hTM0XnJsJlMH8gvmDi9+bDogvO0IJ4uQHoa3iCU42nsc/KUt8zKPkdP6PbMl5kc2tY2KdsPLZ2cA3Omju5qocIDXvKKLR9PkEagvnt6+XE9nU4ciZMtihi69PUlNNixiIVdL7xSa/PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727780755; c=relaxed/simple;
	bh=lUpYoAqUa78zyujw3voKYB2rM+SPEHk2BiQjit9iTd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q80W4P8AWMcfPm5qTiuTASzEUSWq8HjxE9nWU7NaPPl2k+qxzvt0MhWiY+AJcpjsHLA5oNXACqtEQdOe2xk6E/RbF8LzVer6l6amObOgU7H3+CggrW11o3x69/6zuWPoKn/wsYpyUVZu9GHBrsE9fYFtBFuh7/M4bLym5Pkp2BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NT9lH8+V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NT9lH8+V"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491B3tAj023964;
	Tue, 1 Oct 2024 11:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OdAsVcaAH2jNQbSId5RiF6ltk7dTrnpSuKng+HqQsvI=; b=NT9lH8+VlKz46Vzw
	19ZvBKhEjFBaBcIddy838uNDyTA8RY2McxFuVSyc3NTV4WilnauHkkbKt8G/LOhP
	wxcJnXqtFZBEJh9ondccTE8EamtC3suJHJ4nHL8BwhigUcZlP2fRTYW8+Sd76b9F
	OoF2u1RqC4xOOkdOQP/sC8UrBGI6khXrO6CLPinnoii+Z/mBilPQ6URmY1aI4Zdv
	0vI2atNmJqe9b8CVeoZd5tZWhyOJWW+guuM1VTpQ6NQmm7uj9WgKKE+v/3yGC5f5
	S1vXykNN8m8/DyV6Zzw6zb13hevgB/1qtPvHAhIcMgY8T2Jei7ojcn9gSTxoeXPK
	M6tRVA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x9cyg0n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 11:05:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 491B5nUm005394
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Oct 2024 11:05:49 GMT
Received: from [10.111.141.60] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Oct 2024
 04:05:48 -0700
Message-ID: <e6e04b1b-b1cb-41b6-8d9b-69fe79d8494b@quicinc.com>
Date: Tue, 1 Oct 2024 13:05:46 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] content: Reserve ID for media device
To: Parav Pandit <parav@nvidia.com>, Albert Esteve <aesteve@redhat.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        "Aiswarya
 Cyriac" <quic_acyriac@quicinc.com>
CC: "acourbot@chromium.org" <acourbot@chromium.org>
References: <20240906070833.1949727-1-aesteve@redhat.com>
 <CADSE00KO=VZy4_4FfgC7ODON32mZ8khWkPUcXheP6pTiEZAyHA@mail.gmail.com>
 <IA0PR12MB8713CC178EDB984292755C5DDC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <IA0PR12MB87130D5F5839629436E0A748DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Language: en-US
From: Alexander Gordeev <quic_agordeev@quicinc.com>
In-Reply-To: <IA0PR12MB87130D5F5839629436E0A748DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: S_hE7qdsRlVm8jRti_hR5o7SMBb8YXey
X-Proofpoint-ORIG-GUID: S_hE7qdsRlVm8jRti_hR5o7SMBb8YXey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410010072

On 01/10/2024 10:39, Parav Pandit wrote:
> 
> 
>> From: Parav Pandit <parav@nvidia.com>
>> Sent: Tuesday, October 1, 2024 1:35 PM
>> To: Albert Esteve <aesteve@redhat.com>; virtio-comment@lists.linux.dev;
>> aiswarya.cyriac@opensynergy.com
>> Cc: acourbot@chromium.org
>> Subject: RE: [PATCH v3] content: Reserve ID for media device
>>
>> Hi Albert,
>>
>> From: Albert Esteve <aesteve@redhat.com>
>> Sent: Wednesday, September 25, 2024 12:20 PM
>>
>>
>> On Fri, Sep 6, 2024 at 9:08 AM Albert Esteve <mailto:aesteve@redhat.com>
>> wrote:
>> Reserve device ID 49 for media device.
>> Compatible with video encoder, video decoder,
>> and capture devices.
>>
>> Signed-off-by: Albert Esteve <mailto:aesteve@redhat.com>
>> ---
>>  content.tex | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/content.tex b/content.tex
>> index 0a62dce..6d6b3d8 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}
>>  \hline
>>  45         &   SPI master \\
>>  \hline
>> +49         &   Media device \\
>> +\hline
>>  \end{tabular}
>>
>> The id 48 request was made several months ago in May-24 for usb, no further
>> interest has been shown on it.
>> Better to avoid holes in the device id assignment.
>> So id 48 would be better to use for media that has interest.
>> Added virtio-usb proposer to thread to see if it is still interesting, in that case
>> 49 seems good here.
>>
>> Given the voting has started, I am not sure if the real id value matters as long
>> as one of the unique id is reserved.
>>
>> And do not prefer to restart the voting for such a small change either on my
>> late observation of this hole.
>>
>> I think when the maintainer merges the proposed patch to assign id 48,
>> should be fine.
>>
>> Michael,
>> Are you ok this way? Or you have better suggestion?
>>
>> Aishwarya,
>> Is virtio-usb still interesting? If so, can you please request for the vote? So that
>> we avoid the hole in device id assignment.
> I received auto reply from Aishwarya's employer that they are not reachable due to acquisition.
> So not sure if virtio-usb and 48 is still relevant.

Indeed we were acquired by Qualcomm.
AFAIK the work on virtio-usb is ongoing. Aiswarya is on vacation now, she'll be back next week.
I added her new email address.
