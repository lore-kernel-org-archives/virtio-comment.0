Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E3C1F1310
	for <virtio-comment@lists.linux.dev>; Fri, 27 Dec 2024 11:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735298049; cv=none; b=O5lstALttt23y2UpeIOyawto4H+QGtVoKHwbN01rj///gycS6IdRbe2kAv40BHWt8wiCCoTcUKDRAl4UO1U796uvmrQTJhs851otbC96fKv8JOY9ulT9Di5Q0rG1a2Cf+/isRbs4MLaTGnFBX2jLC9t9QwOXahSyxGm6mBVmqc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735298049; c=relaxed/simple;
	bh=c71iIeuFXnTfQ27B6yEL6JK7ZKfjRTzJck0raaQrP58=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q924JRlarrMoUaylA1hdlGBSQnt/ywL26oss+u7TlQSFaW92A2oHkfs0+cBWekjwa0tDzTGE1oYjRUb+Ir+XufCdeURC2ofD/II328ftK2fhsZj4+A35IL2483ucN6CERlfbwt+7V8U7EVB+bYaxd9y+0zvogUfPiMMGZxZzoJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gDypa8fh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gDypa8fh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR7ggb0009571;
	Fri, 27 Dec 2024 11:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Mf9HtGHyRdCycFYd3446j9hbFltAHrK3D7c1HTvJFA=; b=gDypa8fhjyAInJeG
	dgcK2fjp8+RRO28w16XuHYcgDoNntSpnmnBr4vMPsMgggbDtSJTLvwgMvuxJF4n+
	UjAQGkVdNoejnwPhcfq7fZwf3gzOKrABRty8+oaXJf2cUL0LMqCZnfFhU2phbScH
	NB10mPWN7jfwm+QGzqGzjEhHb4tz7yydw4w8ptGztVYCNcxuOi1iQzvuwXpdnZT2
	wvb9vdj80hCfz7UnxH040G+ALbYJLa3FZkvvNx/TKVYFai5oRNE2szbdTEWf/z7U
	TrWWcC29PxqsUoVSkQiGvBm0JjdLHEKe0MCnz+ddqf9qd9S35vOb4FRw0LdGu5ef
	SOkQQQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43sr3b900e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 11:14:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BRBE6xm012831
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 11:14:06 GMT
Received: from [10.111.128.138] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Dec
 2024 03:14:05 -0800
Message-ID: <10122ce0-25e4-456a-afd0-b8c13d732450@quicinc.com>
Date: Fri, 27 Dec 2024 12:14:03 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: virtio-video device IDs
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: <virtio-comment@lists.linux.dev>, Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
References: <bbef01ea-2085-49a8-bc6a-76cf66a6183d@quicinc.com>
 <20241223055543-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Alexander Gordeev <quic_agordeev@quicinc.com>
In-Reply-To: <20241223055543-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YGvZ8XxpzKRvFAXdpOdZ5zPReHFkXjq7
X-Proofpoint-ORIG-GUID: YGvZ8XxpzKRvFAXdpOdZ5zPReHFkXjq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1011 mlxlogscore=851
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412270093

On 23/12/2024 11:57, Michael S. Tsirkin wrote:
> On Fri, Dec 20, 2024 at 05:47:11PM +0100, Alexander Gordeev wrote:
>> Hi,
>>
>> Currently there are two device IDs assigned for the future virtio video device:
>>  * 30 for the encoder
>>  * 31 for the decoder
>> I received feedback from our internal reviewers that in some cases it would be better to use as few virtqueues as possible. So if a single piece of HW supports both encoder and decoder functions, then it is better to have a single virtual device, that provides both functions as well. The specific function can be selected per stream then.
>> Is it OK to make changes to the reserved IDs?
>> Are there any other concerns?
>>
>> Thanks
> 
> Basically, we need to make sure there are no conflicts.
> The IDs were reserved by google and chromium guys.
> If you want to make changes, get in touch with them
> and get their ACK please.
> 
> But generally, it's easier to just reserve another ID
> for an encoder/decoder device.
> We are not short on these.
> 

Thanks! Yes, I think we'll just reserve another ID indeed.
Maybe the old ones would become useful again later.
