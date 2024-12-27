Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013FC12C475
	for <virtio-comment@lists.linux.dev>; Fri, 27 Dec 2024 11:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735298151; cv=none; b=DrpDkCEfWZQMPjf0+PD7M20E7w8j/pN8yEHw5SgM2N6CCkLXHNfZ3H9GOhJi44S+CAYOV0S8MDsa9M5UdJAppdsxiHhB2HddV9MPH0+jhO37RYAi32r/hOtLWG40gAw/aSYH2Hujqc40y0/aV2t8PiKN6xJP6JfvoXiocr01sTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735298151; c=relaxed/simple;
	bh=8Qhs4gW6RGwU26owXzX/J3CwKNUnjj7Kcm+0OMAEp3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BjRuRvLDzhIrU/URcV6XwdZTiedwppSbYeVs1M870uwQtQsp2TbUHkiWcbdJXVV1hyLagaDGcw/JEemATrj0KPEZEFjA2v1LRDKMBq4FGce3J4Dz4GIDTg6TcMAje5rjCLGMMOgfLzgqqpOpXwuiAAY+9IKqsHHxlGS3BZtm5oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Dun6JcBD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Dun6JcBD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR8dlAB015586;
	Fri, 27 Dec 2024 11:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MWT0f1k7kdNb0QDNCLnSvTPP/8rag+ja5giw73bDcbE=; b=Dun6JcBDjfzuZGiz
	S5KNzwsfXXCuZugiANpZUOvR6AWlzSKsLaE+wnLdhDytr0p70m6q1b1VtoJquMRP
	drqMdkfRcVs7E8+rU4/R2teUTventYTp8fwXVz2acitC8VXdNt2wUp4QmXJYGl4M
	y6FWTEX2uAErdf2N10G5y4w3IyN1c7oDk5zeDxh4Zm34zBO0JyrfZnOa03AOEwh3
	NuPl3Baqbl+6CpF06Z4Wms8nU7H1HBzkAoN40YCRf66mgNXX0TjEPBQyfPpMxXon
	pVLi3Ta6vO/PkkCnDv7MLNRiIbVGj06arbExopHNx+SX8YLffzv3TwJ1B83Cem9S
	VnMqTg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43srwyry5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 11:15:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BRBFljs019762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 11:15:47 GMT
Received: from [10.111.128.138] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Dec
 2024 03:15:46 -0800
Message-ID: <eb8370fe-a4df-4a36-a2b6-e9f2bef9fab1@quicinc.com>
Date: Fri, 27 Dec 2024 12:15:44 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: virtio-video device IDs
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri
	<quic_svaddagi@quicinc.com>
References: <bbef01ea-2085-49a8-bc6a-76cf66a6183d@quicinc.com>
 <CY8PR12MB71957E005C26FEC6CDE7170FDC012@CY8PR12MB7195.namprd12.prod.outlook.com>
Content-Language: en-US
From: Alexander Gordeev <quic_agordeev@quicinc.com>
In-Reply-To: <CY8PR12MB71957E005C26FEC6CDE7170FDC012@CY8PR12MB7195.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aiP9wz-JLJtQ_HZj0Vfj_p7KoESCc-vZ
X-Proofpoint-GUID: aiP9wz-JLJtQ_HZj0Vfj_p7KoESCc-vZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412270093

On 22/12/2024 15:14, Parav Pandit wrote:
>> From: Alexander Gordeev <quic_agordeev@quicinc.com>
>> Sent: Friday, December 20, 2024 10:17 PM
>>
>> Hi,
>>
>> Currently there are two device IDs assigned for the future virtio video device:
>>  * 30 for the encoder
>>  * 31 for the decoder
>> I received feedback from our internal reviewers that in some cases it would
>> be better to use as few virtqueues as possible. So if a single piece of HW
>> supports both encoder and decoder functions, then it is better to have a
>> single virtual device, that provides both functions as well. The specific
>> function can be selected per stream then.
>> Is it OK to make changes to the reserved IDs?
>> Are there any other concerns?
>>
>> Thanks
> 
> For the new device usually, there is a new device id.
> May be you can explore how to merge the functionality using capabilities or feature bits to 
> a. either extend encoder to have additional decoder
> or
> b. extend decoded to have the encoder
> 
> and than the description can be changed.
> 
> Or 
> c. if the new device has major functionality and performance, may be its own.
> 
> I believe the details would be useful to find the suitable option from the 3 choices.

I don't understand option 3. Perhaps there are typos.
At the moment I think we'll choose option 1. Thanks!
